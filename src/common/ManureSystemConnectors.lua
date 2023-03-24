---@class ManureSystemConnectors
ManureSystemConnectors = {}

---@type number
ManureSystemConnectors.SEND_NUM_BITS = 4 -- 2 ^ 4

local ManureSystemConnectors_mt = Class(ManureSystemConnectors)

function ManureSystemConnectors.new(object, manureSystem)
    local self = setmetatable({}, ManureSystemConnectors_mt)

    self.connectorStrategies = {}
    self.connectors = {}
    self.connectorsByType = {}
    self.activeConnectorsByType = {}

    self.object = object
    self.manureSystem = manureSystem

    return self
end

function ManureSystemConnectors:delete()
    for type, connectors in pairs(self.connectorsByType) do
        for _, connector in ipairs(connectors) do
            local strategy = self.connectorStrategies[type]
            if strategy ~= nil then
                strategy:delete(connector)
            end

            if connector.setSharedLinkNode ~= nil then
                -- Todo: move shared set to object?
                -- Set place holder visibility.
                if connector.placeHolderNode ~= nil then
                    setVisibility(connector.placeHolderNode, true)
                end

                delete(connector.setSharedLinkNode)
            end
        end
    end

    self:deregister()
end

function ManureSystemConnectors:readStream(streamId, connection)
    if connection:getIsServer() then
        for type, connectors in pairs(self.connectorsByType) do
            for _, connector in ipairs(connectors) do
                local strategy = self.connectorStrategies[type]
                if strategy ~= nil then
                    if strategy.onReadStream ~= nil then
                        strategy:onReadStream(connector, streamId, connection)
                    end
                end
            end
        end
    end
end

function ManureSystemConnectors:writeStream(streamId, connection)
    if not connection:getIsServer() then
        for type, connectors in pairs(self.connectorsByType) do
            for _, connector in ipairs(connectors) do
                local strategy = self.connectorStrategies[type]
                if strategy ~= nil then
                    if strategy.onWriteStream ~= nil then
                        strategy:onWriteStream(connector, streamId, connection)
                    end
                end
            end
        end
    end
end

function ManureSystemConnectors:register()
    if #self.connectors ~= 0 then
        self.manureSystem:addConnectorObject(self.object)
    end
end

function ManureSystemConnectors:deregister()
    self.manureSystem:removeConnectorObject(self.object)
end

function ManureSystemConnectors:update(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    for _, strategy in pairs(self.connectorStrategies) do
        if strategy.onUpdate ~= nil then
            strategy:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
        end
    end
end

function ManureSystemConnectors:updateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    for _, strategy in pairs(self.connectorStrategies) do
        if strategy.onUpdateTick ~= nil then
            strategy:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
        end
    end
end

---Returns true when connectors are loaded, false otherwise
function ManureSystemConnectors:hasConnectors()
    return #self.connectors ~= 0
end

---Returns a list of all the connectors.
function ManureSystemConnectors:getConnectors()
    return self.connectors
end

---Returns a connector for the given id.
function ManureSystemConnectors:getConnectorById(id)
    return self.connectors[id]
end

---Returns a list of connectors based on the given type.
function ManureSystemConnectors:getConnectorsByType(type)
    local connectors = self.connectorsByType[type]
    return connectors or {}
end

---Returns a list of active connectors based on the given type.
function ManureSystemConnectors:getActiveConnectorsByType(type)
    local connectors = self.activeConnectorsByType[type]
    return connectors or {}
end

---Gets the inRange node for the connector vehicle.
function ManureSystemConnectors:getConnectorInRangeNode()
    return self.inRangeNode or self.object.components[1].node
end

---Sets the given connector active or not to reduce processing of non active connectors
function ManureSystemConnectors:setIsConnectorActive(connector, isActive)
    if isActive then
        if not table.hasElement(self.activeConnectorsByType[connector.type], connector) then
            table.addElement(self.activeConnectorsByType[connector.type], connector)
        end
    else
        table.removeElement(self.activeConnectorsByType[connector.type], connector)

        --Reset pump target when no connectors are active for strategy.
        if #self.activeConnectorsByType[connector.type] == 0 then
            if self.object.spec_manureSystemPumpMotor ~= nil then
                local strategy = self.connectorStrategies[connector.type]
                if strategy.resetPumpTargetObject ~= nil then
                    strategy:resetPumpTargetObject(self.object)
                end
            end
        end
    end
end

---Sets the `isConnected` state on the connector with additional information of the connected hose object, if present it will play the animations.
function ManureSystemConnectors:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.isConnected ~= state then
        ManureSystemConnectorIsConnectedEvent.sendEvent(self.object, id, state, grabNodeId, hose, noEventSend)

        if connector.lockAnimationName ~= nil then
            local dir = state and 1 or -1
            self.object:playAnimation(connector.lockAnimationName, dir, nil, true)
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

        --Add or remove connector to the table for further interaction.
        self:setIsConnectorActive(connector, state)
    end
end

---Sets the `hasOpenManureFlow` state on the connector, if present it will play the animations.
function ManureSystemConnectors:setIsManureFlowOpen(id, state, force, noEventSend)
    local connector = self:getConnectorById(id)

    if not connector.isParkPlace and connector.hasOpenManureFlow ~= state or force then
        ManureSystemConnectorManureFlowEvent.sendEvent(self.object, id, state, force, noEventSend)

        connector.hasOpenManureFlow = state

        if connector.manureFlowAnimationName ~= nil then
            local canPlayAnimation = force or not self.object:getIsAnimationPlaying(connector.manureFlowAnimationName)

            if canPlayAnimation then
                local dir = state and 1 or -1
                self.object:playAnimation(connector.manureFlowAnimationName, dir, nil, true)
            end
        end
    end
end

--region XML loading
function ManureSystemConnectors:loadFromVehicleXML(xmlFile)
    return self:loadFromXML("vehicle", xmlFile)
end

function ManureSystemConnectors:loadFromPlaceableXML(xmlFile)
    return self:loadFromXML("placeable", xmlFile)
end

function ManureSystemConnectors:loadFromXML(typeKey, xmlFile)
    --Load optional in range node in order to define a different node to use for the hose to check if the vehicle is in a certain radius.
    self.inRangeNode = xmlFile:getValue(typeKey .. ".manureSystemConnectors#inRangeNode", nil, self.object.components, self.object.i3dMappings)

    local i = 0

    while true do
        local baseKey = ("%s.manureSystemConnectors.connector(%d)"):format(typeKey, i)

        if not xmlFile:hasProperty(baseKey) then
            break
        end

        local typeString = xmlFile:getValue(baseKey .. "#type", ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = self.manureSystem.connectorManager:getConnectorType(typeString)

        log("Loading connector", typeString)
        if type == nil then
            Logging.xmlWarning(self.object.configFileName, "Invalid connector type %s", typeString)
            type = self.manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if self.connectorsByType[type] == nil then
            self.connectorsByType[type] = {}
            self.activeConnectorsByType[type] = {}
        end

        if self.connectorStrategies[type] == nil then
            self.connectorStrategies[type] = self.manureSystem.connectorManager:getConnectorStrategy(type, self.object)
        end

        local nextId = i + 1
        local connector = {}

        connector.id = nextId
        connector.type = type

        if self:loadConnectorFromXML(connector, xmlFile, baseKey) then
            local strategy = self.connectorStrategies[type]

            if strategy == nil or strategy:load(connector, xmlFile, baseKey) then
                table.insert(self.connectors, connector)
                table.insert(self.connectorsByType[type], connector)
            end
        end

        i = nextId
    end

    return true
end

function ManureSystemConnectors:loadConnectorFromXML(connector, xmlFile, baseKey)
    connector.hasSharedSet = xmlFile:hasProperty(baseKey .. ".sharedSet")
    connector.isConnected = false
    connector.connectedObject = nil
    connector.connectedNodeId = nil
    connector.inRangeDistance = xmlFile:getValue(baseKey .. "#inRangeDistance", 1.3)
    connector.isParkPlace = xmlFile:getValue(baseKey .. "#isParkPlace", false)
    connector.fillUnitIndex = xmlFile:getValue(baseKey .. "#fillUnitIndex", 1)

    connector.componentNode = self.object.components[1].node
    if not NodeExtensions.isRigidBody(connector.componentNode) then
        connector.componentNode = NodeExtensions.getFirstRigidBodyNode(connector.componentNode)
    end

    if connector.hasSharedSet then
        if not self:loadSharedSetFromXML(xmlFile, baseKey .. ".sharedSet", connector) then
            return false
        end
    else
        local node = XMLExtensions.ensureExistingNode(self.object, xmlFile, baseKey)
        if node == nil then
            return false
        end

        connector.node = node
    end

    return true
end

--Todo: refactor..
function ManureSystemConnectors:loadSharedSetFromXML(xmlFile, baseKey, connector)
    connector.setId = xmlFile:getValue(baseKey .. "#id", 1)

    local linkNode = XMLExtensions.ensureExistingNode(self.object, xmlFile, baseKey)
    connector.setSharedLinkNode = linkNode

    local set = self.manureSystem.connectorManager:getConnectorSet(connector.setId)
    if set ~= nil then
        local strategy = self.connectorStrategies[connector.type]

        local placeHolderNode = xmlFile:getValue(baseKey .. "#placeholderNode", nil, self.object.components, self.object.i3dMappings)
        if placeHolderNode ~= nil then
            connector.placeHolderNode = placeHolderNode
            setVisibility(connector.placeHolderNode, false)
        end

        local sharedXMLFile = XMLFile.load("sharedXMLFile", set.xmlFilename, ManureSystemConnectorManager.xmlSchema)
        local sharedConnectorKey = xmlFile:getValue(baseKey .. ".connector#type")
        if sharedConnectorKey ~= nil then
            local sharedConnector = set.connectors[sharedConnectorKey:upper()]

            if sharedConnector ~= nil then
                local connectorNode = clone(sharedConnector.node, false, false, false)
                if strategy ~= nil then
                    strategy:loadSharedSetConnectorAttributes(xmlFile, baseKey .. ".connector", connector, connectorNode, sharedConnector)
                    strategy:loadSharedSetConnectorAnimation(sharedXMLFile, sharedConnector.animationKey, connector, connectorNode, "lockAnimationName", sharedConnector)
                end

                link(linkNode, connectorNode)
                ManureSystemUtil.loadNodePositionAndRotation(xmlFile, baseKey .. ".connector", connectorNode)
            end
        end

        local sharedValveKey = xmlFile:getValue(baseKey .. ".valve#type")
        if sharedValveKey ~= nil then
            local sharedValve = set.valves[sharedValveKey:upper()]
            if sharedValve ~= nil then
                local valveNode = clone(sharedValve.node, false, false, false)
                link(linkNode, valveNode)
                ManureSystemUtil.loadNodePositionAndRotation(xmlFile, baseKey .. ".valve", valveNode)

                local sharedHandleKey = xmlFile:getValue(baseKey .. ".handle#type")
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

        sharedXMLFile:delete()
    else
        Logging.xmlError(self.object.configFileName, ("Shared connector set %s not found!"):format(connector.setId))
        return false
    end

    return true
end
--endregion

--region XML paths
function ManureSystemConnectors.registerXMLPaths(schema, baseName)
    schema:register(XMLValueType.INT, baseName .. ".manureSystemConnectors#type", "Connector type")
    schema:register(XMLValueType.NODE_INDEX, baseName .. ".manureSystemConnectors#inRangeNode", "Connector in range node")
    ManureSystemConnectors.registerConnectorNodeXMLPaths(schema, baseName .. ".manureSystemConnectors.connector(?)")
end

function ManureSystemConnectors.registerConnectorNodeXMLPaths(schema, baseName)
    ManureSystemXMLUtil.registerNodeCreationXMLPaths(schema, baseName)

    ManureSystemCouplingStrategy.registerConnectorNodeXMLPaths(schema, baseName)
    ManureSystemDockStrategy.registerDockNodeXMLPaths(schema, baseName)

    schema:register(XMLValueType.STRING, baseName .. "#type", "The connector type")
    schema:register(XMLValueType.FLOAT, baseName .. "#inRangeDistance", "The distance needed for the hose being in range")
    schema:register(XMLValueType.BOOL, baseName .. "#isParkPlace", "Determines if the connector is a park place")
    schema:register(XMLValueType.INT, baseName .. "#fillUnitIndex", "Fill unit index the connector is linked to")
    ManureSystemConnectors.registerConnectorNodeSharedSetXMLPaths(schema, baseName .. ".sharedSet")
end

function ManureSystemConnectors.registerConnectorNodeSharedSetXMLPaths(schema, baseName)
    ManureSystemXMLUtil.registerNodeCreationXMLPaths(schema, baseName)

    schema:register(XMLValueType.INT, baseName .. "#id", "The shared set id")
    schema:register(XMLValueType.NODE_INDEX, baseName .. "#placeholderNode", "Visual placeholder node")

    schema:register(XMLValueType.STRING, baseName .. ".connector#type", "The connector shared set type key")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. ".connector#position", "The connector position")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. ".connector#rotation", "The connector rotation")
    schema:register(XMLValueType.COLOR, baseName .. ".connector#color", "The connector color")

    schema:register(XMLValueType.BOOL, baseName .. ".connector.pipe", "Set the visibility of pipe")
    schema:register(XMLValueType.BOOL, baseName .. ".connector.flangeRound", "Set the visibility of the round flange")
    schema:register(XMLValueType.BOOL, baseName .. ".connector.flangeQuad", "Set the visibility of the quad flange")

    schema:register(XMLValueType.STRING, baseName .. ".valve#type", "The valve shared set type key")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. ".valve#position", "The valve position")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. ".valve#rotation", "The valve rotation")

    schema:register(XMLValueType.STRING, baseName .. ".handle#type", "The handle shared set type key")
end
--endregion
