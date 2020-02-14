----------------------------------------------------------------------------------------------------
-- ManureSystemConnector
----------------------------------------------------------------------------------------------------
-- Purpose: connects different strategies together in order to allow pumping.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnector
ManureSystemConnector = {}
ManureSystemConnector.MOD_NAME = g_currentModName

ManureSystemConnector.CONNECTORS_SEND_NUM_BITS = 4 -- 2 ^ 4

function ManureSystemConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

function ManureSystemConnector.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemConnectorFromXML", ManureSystemConnector.loadManureSystemConnectorFromXML)
    SpecializationUtil.registerFunction(vehicleType, "loadSharedSetFromXML", ManureSystemConnector.loadSharedSetFromXML)
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
    SpecializationUtil.registerEventListener(vehicleType, "onPostLoad", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onReadStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemConnector)
end

function ManureSystemConnector:onLoad(savegame)
    self.spec_manureSystemConnector = self[("spec_%s.manureSystemConnector"):format(ManureSystemConnector.MOD_NAME)]

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

        local typeString = Utils.getNoNil(getXMLString(self.xmlFile, baseKey .. "#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
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
        connector.type = type
        if self:loadManureSystemConnectorFromXML(connector, self.xmlFile, baseKey, i) then
            local strategy = spec.connectorStrategies[type]
            if strategy == nil or strategy:load(connector, self.xmlFile, baseKey) then
                table.insert(spec.manureSystemConnectors, connector)
                table.insert(spec.manureSystemConnectorsByType[type], connector)
            end
        end

        i = i + 1
    end
end

function ManureSystemConnector:onPostLoad(savegame)
    local spec = self.spec_manureSystemConnector

    if #spec.manureSystemConnectors ~= 0 then
        g_manureSystem:addConnectorObject(self)
    end
end

function ManureSystemConnector:onDelete()
    local spec = self.spec_manureSystemConnector

    for type, connectors in pairs(spec.manureSystemConnectorsByType) do
        for _, connector in ipairs(connectors) do
            local strategy = spec.connectorStrategies[type]
            if strategy ~= nil then
                strategy:delete(connector)
            end

            if connector.setSharedLinkNode ~= nil then
                -- Set place holder visibility.
                if connector.placeHolderNode ~= nil then
                    setVisibility(connector.placeHolderNode, true)
                end
                delete(connector.setSharedLinkNode)
            end
        end
    end

    g_manureSystem:removeConnectorObject(self)
end

function ManureSystemConnector:onReadStream(streamId, connection)
    local spec = self.spec_manureSystemConnector
    if connection:getIsServer() then
        for type, connectors in pairs(spec.manureSystemConnectorsByType) do
            for _, connector in ipairs(connectors) do
                local strategy = spec.connectorStrategies[type]
                if strategy ~= nil then
                    if strategy.onReadStream ~= nil then
                        strategy:onReadStream(connector, streamId, connection)
                    end
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
                local strategy = spec.connectorStrategies[type]
                if strategy ~= nil then
                    if strategy.onWriteStream ~= nil then
                        strategy:onWriteStream(connector, streamId, connection)
                    end
                end
            end
        end
    end
end

function ManureSystemConnector:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemConnector

    for _, strategy in pairs(spec.connectorStrategies) do
        if strategy.onUpdate ~= nil then
            strategy:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
        end
    end
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
        connector.hasSharedSet = hasXMLProperty(xmlFile, baseKey .. ".sharedSet")

        if connector.hasSharedSet then
            self:loadSharedSetFromXML(xmlFile, baseKey .. ".sharedSet", connector)
        end

        return true
    end

    return false
end

function ManureSystemConnector:loadSharedSetFromXML(xmlFile, key, connector)
    local spec = self.spec_manureSystemConnector

    connector.setId = Utils.getNoNil(getXMLInt(xmlFile, key .. "#id"), 1)

    local linkNode = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, key)
    connector.setSharedLinkNode = linkNode

    local set = g_manureSystem.connectorManager:getConnectorSet(connector.setId)
    if set ~= nil then
        local strategy = spec.connectorStrategies[connector.type]

        local placeHolderNode = I3DUtil.indexToObject(self.components, getXMLString(xmlFile, key .. "#placeholderNode"), self.i3dMappings)
        if placeHolderNode ~= nil then
            connector.placeHolderNode = placeHolderNode
            setVisibility(connector.placeHolderNode, false)
        end

        local sharedXMLFile = loadXMLFile("sharedXMLFile", set.xmlFilename)
        local sharedConnectorKey = getXMLString(xmlFile, key .. ".connector#type")
        if sharedConnectorKey ~= nil then
            local sharedConnector = set.connectors[sharedConnectorKey:upper()]

            if sharedConnector ~= nil then
                local connectorNode = clone(sharedConnector.node, false, false, false)
                if strategy ~= nil then
                    strategy:loadSharedSetConnectorAttributes(xmlFile, key .. ".connector", connector, connectorNode, sharedConnector)
                    strategy:loadSharedSetConnectorAnimation(sharedXMLFile, sharedConnector.animationKey, connector, connectorNode, "lockAnimationName", sharedConnector)
                end

                link(linkNode, connectorNode)
            end
        end

        local sharedValveKey = getXMLString(xmlFile, key .. ".valve#type")
        if sharedValveKey ~= nil then
            local sharedValve = set.valves[sharedValveKey:upper()]
            if sharedValve ~= nil then
                local valveNode = clone(sharedValve.node, false, false, false)
                link(linkNode, valveNode)

                local sharedHandleKey = getXMLString(xmlFile, key .. ".handle#type")
                if sharedHandleKey ~= nil then
                    local sharedHandle = sharedValve.handles[sharedHandleKey:upper()]
                    if sharedHandle ~= nil then
                        local handleNode = clone(sharedHandle.node, false, false, false)
                        if strategy ~= nil then
                            strategy:loadSharedSetConnectorAnimation(sharedXMLFile, sharedHandle.animationKey, connector, handleNode, "manureFlowAnimationName", sharedHandle)
                        end

                        link(valveNode, handleNode)
                        setTranslation(handleNode, unpack(sharedHandle.linkOffset))
                    end
                end
            end
        end

        delete(sharedXMLFile)
    else
        g_logManager:xmlError(self.configFileName, "Shared connector set " .. connector.setId .. " not found!")
    end
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

        if not state and connector.hasOpenManureFlow then
            self:setIsManureFlowOpen(id, state, true, noEventSend)
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
