----------------------------------------------------------------------------------------------------
-- ManureSystemBga
----------------------------------------------------------------------------------------------------
-- Purpose: Add manure system support to the Bga.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemBga
ManureSystemBga = {}

local ManureSystemBga_mt = Class(ManureSystemBga)

function ManureSystemBga:new(isClient, isServer, mission, input)
    local self = setmetatable({}, ManureSystemBga_mt)

    self.isClient = isClient
    self.isServer = isServer
    self.mission = mission
    self.input = input

    Bga.load = Utils.overwrittenFunction(Bga.load, ManureSystemBga.inj_bga_load)
    Bga.update = Utils.appendedFunction(Bga.update, ManureSystemBga.inj_bga_update)
    Bga.delete = Utils.appendedFunction(Bga.delete, ManureSystemBga.inj_bga_delete)
    Bga.loadFromXMLFile = Utils.appendedFunction(Bga.loadFromXMLFile, ManureSystemBga.inj_bga_loadFromXMLFile)
    Bga.saveToXMLFile = Utils.appendedFunction(Bga.saveToXMLFile, ManureSystemBga.inj_bga_saveToXMLFile)
    Bga.readStream = Utils.appendedFunction(Bga.readStream, ManureSystemBga.inj_bga_readStream)
    Bga.writeStream = Utils.appendedFunction(Bga.writeStream, ManureSystemBga.inj_bga_writeStream)
    BgaPlaceable.finalizePlacement = Utils.appendedFunction(BgaPlaceable.finalizePlacement, ManureSystemBga.inj_bgaPlaceable_finalizePlacement)

    return self
end

function ManureSystemBga.inj_bga_load(self, superFunc, id, xmlFile, key, customEnvironment)
    if not superFunc(self, id, xmlFile, key, customEnvironment) then
        return false
    end

    --if xmlFileName == "data/placeables/animalHusbandry/husbandryCow.xml"then
    --setXMLString(xmlFile, "placeable.bga.manureSystemConnectors#rootNode", "1|0|0")
    --
    --setXMLString(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    --setXMLString(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#linkNode"):format(0), "1|0|0")
    --setXMLBool(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    --setXMLFloat(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2)
    --setXMLString(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#position"):format(0), "0 -8 0")
    --setXMLString(xmlFile, ("placeable.bga.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 0")
    --end

    self.connectorStrategies = {}
    self.manureSystemConnectors = {}
    self.manureSystemConnectorsByType = {}

    -- Prepare for hose physics
    self.rootNode = ManureSystemUtil.getFirstPhysicsNode(id)
    local rootNodeStr = getXMLString(xmlFile, key .. ".manureSystemConnectors#rootNode")
    if rootNodeStr ~= nil then
        self.rootNode = I3DUtil.indexToObject(self.nodeId, rootNodeStr)
    end

    self.components = { { node = self.nodeId } }
    self.xmlFile = xmlFile

    local i = 0
    while true do
        local baseKey = ("%s.manureSystemConnectors.connector(%d)"):format(key, i)

        if not hasXMLProperty(self.xmlFile, baseKey) then
            break
        end

        local typeString = Utils.getNoNil(getXMLString(self.xmlFile, baseKey .. "#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            g_logManager:xmlWarning("Bga", "Invalid connector type %s", typeString)
            type = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if self.manureSystemConnectorsByType[type] == nil then
            self.manureSystemConnectorsByType[type] = {}
        end

        if self.connectorStrategies[type] == nil then
            self.connectorStrategies[type] = g_manureSystem.connectorManager:getConnectorStrategy(type, self)
        end

        local connector = { type = type }
        if self:loadManureSystemConnectorFromXML(connector, self.xmlFile, baseKey, i) then
            if self.connectorStrategies[type]:load(connector, self.xmlFile, baseKey) then
                table.insert(self.manureSystemConnectors, connector)
                table.insert(self.manureSystemConnectorsByType[type], connector)
            end
        end

        i = i + 1
    end

    -- Set component node on a physics node after loading.
    self.components = { { node = self.rootNode } }
    self.xmlFile = nil

    if #self.manureSystemConnectors ~= 0 then
        g_manureSystem:addConnectorObject(self)
    end

    return true
end

function ManureSystemBga.inj_bga_delete(self)
    for type, connectors in pairs(self.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            self.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorObject(self)
end

function ManureSystemBga.inj_bga_readStream(self, streamId, connection)
    if connection:getIsServer() then
        for type, connectors in pairs(self.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = self.connectorStrategies[type]
                if class.onReadStream ~= nil then
                    class:onReadStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemBga.inj_bga_writeStream(self, streamId, connection)
    if not connection:getIsServer() then
        for type, connectors in pairs(self.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = self.connectorStrategies[type]
                if class.onWriteStream ~= nil then
                    class:onWriteStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemBga.inj_bga_update(self, dt)
    if self.connectorStrategies ~= nil then
        for _, class in pairs(self.connectorStrategies) do
            if class.onUpdate ~= nil then
                class:onUpdate(dt)
            end
        end
    end
end

function ManureSystemBga.inj_bga_loadFromXMLFile(self, xmlFile, key)
    local i = 0
    while true do
        local connectorKey = ("%s.manureSystemConnectors.connector(%d)"):format(key, i)
        if not hasXMLProperty(xmlFile, connectorKey) then
            break
        end

        local id = getXMLInt(xmlFile, connectorKey .. "#id")
        local connector = self:getConnectorById(id)

        local isConnected = getXMLBool(xmlFile, connectorKey .. "#isConnected")
        if not isConnected then
            -- Force reset animation.
            self:setIsConnected(id, isConnected)
        end

        self.connectorStrategies[connector.type]:loadFromSavegame(connector, xmlFile, connectorKey)

        i = i + 1
    end
end

function ManureSystemBga.inj_bga_saveToXMLFile(self, xmlFile, key, usedModNames)
    for id, connector in pairs(self.manureSystemConnectors) do
        local connectorKey = string.format("%s.manureSystemConnectors.connector(%d)", key, id - 1)
        setXMLInt(xmlFile, connectorKey .. "#id", id)
        setXMLBool(xmlFile, connectorKey .. "#isConnected", connector.isConnected)

        self.connectorStrategies[connector.type]:saveToSavegame(connector, xmlFile, connectorKey)
    end
end

function ManureSystemBga.inj_bgaPlaceable_finalizePlacement(self)
    self.bga:setOwner(self)
end

-------------------------------------------------------------
-- New methods on the Bga class
-------------------------------------------------------------

function Bga:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
    local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, id)

    if node ~= nil then
        connector.id = id + 1
        connector.node = node
        connector.isConnected = false
        connector.connectedObject = nil
        connector.inRangeDistance = Utils.getNoNil(getXMLFloat(xmlFile, baseKey .. "#inRangeDistance"), 1.3)
        connector.isParkPlace = Utils.getNoNil(getXMLBool(xmlFile, baseKey .. "#isParkPlace"), false)

        return true
    end

    return false
end

---Set owner object (placeable) for playing animations.
function Bga:setOwner(owner)
    self.owner = owner
end

function Bga:getStorage()
    if self.digestateSilo.storages ~= nil then
        return self.digestateSilo.storages[1]
    end

    return nil
end

function Bga:getFillUnitFillType(unitIndex)
    local storage = self:getStorage()
    for fillType, fillLevel in pairs(storage.fillLevels) do
        if fillLevel > 0 then
            return fillType -- only support first
        end
    end

    return FillType.UNKNOWN
end

function Bga:getFillUnitAllowsFillType(_, fillType)
    local storage = self:getStorage()
    for fillLevelType, fillLevel in pairs(storage.fillLevels) do
        if fillType ~= fillLevelType and fillLevel > 0 then
            return false
        end
    end

    return storage:getIsFillTypeSupported(fillType)
end

function Bga:getFillUnitFillLevel(unitIndex)
    local storage = self:getStorage()
    local fillType = self:getFillUnitFillType()
    return storage:getFillLevel(fillType)
end

function Bga:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return fillLevel / capacity
end

function Bga:getFillUnitCapacity(unitIndex)
    local storage = self:getStorage()
    return storage.capacityPerFillType
end

function Bga:getFillUnitFreeCapacity(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return capacity - fillLevel
end

function Bga:getIsToolTypeAllowed(toolType)
    return true
end

function Bga:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    local storage = self:getStorage()
    if storage:getIsFillTypeSupported(fillTypeIndex) and self:getIsToolTypeAllowed(toolType) then
        if self:hasFarmAccessToStorage(farmId, storage) then
            local oldFillLevel = storage:getFillLevel(fillTypeIndex)
            storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
            local newFillLevel = storage:getFillLevel(fillTypeIndex)

            movedFillLevel = movedFillLevel + (newFillLevel - oldFillLevel)
        end

        if movedFillLevel >= fillLevelDelta - 0.001 then
            movedFillLevel = fillLevelDelta
        end
    end

    return movedFillLevel
end

function Bga:hasFarmAccessToStorage(farmId, storage)
    return g_currentMission.accessHandler:canFarmAccess(farmId, storage)
end

function Bga:getConnectorsByType(type)
    local types = self.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end

    return {}
end

function Bga:getConnectorById(id)
    return self.manureSystemConnectors[id]
end

function Bga:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.isConnected ~= state then
        ManureSystemConnectorIsConnectedEvent.sendEvent(self, id, state, grabNodeId, hose, noEventSend)

        if connector.lockAnimationIndex ~= nil then
            local dir = state and 1 or -1
            if self.owner ~= nil then
                self.owner:playAnimation(connector.lockAnimationIndex, dir)
            end
        end

        if connector.manureFlowAnimationIndex == nil then
            self:setIsManureFlowOpen(id, state, false, noEventSend)
        end

        if not state and connector.hasOpenManureFlow then
            self:setIsManureFlowOpen(id, state, true, noEventSend)
        end

        connector.isConnected = state
        connector.connectedObject = hose
        connector.connectedNodeId = grabNodeId
    end
end

function Bga:setIsManureFlowOpen(id, state, force, noEventSend)
    local connector = self:getConnectorById(id)

    if not connector.isParkPlace and connector.hasOpenManureFlow ~= state or force then
        ManureSystemConnectorManureFlowEvent.sendEvent(self, id, state, force, noEventSend)

        connector.hasOpenManureFlow = state

        if connector.manureFlowAnimationIndex ~= nil and self.owner ~= nil then
            local canPlayAnimation = force or not self.owner:getIsAnimationPlaying(connector.manureFlowAnimationIndex)

            if canPlayAnimation then
                local dir = state and 1 or -1
                self.owner:playAnimation(connector.manureFlowAnimationIndex, dir)
            end
        end
    end
end
