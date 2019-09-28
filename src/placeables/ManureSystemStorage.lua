----------------------------------------------------------------------------------------------------
-- ManureSystemStorage
----------------------------------------------------------------------------------------------------
-- Purpose: Single storage placeable with Manure System support.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

ManureSystemStorage = {}

ManureSystemStorage.NO_RIGID_BODY = "norigidbody"

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
    g_currentMission.storageSystem:removeStorage(self.storage)

    -- Delete storage later to avoid access to already deleted storage
    self.storage:delete()

    for type, connectors in pairs(self.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            self.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorObject(self)

    unregisterObjectClassName(self)

    ManureSystemStorage:superClass().delete(self)
end

function ManureSystemStorage.getFirstPhysicsNode(node)
    if getRigidBodyType(node):lower() == ManureSystemStorage.NO_RIGID_BODY then
        for i = 1, getNumOfChildren(node) do
            local childNode = getChildAt(node, i - 1)
            if getRigidBodyType(childNode):lower() ~= ManureSystemStorage.NO_RIGID_BODY then
                return childNode
            end
        end
    end

    return node
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

    self.planeNode = I3DUtil.indexToObject(self.nodeId, getXMLString(xmlFile, "placeable.manureSystemLagoon#planeNode"))

    if self.planeNode ~= nil then
        self.planeMoveMinY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeMinY"), 0)
        self.planeMoveMaxY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeMaxY"), 0)
        self.planeOffsetY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeOffsetY"), 0)
    end

    self.lagoonDirtyFlag = self:getNextDirtyFlag()

    -- Prepare for hose physics
    self.rootNode = ManureSystemStorage.getFirstPhysicsNode(self.nodeId)
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

        local connector = {}
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
            self:updateFillPlaneHeight(self:getFillUnitFillLevel())
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

    self:updateFillPlaneHeight(self:getFillUnitFillLevel())

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
end

function ManureSystemStorage:finalizePlacement()
    ManureSystemStorage:superClass().finalizePlacement(self)

    local storageSystem = g_currentMission.storageSystem

    self.storage:setOwnerFarmId(self:getOwnerFarmId(), true)
    storageSystem:addStorage(self.storage)
    self.storage:register(true)

    if #self.manureSystemConnectors ~= 0 then
        log("Adding connector to: " .. self.configFileName)
        g_manureSystem:addConnectorObject(self)
    end
end

function ManureSystemStorage:update(dt)
    ManureSystemStorage:superClass().update(self, dt)

    for _, class in pairs(self.connectorStrategies) do
        if class.onUpdate ~= nil then
            class:onUpdate(dt)
        end
    end
end

function ManureSystemStorage:getFillUnitFillType(unitIndex)
    if self.storage ~= nil then
        for fillType, _ in pairs(self.storage.fillTypes) do
            return fillType -- only support first
        end
    end

    return FillType.UNKNOWN
end

function ManureSystemStorage:getFillUnitAllowsFillType(_, fillType)
    return self.storage:getIsFillTypeSupported(fillType)
end

function ManureSystemStorage:getFillUnitFillLevel(unitIndex)
    local fillType = self:getFillUnitFillType()
    return self.storage:getFillLevel(fillType)
end

function ManureSystemStorage:getFillUnitCapacity(unitIndex)
    return self.storage.capacityPerFillType
end

function ManureSystemStorage:onMovedFillLevel(fillLevel)
    self:updateFillPlaneHeight(fillLevel)
    self:raiseDirtyFlags(self.lagoonDirtyFlag)
end

function ManureSystemStorage:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    if self.storage:getIsFillTypeSupported(fillTypeIndex) and self:getIsToolTypeAllowed(toolType) then
        if self:hasFarmAccessToStorage(farmId, self.storage) then
            if self.storage:getFreeCapacity(fillTypeIndex) > 0 then
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

function ManureSystemStorage:updateFillPlaneHeight(fillLevel)
    if self.isClient and self.planeNode ~= nil then
        local x, _, z = getTranslation(self.planeNode)
        local y = self.planeMoveMinY + (self.planeMoveMaxY - self.planeMoveMinY) * fillLevel / self:getFillUnitCapacity()
        setTranslation(self.planeNode, x, y, z)
    end
end

function ManureSystemStorage:isUnderFillPlane(x, y, z)
    if self.planeNode == nil then
        return true
    end

    local _, py, _ = getWorldTranslation(self.planeNode)
    py = py + self.planeOffsetY

    return py >= y
end

--- Animation functions that should exist in the animated object class, but does not.

function ManureSystemStorage:getIsAnimationPlaying(id)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.isMoving
    end

    return false
end

function ManureSystemStorage:getAnimationTime(id)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.animation.time
    end

    return 0
end

function ManureSystemStorage:playAnimation(id, dir)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        animatedObject.animation.direction = dir
        animatedObject:raiseActive()
    end
end


