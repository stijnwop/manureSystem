----------------------------------------------------------------------------------------------------
-- ManureSystemConnector
----------------------------------------------------------------------------------------------------
-- Purpose: connects different strategies together in order to allow pumping.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnector
ManureSystemConnector = {}

ManureSystemConnector.CONNECTORS_SEND_NUM_BITS = 4 -- 2 ^ 4

function ManureSystemConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

function ManureSystemConnector.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemConnectorFromXML", ManureSystemConnector.loadManureSystemConnectorFromXML)
    SpecializationUtil.registerFunction(vehicleType, "setIsConnected", ManureSystemConnector.setIsConnected)
    SpecializationUtil.registerFunction(vehicleType, "setIsManureFlowOpen", ManureSystemConnector.setIsManureFlowOpen)
    SpecializationUtil.registerFunction(vehicleType, "getConnectors", ManureSystemConnector.getConnectors)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorById", ManureSystemConnector.getConnectorById)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorsByType", ManureSystemConnector.getConnectorsByType)
end

function ManureSystemConnector.registerOverwrittenFunctions(vehicleType)
end

function ManureSystemConnector.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onReadStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onDraw", ManureSystemConnector)
end

function ManureSystemConnector:onLoad(savegame)
    self.spec_manureSystemConnector = ManureSystemUtil.getSpecTable(self, "manureSystemConnector")

    local spec = self.spec_manureSystemConnector

    spec.connectorStrategies = {}
    spec.manureSystemConnectors = {}
    spec.manureSystemConnectorsByType = {}

    local i = 0
    while true do
        local baseKey = ("vehicle.manureSystemConnectors.connector(%d)"):format(i)

        if not hasXMLProperty(self.xmlFile, baseKey) then
            break
        end

        local typeString = Utils.getNoNil(getXMLString(self.xmlFile, baseKey .. '#type'), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            g_logManager:xmlWarning(self.configFileName, "Invalid connector type %s", typeString)
            type = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if spec.manureSystemConnectorsByType[type] == nil then
            spec.manureSystemConnectorsByType[type] = {}
        end

        if spec.connectorStrategies[type] == nil then
            spec.connectorStrategies[type] = g_manureSystem.connectorManager:getConnectorStrategy(type, self)
        end

        local connector = {}
        if self:loadManureSystemConnectorFromXML(connector, self.xmlFile, baseKey, i) then
            if spec.connectorStrategies[type]:load(connector, self.xmlFile, baseKey) then
                table.insert(spec.manureSystemConnectors, connector)
                table.insert(spec.manureSystemConnectorsByType[type], connector)
            end
        end

        i = i + 1
    end

    if #spec.manureSystemConnectors ~= 0 then
        log("Adding connector to: " .. self:getName())
        g_manureSystem:addConnectorVehicle(self)
    end
end

function ManureSystemConnector:onDelete()
    local spec = self.spec_manureSystemConnector

    for type, connectors in pairs(spec.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            spec.connectorStrategies[type]:delete(connector)
        end
    end

    g_manureSystem:removeConnectorVehicle(self)
end

function ManureSystemConnector:onReadStream(streamId, connection)
    local spec = self.spec_manureSystemConnector
    if connection:getIsServer() then
        for type, connectors in pairs(spec.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = spec.connectorStrategies[type]
                if class.onReadStream ~= nil then
                    class:onReadStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemConnector:onWriteStream(streamId, connection)
    local spec = self.spec_manureSystemConnector
    if not connection:getIsServer() then
        for type, connectors in pairs(spec.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local class = spec.connectorStrategies[type]
                if class.onWriteStream ~= nil then
                    class:onWriteStream(connector, streamId, connection)
                end
            end
        end
    end
end

function ManureSystemConnector:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemConnector

    for _, class in pairs(spec.connectorStrategies) do
        if class.onUpdate ~= nil then
            class:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
        end
    end
end

function ManureSystemConnector:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemConnector
end

function ManureSystemConnector:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
    local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, id)

    if node ~= nil then
        connector.id = id + 1
        connector.node = node
        connector.isConnected = false
        connector.connectedObject = nil
        connector.connectedNodeId = nil
        connector.inRangeDistance = Utils.getNoNil(getXMLFloat(xmlFile, baseKey .. "#inRangeDistance"), 1.3)
        connector.isParkPlace = Utils.getNoNil(getXMLBool(xmlFile, baseKey .. "#isParkPlace"), false)
        connector.fillUnitIndex = Utils.getNoNil(getXMLInt(xmlFile, baseKey .. "#fillUnitIndex"), 1)

        return true
    end

    return false
end

function ManureSystemConnector:getConnectors()
    return self.spec_manureSystemConnector.manureSystemConnectors
end

function ManureSystemConnector:getConnectorById(id)
    return self.spec_manureSystemConnector.manureSystemConnectors[id]
end

function ManureSystemConnector:getConnectorsByType(type)
    local types = self.spec_manureSystemConnector.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end

    return {}
end

function ManureSystemConnector:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.isConnected ~= state then
        ManureSystemConnectorIsConnectedEvent.sendEvent(self, id, state, grabNodeId, hose, noEventSend)

        if connector.lockAnimationName ~= nil then
            local dir = state and 1 or -1
            self:playAnimation(connector.lockAnimationName, dir, nil, true)
        end

        if connector.manureFlowAnimationName == nil then
            self:setIsManureFlowOpen(id, state, false, noEventSend)
        end

        connector.isConnected = state
        connector.connectedObject = hose
        connector.connectedNodeId = grabNodeId
    end
end

function ManureSystemConnector:setIsManureFlowOpen(id, state, force, noEventSend)
    local connector = self:getConnectorById(id)

    if not connector.isParkPlace and connector.hasOpenManureFlow ~= state or force then
        ManureSystemConnectorManureFlowEvent.sendEvent(self, id, state, force, noEventSend)

        connector.hasOpenManureFlow = state

        if connector.manureFlowAnimationName ~= nil then
            local canPlayAnimation = force or not self:getIsAnimationPlaying(connector.manureFlowAnimationName)

            if canPlayAnimation then
                local dir = state and 1 or -1
                self:playAnimation(connector.manureFlowAnimationName, dir, nil, true)
            end
        end
    end
end
