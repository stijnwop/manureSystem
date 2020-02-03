----------------------------------------------------------------------------------------------------
-- ManureSystemStorage
----------------------------------------------------------------------------------------------------
-- Purpose: Single storage placeable with Manure System support.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

ManureSystemStorage = {}

local ManureSystemStorage_mt = Class(ManureSystemStorage, Placeable)

InitObjectClass(ManureSystemStorage, "ManureSystemStorage")

function ManureSystemStorage:new(isServer, isClient)
    local instance = Placeable:new(isServer, isClient, ManureSystemStorage_mt)

    instance.connectorStrategies = {}
    instance.manureSystemConnectors = {}
    instance.manureSystemConnectorsByType = {}

    return instance
end

function ManureSystemStorage:delete()
    if self.triggerNode ~= nil then
        removeTrigger(self.triggerNode)
    end

    g_currentMission.storageSystem:removeStorage(self.storage)

    self.fillPlane:delete()

    -- Delete storage later to avoid access to already deleted storage
    self.storage:delete()

    for type, connectors in pairs(self.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            self.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorObject(self)
    g_currentMission:removeActivatableObject(self)

    unregisterObjectClassName(self)

    ManureSystemStorage:superClass().delete(self)
end

function ManureSystemStorage:load(xmlFilename, x, y, z, rx, ry, rz, initRandom)
    if not ManureSystemStorage:superClass().load(self, xmlFilename, x, y, z, rx, ry, rz, initRandom) then
        return false
    end

    local xmlFile = loadXMLFile("manureSystemStorage", xmlFilename)
    self.xmlFile = xmlFile

    local storageKey = string.format("placeable.manureSystemStorage.storage")

    local storageNode = I3DUtil.indexToObject(self.nodeId, getXMLString(xmlFile, storageKey .. "#node"))
    if storageNode ~= nil then
        local storage = Storage:new(self.isServer, self.isClient)
        if storage:load(storageNode, xmlFile, storageKey) then
            storage.ownerFarmId = 1
            self.storage = storage
        end
    else
        g_logManager:xmlWarning(xmlFilename, "Missing 'node' for storage '%s'!", storageKey)
        return false
    end

    self.fillPlane = ManureSystemFillPlane:new(self)
    self.fillPlane:load(self.nodeId, xmlFile, "placeable.manureSystemStorage.fillPlane", self:getFillUnitCapacity())

    local triggerNode = I3DUtil.indexToObject(self.nodeId, getXMLString(xmlFile, "placeable.manureSystemStorage.trigger#node"))
    if triggerNode == nil then
        --g_logManager:xmlWarning(self.configFileName, "Invalid connector type %s", typeString)
        print("Error: ManureSystemStorage could not load trigger. Check the user attribute 'triggerNode'")
        printCallstack()
        return false
    end

    self.triggerNode = triggerNode
    self.activateText = g_i18n:getText("action_enableMixer")
    self.playerInRange = false
    addTrigger(triggerNode, "triggerCallback", self)

    -- Prepare for hose physics
    self.rootNode = ManureSystemUtil.getFirstPhysicsNode(self.nodeId)
    self.components = { { node = self.nodeId } }

    local i = 0
    while true do
        local baseKey = ("placeable.manureSystemConnectors.connector(%d)"):format(i)

        if not hasXMLProperty(self.xmlFile, baseKey) then
            break
        end

        local typeString = Utils.getNoNil(getXMLString(self.xmlFile, baseKey .. "#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            g_logManager:xmlWarning(self.configFileName, "Invalid connector type %s", typeString)
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

    delete(self.xmlFile)
    self.xmlFile = nil
    registerObjectClassName(self, "ManureSystemStorage")

    self.lagoonDirtyFlag = self:getNextDirtyFlag()

    return true
end

function ManureSystemStorage:readStream(streamId, connection)
    ManureSystemStorage:superClass().readStream(self, streamId, connection)
    if connection:getIsServer() then
        local storageId = NetworkUtil.readNodeObjectId(streamId)
        self.storage:readStream(streamId, connection)
        g_client:finishRegisterObject(self.storage, storageId)

        for type, connectors in pairs(self.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = self.connectorStrategies[type]
                if class.onReadStream ~= nil then
                    class:onReadStream(connector, streamId, connection)
                end
            end
        end

        self.fillPlane:setHeight(self:getFillUnitFillLevel())
    end
end

function ManureSystemStorage:writeStream(streamId, connection)
    ManureSystemStorage:superClass().writeStream(self, streamId, connection)
    if not connection:getIsServer() then
        NetworkUtil.writeNodeObjectId(streamId, NetworkUtil.getObjectId(self.storage))
        self.storage:writeStream(streamId, connection)
        g_server:registerObjectInStream(connection, self.storage)

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

function ManureSystemStorage:readUpdateStream(streamId, timestamp, connection)
    ManureSystemStorage:superClass().readUpdateStream(self, streamId, timestamp, connection)

    if connection:getIsServer() then
        if streamReadBool(streamId) then
            self.fillPlane:setHeight(self:getFillUnitFillLevel())
        end
    end
end

function ManureSystemStorage:writeUpdateStream(streamId, connection, dirtyMask)
    ManureSystemStorage:superClass().writeUpdateStream(self, streamId, connection, dirtyMask)

    if not connection:getIsServer() then
        streamWriteBool(streamId, bitAND(dirtyMask, self.lagoonDirtyFlag) ~= 0)
    end
end

function ManureSystemStorage:loadFromXMLFile(xmlFile, key, resetVehicles)
    if not ManureSystemStorage:superClass().loadFromXMLFile(self, xmlFile, key, resetVehicles) then
        return false
    end

    local storageKey = string.format("%s.storage", key)
    if not self.storage:loadFromXMLFile(xmlFile, storageKey) then
        return false
    end

    self.fillPlane:setHeight(self:getFillUnitFillLevel())

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

    return true
end

function ManureSystemStorage:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
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

function ManureSystemStorage:saveToXMLFile(xmlFile, key, usedModNames)
    ManureSystemStorage:superClass().saveToXMLFile(self, xmlFile, key, usedModNames)

    local storageKey = string.format("%s.storage", key)
    self.storage:saveToXMLFile(xmlFile, storageKey, usedModNames)

    for id, connector in pairs(self.manureSystemConnectors) do
        local connectorKey = string.format("%s.manureSystemConnectors.connector(%d)", key, id - 1)
        setXMLInt(xmlFile, connectorKey .. "#id", id)
        setXMLBool(xmlFile, connectorKey .. "#isConnected", connector.isConnected)

        self.connectorStrategies[connector.type]:saveToSavegame(connector, xmlFile, connectorKey)
    end
end

function ManureSystemStorage:finalizePlacement()
    ManureSystemStorage:superClass().finalizePlacement(self)

    local storageSystem = g_currentMission.storageSystem

    self.storage:setOwnerFarmId(self:getOwnerFarmId(), true)
    storageSystem:addStorage(self.storage)
    self.storage:register(true)

    if #self.manureSystemConnectors ~= 0 then
        g_manureSystem:addConnectorObject(self)
    end
end

function ManureSystemStorage:hourChanged()
    ManureSystemStorage:superClass().hourChanged(self)
    -- Todo: update manure thickness.
end

function ManureSystemStorage:update(dt)
    ManureSystemStorage:superClass().update(self, dt)

    for _, class in pairs(self.connectorStrategies) do
        if class.onUpdate ~= nil then
            class:onUpdate(dt)
        end
    end

    if self.isClient then
        if self.playerInRange then
            local capacity = self:getFillUnitCapacity()
            local fillLevel = self:getFillUnitFillLevel()
            local fillType = g_fillTypeManager:getFillTypeByIndex(self:getFillUnitFillType())
            local fillTypeName = ""
            if fillType ~= nil then
                fillTypeName = fillType.title
            end

            local text = string.format(g_i18n:getText("info_fillLevel") .. " %s: %s (%d%%)", fillTypeName, g_i18n:formatFluid(fillLevel), math.floor(100 * fillLevel / capacity))
            g_currentMission:addExtraPrintText(text)
            self:raiseActive()
        end
    end
end

function ManureSystemStorage:getFillUnitFillType(unitIndex)
    if self.storage ~= nil then
        for fillType, fillLevel in pairs(self.storage.fillLevels) do
            if fillLevel > 0 then
                return fillType -- only support first
            end
        end
    end

    return FillType.UNKNOWN
end

function ManureSystemStorage:getFillUnitAllowsFillType(_, fillType)
    -- Only limit to a single fill type.
    for fillLevelType, fillLevel in pairs(self.storage.fillLevels) do
        if fillType ~= fillLevelType and fillLevel > 0 then
            return false
        end
    end

    return self.storage:getIsFillTypeSupported(fillType)
end

function ManureSystemStorage:getFillUnitFillLevel(unitIndex)
    local fillType = self:getFillUnitFillType()
    return self.storage:getFillLevel(fillType)
end

function ManureSystemStorage:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return fillLevel / capacity
end

function ManureSystemStorage:getFillUnitCapacity(unitIndex)
    return self.storage.capacityPerFillType
end

function ManureSystemStorage:getFillUnitFreeCapacity(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return capacity - fillLevel
end

function ManureSystemStorage:onMovedFillLevel(fillLevel)
    self.fillPlane:setHeight(fillLevel)
    self:raiseDirtyFlags(self.lagoonDirtyFlag)
end

function ManureSystemStorage:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    if self.storage:getIsFillTypeSupported(fillTypeIndex) and self:getIsToolTypeAllowed(toolType) then
        if self:hasFarmAccessToStorage(farmId, self.storage) then
            local oldFillLevel = self.storage:getFillLevel(fillTypeIndex)
            self.storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
            local newFillLevel = self.storage:getFillLevel(fillTypeIndex)

            movedFillLevel = movedFillLevel + (newFillLevel - oldFillLevel)

            if self.isServer then
                self:onMovedFillLevel(newFillLevel)
            end
        end

        if movedFillLevel >= fillLevelDelta - 0.001 then
            movedFillLevel = fillLevelDelta
        end
    end

    return movedFillLevel
end

function ManureSystemStorage:getIsToolTypeAllowed(toolType)
    return true
end

function ManureSystemStorage:hasFarmAccessToStorage(farmId, storage)
    if self.hasStoragePerFarm then
        return farmId == storage:getOwnerFarmId()
    end

    return g_currentMission.accessHandler:canFarmAccess(farmId, storage)
end

function ManureSystemStorage.loadSpecValueVolume(xmlFile, customEnvironment)
    return getXMLInt(xmlFile, "placeable.manureSystemStorage.storage#capacityPerFillType")
end

function ManureSystemStorage.getSpecValueVolume(storeItem, realItem)
    if storeItem.specs.siloVolume == nil then
        return nil
    end

    return g_i18n:formatVolume(storeItem.specs.siloVolume)
end

function ManureSystemStorage:getConnectorsByType(type)
    local types = self.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end

    return {}
end

function ManureSystemStorage:getConnectorById(id)
    return self.manureSystemConnectors[id]
end

function ManureSystemStorage:setIsConnected(id, state, grabNodeId, hose, noEventSend)
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

function ManureSystemStorage:setIsManureFlowOpen(id, state, force, noEventSend)
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

function ManureSystemStorage:isUnderFillPlane(x, y, z)
    return self.fillPlane:isUnder(x, y, z)
end

function ManureSystemStorage:getIsActivatable()
    if self.storage ~= nil then
        for _, fillLevel in pairs(self.storage.fillLevels) do
            if fillLevel > 0 then
                return true
            end
        end
    end

    return false
end

function ManureSystemStorage:drawActivate()
end

function ManureSystemStorage:onActivateObject()
    -- set mixer
end

function ManureSystemStorage:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId)
    if onEnter or onLeave then
        if g_currentMission.player ~= nil and otherId == g_currentMission.player.rootNode then
            if onEnter then
                self.playerInRange = true
                g_currentMission:removeActivatableObject(self)
                g_currentMission:addActivatableObject(self)
            else
                self.playerInRange = false
                g_currentMission:removeActivatableObject(self)
            end
            self:raiseActive()
        end
    end
end
