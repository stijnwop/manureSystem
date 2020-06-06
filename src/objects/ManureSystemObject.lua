----------------------------------------------------------------------------------------------------
-- ManureSystemObject
----------------------------------------------------------------------------------------------------
-- Purpose: base object class for manure system objects.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemObject
ManureSystemObject = {}
ManureSystemObject.NAME = "ManureSystemObject"

local ManureSystemObject_mt = Class(ManureSystemObject, Object)
InitObjectClass(ManureSystemObject, ManureSystemObject.NAME)

---Creates a new instance of the `ManureSystemObject`.
---@return ManureSystemObject
function ManureSystemObject:new(parent, isServer, isClient, mt)
    local self = Object:new(isServer, isClient, mt or ManureSystemObject_mt)

    self.parent = parent

    return self
end

---Called on load.
function ManureSystemObject:load(xmlFile, baseKey, baseNode)
    self.nodeId = baseNode

    self.allowFillArm = Utils.getNoNil(getXMLBool(xmlFile, baseKey .. ".manureSystemFillArmReceiver#allowFillArm"), true)
    self.fillArmOffset = Utils.getNoNil(getXMLFloat(xmlFile, baseKey .. ".manureSystemFillArmReceiver#fillArmOffset"), 0)

    self.connectorStrategies = {}
    self.manureSystemConnectors = {}
    self.manureSystemConnectorsByType = {}

    --Prepare for hose physics
    self.rootNode = ManureSystemUtil.getFirstPhysicsNode(baseNode)
    local rootNodeStr = getXMLString(xmlFile, baseKey .. ".manureSystemConnectors#rootNode")
    if rootNodeStr ~= nil then
        self.rootNode = I3DUtil.indexToObject(self.nodeId, rootNodeStr)
    end

    self.components = { { node = self.nodeId } }
    self.xmlFile = xmlFile

    local i = 0
    while true do
        local key = ("%s.manureSystemConnectors.connector(%d)"):format(baseKey, i)

        if not hasXMLProperty(self.xmlFile, key) then
            break
        end

        local typeString = Utils.getNoNil(getXMLString(self.xmlFile, key .. "#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            g_logManager:xmlWarning("ManureSystemObject", "Invalid connector type %s", typeString)
            type = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if self.manureSystemConnectorsByType[type] == nil then
            self.manureSystemConnectorsByType[type] = {}
        end

        if self.connectorStrategies[type] == nil then
            self.connectorStrategies[type] = g_manureSystem.connectorManager:getConnectorStrategy(type, self)
        end

        local connector = { type = type }
        if self:loadManureSystemConnectorFromXML(connector, self.xmlFile, key, i) then
            if self.connectorStrategies[type]:load(connector, self.xmlFile, key) then
                table.insert(self.manureSystemConnectors, connector)
                table.insert(self.manureSystemConnectorsByType[type], connector)
            end
        end

        i = i + 1
    end

    --Set component node on a physics node after loading.
    self.components = { { node = self.rootNode } }
    self.xmlFile = nil

    if #self.manureSystemConnectors ~= 0 then
        --Register ourselves when we have connectors.
        self:register(true)

        g_manureSystem:addConnectorObject(self)
    end

    return true
end

---Called on delete.
function ManureSystemObject:delete()
    for type, connectors in pairs(self.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            self.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorObject(self)
end

---Called on update.
function ManureSystemObject:update(dt)
    if self.connectorStrategies ~= nil then
        for _, class in pairs(self.connectorStrategies) do
            if class.onUpdate ~= nil then
                class:onUpdate(dt)
            end
        end
    end
end

---Call parent object to raise flag.
function ManureSystemObject:raiseActive()
    self.parent:raiseActive()
end

---Get the object name.
function ManureSystemObject:getName()
    return ManureSystemObject.NAME
end

---Returns a list of all the connectors.
function ManureSystemObject:getConnectors()
    return self.manureSystemConnectors
end

---Returns a connector for the given id.
function ManureSystemObject:getConnectorById(id)
    return self.manureSystemConnectors[id]
end

---Returns a list of connectors based on the given type.
function ManureSystemObject:getConnectorsByType(type)
    local types = self.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end
    --Given type does not exist, so return empty table.
    return {}
end

---Sets the `isConnected` state on the connector with additional information of the connected hose object, if present it will play the animations.
function ManureSystemObject:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.isConnected ~= state then
        ManureSystemConnectorIsConnectedEvent.sendEvent(self, id, state, grabNodeId, hose, noEventSend)

        if connector.lockAnimationIndex ~= nil then
            local dir = state and 1 or -1
            if self.parent.playAnimation ~= nil then
                self.parent:playAnimation(connector.lockAnimationIndex, dir)
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

---Sets the `hasOpenManureFlow` state on the connector, if present it will play the animations.
function ManureSystemObject:setIsManureFlowOpen(id, state, force, noEventSend)
    local connector = self:getConnectorById(id)

    if not connector.isParkPlace and connector.hasOpenManureFlow ~= state or force then
        ManureSystemConnectorManureFlowEvent.sendEvent(self, id, state, force, noEventSend)

        connector.hasOpenManureFlow = state

        if connector.manureFlowAnimationIndex ~= nil and self.parent.playAnimation ~= nil then
            local canPlayAnimation = force or not self.parent:getIsAnimationPlaying(connector.manureFlowAnimationIndex)

            if canPlayAnimation then
                local dir = state and 1 or -1
                self.parent:playAnimation(connector.manureFlowAnimationIndex, dir)
            end
        end
    end
end

---Loads connector attributes from the xml.
function ManureSystemObject:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
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

----------------------------
-- Function to allow pump --
----------------------------

function ManureSystemObject:getFillUnitFillType(unitIndex)
    return FillType.UNKNOWN
end

function ManureSystemObject:getFillUnitAllowsFillType(_, fillType)
    return false
end

function ManureSystemObject:getFillUnitFillLevel(unitIndex)
    return 0
end

function ManureSystemObject:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return fillLevel / capacity
end

function ManureSystemObject:getFillUnitCapacity(unitIndex)
    return 0
end

function ManureSystemObject:getFillUnitFreeCapacity(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return capacity - fillLevel
end

function ManureSystemObject:getIsToolTypeAllowed(toolType)
    return true
end

function ManureSystemObject:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    return movedFillLevel
end
