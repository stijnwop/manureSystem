----------------------------------------------------------------------------------------------------
-- ManureSystemHusbandryModuleLiquidManure
----------------------------------------------------------------------------------------------------
-- Purpose: Add manure system support to the animal husbandry.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemHusbandryModuleLiquidManure
ManureSystemHusbandryModuleLiquidManure = {}

local ManureSystemHusbandryModuleLiquidManure_mt = Class(ManureSystemHusbandryModuleLiquidManure)

function ManureSystemHusbandryModuleLiquidManure:new(isClient, isServer, mission, input)
    local self = setmetatable({}, ManureSystemHusbandryModuleLiquidManure_mt)

    self.isClient = isClient
    self.isServer = isServer
    self.mission = mission
    self.input = input

    AnimalHusbandry.update = Utils.appendedFunction(AnimalHusbandry.update, ManureSystemHusbandryModuleLiquidManure.inj_husbandry_update)

    HusbandryModuleLiquidManure.load = Utils.overwrittenFunction(HusbandryModuleLiquidManure.load, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_load)
    HusbandryModuleLiquidManure.loadFromXMLFile = Utils.appendedFunction(HusbandryModuleLiquidManure.loadFromXMLFile, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_loadFromXMLFile)
    HusbandryModuleLiquidManure.saveToXMLFile = Utils.appendedFunction(HusbandryModuleLiquidManure.saveToXMLFile, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_saveToXMLFile)
    HusbandryModuleLiquidManure.delete = Utils.appendedFunction(HusbandryModuleLiquidManure.delete, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_delete)
    HusbandryModuleLiquidManure.finalizePlacement = Utils.overwrittenFunction(HusbandryModuleLiquidManure.finalizePlacement, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_finalizePlacement)
    HusbandryModuleLiquidManure.readStream = Utils.appendedFunction(HusbandryModuleLiquidManure.readStream, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_readStream)
    HusbandryModuleLiquidManure.writeStream = Utils.appendedFunction(HusbandryModuleLiquidManure.writeStream, ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_writeStream)

    return self
end

function ManureSystemHusbandryModuleLiquidManure:delete()
end

function ManureSystemHusbandryModuleLiquidManure:update(dt)
end

function ManureSystemHusbandryModuleLiquidManure.setupVanillaHusbandry(xmlFile, xmlFileName)
    if xmlFileName == "data/placeables/animalHusbandry/husbandryCow.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryCowLarge.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryPig.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryPigLarge.xml" then
        setXMLBool(xmlFile, ("placeable.manureSystemFillArmReceiver#allowFillArm"), false) -- vanilla husbandry does not support fill arms.
        setXMLString(xmlFile, "placeable.manureSystemConnectors#rootNode", "0|3")

        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#linkNode"):format(0), "0|3")
        setXMLBool(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
        setXMLFloat(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2)
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#position"):format(0), "3.45 1.025 1.35")
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 0")
    end
end

-------------------------------------------------------------
-- Injections
-------------------------------------------------------------

function ManureSystemHusbandryModuleLiquidManure.inj_husbandry_update(husbandry, dt)
    local liquidManureModule = husbandry:getModuleByName("liquidManure")
    if liquidManureModule ~= nil and liquidManureModule.connectorStrategies ~= nil then
        for _, class in pairs(liquidManureModule.connectorStrategies) do
            if class.onUpdate ~= nil then
                class:onUpdate(dt)
            end
        end
    end
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_load(module, superFunc, xmlFile, configKey, rootNode, ...)
    if not superFunc(module, xmlFile, configKey, rootNode, ...) then
        return false
    end

    local name = module.owner.configFileName
    module.configFileName = name

    ManureSystemHusbandryModuleLiquidManure.setupVanillaHusbandry(xmlFile, name)

    module.connectorStrategies = {}
    module.manureSystemConnectors = {}
    module.manureSystemConnectorsByType = {}

    module.allowFillArm = Utils.getNoNil(getXMLBool(xmlFile, "placeable.manureSystemFillArmReceiver#allowFillArm"), true)
    module.fillArmOffset = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemFillArmReceiver#fillArmOffset"), 0)

    -- Prepare for hose physics
    module.rootNode = ManureSystemUtil.getFirstPhysicsNode(rootNode)
    local rootNodeStr = getXMLString(xmlFile, "placeable.manureSystemConnectors#rootNode")
    if rootNodeStr ~= nil then
        module.rootNode = I3DUtil.indexToObject(module.owner.nodeId, rootNodeStr)
    end

    module.components = { { node = module.owner.nodeId } }
    module.xmlFile = xmlFile

    local i = 0
    while true do
        local baseKey = ("placeable.manureSystemConnectors.connector(%d)"):format(i)

        if not hasXMLProperty(module.xmlFile, baseKey) then
            break
        end

        local typeString = Utils.getNoNil(getXMLString(module.xmlFile, baseKey .. "#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            g_logManager:xmlWarning(module.owner.configFileName, "Invalid connector type %s", typeString)
            type = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if module.manureSystemConnectorsByType[type] == nil then
            module.manureSystemConnectorsByType[type] = {}
        end

        if module.connectorStrategies[type] == nil then
            module.connectorStrategies[type] = g_manureSystem.connectorManager:getConnectorStrategy(type, module.owner)
        end

        local connector = { type = type }
        if module:loadManureSystemConnectorFromXML(connector, module.xmlFile, baseKey, i) then
            if module.connectorStrategies[type]:load(connector, module.xmlFile, baseKey) then
                table.insert(module.manureSystemConnectors, connector)
                table.insert(module.manureSystemConnectorsByType[type], connector)
            end
        end

        i = i + 1
    end

    -- Set component node on a physics node after loading.
    module.components = { { node = module.rootNode } }

    -- Set attributes on the owner
    module.owner.rootNode = module.rootNode
    module.owner.components = module.components

    module.xmlFile = nil

    return true
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_readStream(module, streamId, connection)
    if connection:getIsServer() then
        for type, connectors in pairs(module.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = module.connectorStrategies[type]
                if class.onReadStream ~= nil then
                    class:onReadStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_writeStream(module, streamId, connection)
    if not connection:getIsServer() then
        for type, connectors in pairs(module.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = module.connectorStrategies[type]
                if class.onWriteStream ~= nil then
                    class:onWriteStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_delete(module)
    for type, connectors in pairs(module.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            module.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorObject(module.owner)
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_loadFromXMLFile(module, xmlFile, key)
    local i = 0
    while true do
        local connectorKey = ("%s.manureSystemConnectors.connector(%d)"):format(key, i)
        if not hasXMLProperty(xmlFile, connectorKey) then
            break
        end

        local id = getXMLInt(xmlFile, connectorKey .. "#id")
        local connector = module.owner:getConnectorById(id)

        local isConnected = getXMLBool(xmlFile, connectorKey .. "#isConnected")
        if not isConnected then
            -- Force reset animation.
            module.owner:setIsConnected(id, isConnected)
        end

        module.connectorStrategies[connector.type]:loadFromSavegame(connector, xmlFile, connectorKey)

        i = i + 1
    end
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_saveToXMLFile(module, xmlFile, key, usedModNames)
    for id, connector in pairs(module.manureSystemConnectors) do
        local connectorKey = string.format("%s.manureSystemConnectors.connector(%d)", key, id - 1)
        setXMLInt(xmlFile, connectorKey .. "#id", id)
        setXMLBool(xmlFile, connectorKey .. "#isConnected", connector.isConnected)

        module.connectorStrategies[connector.type]:saveToSavegame(connector, xmlFile, connectorKey)
    end
end

function ManureSystemHusbandryModuleLiquidManure.inj_husbandryModule_finalizePlacement(module, superFunc)
    if #module.manureSystemConnectors ~= 0 then
        g_manureSystem:addConnectorObject(module.owner)
    end

    return superFunc(module)
end

-------------------------------------------------------------
-- New methods on the HusbandryModuleLiquidManure class
-------------------------------------------------------------

function HusbandryModuleLiquidManure:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
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

------------------------------------------------
-- New methods on the AnimalHusbandry class
------------------------------------------------

---Checks if the given Y translation is under the fill plane.
function AnimalHusbandry:isUnderFillPlane(x, y, z)
    local liquidManureModule = self:getModuleByName("liquidManure")

    if liquidManureModule ~= nil then
        if not liquidManureModule.allowFillArm then
            return false
        end

        local node = liquidManureModule.fillPlane.node
        if node == nil then
            return true
        end

        local _, py, _ = getWorldTranslation(node)
        py = py + liquidManureModule.fillArmOffset

        return py >= y
    end

    return false
end

---Gets the fillUnit index for the fill arm.
function AnimalHusbandry:getFillArmFillUnitIndex()
    -- Always 1 since we don't support multi unit storage.
    return 1
end

function AnimalHusbandry:getFillUnitFillType(unitIndex)
    local liquidManureModule = self:getModuleByName("liquidManure")
    for fillTypeIndex, _ in pairs(liquidManureModule.loadPlace.fillTypes) do
        local fillLevel = liquidManureModule:getFillLevel(fillTypeIndex)

        if fillLevel > 0 then
            return fillTypeIndex
        end
    end

    return FillType.UNKNOWN
end

function AnimalHusbandry:getFillUnitAllowsFillType(_, fillType)
    local liquidManureModule = self:getModuleByName("liquidManure")
    return liquidManureModule:getIsFillTypeAllowed(fillType)
end

function AnimalHusbandry:getFillUnitFillLevel(unitIndex)
    local liquidManureModule = self:getModuleByName("liquidManure")
    local fillType = self:getFillUnitFillType()
    return liquidManureModule:getFillLevel(fillType)
end

function AnimalHusbandry:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return fillLevel / capacity
end

function AnimalHusbandry:getFillUnitCapacity(unitIndex)
    local liquidManureModule = self:getModuleByName("liquidManure")
    return liquidManureModule:getCapacity()
end

function AnimalHusbandry:getFillUnitFreeCapacity(unitIndex)
    local liquidManureModule = self:getModuleByName("liquidManure")
    return liquidManureModule:getFreeCapacity()
end

function AnimalHusbandry:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local liquidManureModule = self:getModuleByName("liquidManure")

    local movedFillLevel = 0
    if liquidManureModule:getIsToolTypeAllowed(toolType) then
        movedFillLevel = liquidManureModule:addFillLevelFromTool(farmId, fillLevelDelta, fillTypeIndex)
    end

    return movedFillLevel
end

function AnimalHusbandry:getConnectorsByType(type)
    local liquidManureModule = self:getModuleByName("liquidManure")
    local types = liquidManureModule.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end

    return {}
end

function AnimalHusbandry:getConnectorById(id)
    local liquidManureModule = self:getModuleByName("liquidManure")
    return liquidManureModule.manureSystemConnectors[id]
end

function AnimalHusbandry:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.isConnected ~= state then
        ManureSystemConnectorIsConnectedEvent.sendEvent(self, id, state, grabNodeId, hose, noEventSend)

        if connector.lockAnimationIndex ~= nil then
            local dir = state and 1 or -1
            self:playAnimation(connector.lockAnimationIndex, dir)
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

function AnimalHusbandry:setIsManureFlowOpen(id, state, force, noEventSend)
    local connector = self:getConnectorById(id)

    if not connector.isParkPlace and connector.hasOpenManureFlow ~= state or force then
        ManureSystemConnectorManureFlowEvent.sendEvent(self, id, state, force, noEventSend)

        connector.hasOpenManureFlow = state

        if connector.manureFlowAnimationIndex ~= nil then
            local canPlayAnimation = force or not self:getIsAnimationPlaying(connector.manureFlowAnimationIndex)

            if canPlayAnimation then
                local dir = state and 1 or -1
                self:playAnimation(connector.manureFlowAnimationIndex, dir)
            end
        end
    end
end
