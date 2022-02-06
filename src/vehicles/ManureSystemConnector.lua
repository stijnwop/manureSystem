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

function ManureSystemConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

function ManureSystemConnector.initSpecialization()
    local schema = Vehicle.xmlSchema

    schema:setXMLSpecializationType("ManureSystemConnector")
    schema:register(XMLValueType.INT, "vehicle.manureSystemConnectors#type", "Connector type")
    schema:register(XMLValueType.NODE_INDEX, "vehicle.manureSystemConnectors#inRangeNode", "Connector in range node")
    ManureSystemConnector.registerConnectorNodeXMLPaths(schema, "vehicle.manureSystemConnectors.connector(?)")
    ManureSystemCouplingStrategy.registerConnectorNodeXMLPaths(schema, "vehicle.manureSystemConnectors.connector(?)")
    ManureSystemDockStrategy.registerDockNodeXMLPaths(schema, "vehicle.manureSystemConnectors.connector(?)")
    schema:setXMLSpecializationType()

    g_configurationManager:addConfigurationType("hose", g_i18n:getText("configuration_hose"), "hose", nil, nil, nil, ConfigurationUtil.SELECTOR_MULTIOPTION)
    ObjectChangeUtil.registerObjectChangeXMLPaths(schema, "vehicle.hose.hoseConfigurations.hoseConfiguration(?)")
end

function ManureSystemConnector.registerConnectorNodeXMLPaths(schema, baseName)
    ManureSystemXMLUtil.registerNodeCreationXMLPaths(schema, baseName)
    schema:register(XMLValueType.STRING, baseName .. "#type", "The connector type")
    schema:register(XMLValueType.FLOAT, baseName .. "#inRangeDistance", "The distance needed for the hose being in range")
    schema:register(XMLValueType.BOOL, baseName .. "#isParkPlace", "Determines if the connector is a park place")
    schema:register(XMLValueType.INT, baseName .. "#fillUnitIndex", "Fill unit index the connector is linked to")
    ManureSystemConnector.registerConnectorNodeSharedSetXMLPaths(schema, baseName .. ".sharedSet")
end

function ManureSystemConnector.registerConnectorNodeSharedSetXMLPaths(schema, baseName)
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

function ManureSystemConnector.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemConnectorFromXML", ManureSystemConnector.loadManureSystemConnectorFromXML)
    SpecializationUtil.registerFunction(vehicleType, "loadSharedSetFromXML", ManureSystemConnector.loadSharedSetFromXML)
    SpecializationUtil.registerFunction(vehicleType, "setIsConnected", ManureSystemConnector.setIsConnected)
    SpecializationUtil.registerFunction(vehicleType, "setIsManureFlowOpen", ManureSystemConnector.setIsManureFlowOpen)
    SpecializationUtil.registerFunction(vehicleType, "getConnectors", ManureSystemConnector.getConnectors)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorById", ManureSystemConnector.getConnectorById)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorsByType", ManureSystemConnector.getConnectorsByType)
    SpecializationUtil.registerFunction(vehicleType, "getActiveConnectorsByType", ManureSystemConnector.getActiveConnectorsByType)
    SpecializationUtil.registerFunction(vehicleType, "setIsConnectorActive", ManureSystemConnector.setIsConnectorActive)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorInRangeNode", ManureSystemConnector.getConnectorInRangeNode)
end

function ManureSystemConnector.registerOverwrittenFunctions(vehicleType)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "loadExtraDependentParts", ManureSystemConnector.loadExtraDependentParts)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "updateExtraDependentParts", ManureSystemConnector.updateExtraDependentParts)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "loadHoseTargetNode", ManureSystemConnector.loadHoseTargetNode)
end

function ManureSystemConnector.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onPostLoad", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onReadStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteStream", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onPumpInvalid", ManureSystemConnector)
end

function ManureSystemConnector:onLoad(savegame)
    self.spec_manureSystemConnector = self[("spec_%s.manureSystemConnector"):format(ManureSystemConnector.MOD_NAME)]

    local spec = self.spec_manureSystemConnector

    spec.connectorStrategies = {}
    spec.manureSystemConnectors = {}
    spec.manureSystemConnectorsByType = {}
    spec.manureSystemActiveConnectorsByType = {}

    --Load optional in range node in order to define a different node to use for the hose to check if the vehicle is in a certain radius.
    spec.inRangeNode = self.xmlFile:getValue("vehicle.manureSystemConnectors#inRangeNode", nil, self.components, self.i3dMappings)

    local i = 0
    while true do
        local baseKey = ("vehicle.manureSystemConnectors.connector(%d)"):format(i)

        if not self.xmlFile:hasProperty(baseKey) then
            break
        end

        local typeString = self.xmlFile:getValue(baseKey .. "#type", ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        local type = g_currentMission.manureSystem.connectorManager:getConnectorType(typeString)

        if type == nil then
            Logging.xmlWarning(self.configFileName, "Invalid connector type %s", typeString)
            type = g_currentMission.manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        end

        if spec.manureSystemConnectorsByType[type] == nil then
            spec.manureSystemConnectorsByType[type] = {}
            spec.manureSystemActiveConnectorsByType[type] = {}
        end

        if spec.connectorStrategies[type] == nil then
            spec.connectorStrategies[type] = g_currentMission.manureSystem.connectorManager:getConnectorStrategy(type, self)
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
        g_currentMission.manureSystem:addConnectorObject(self)
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

    g_currentMission.manureSystem:removeConnectorObject(self)
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

function ManureSystemConnector:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemConnector

    for _, strategy in pairs(spec.connectorStrategies) do
        if strategy.onUpdateTick ~= nil then
            strategy:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
        end
    end
end

function ManureSystemConnector:onPumpInvalid()
    local spec = self.spec_manureSystemConnector

    local message
    for _, strategy in pairs(spec.connectorStrategies) do
        if strategy.getPumpInvalidWarningMessage ~= nil then
            message = strategy:getPumpInvalidWarningMessage()
        end

        if message ~= nil then
            break
        end
    end

    if message ~= nil then
        g_currentMission:showBlinkingWarning(message)
    end
end

function ManureSystemConnector:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, id)
    connector.hasSharedSet = xmlFile:hasProperty(baseKey .. ".sharedSet")

    if not connector.hasSharedSet then
        local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, id)
        if node == nil then
            return false
        end

        connector.node = node
    end

    connector.id = id + 1
    connector.isConnected = false
    connector.connectedObject = nil
    connector.connectedNodeId = nil
    connector.inRangeDistance = xmlFile:getValue(baseKey .. "#inRangeDistance", 1.3)
    connector.isParkPlace = xmlFile:getValue(baseKey .. "#isParkPlace", false)
    connector.fillUnitIndex = xmlFile:getValue(baseKey .. "#fillUnitIndex", 1)

    if connector.hasSharedSet then
        if not self:loadSharedSetFromXML(xmlFile, baseKey .. ".sharedSet", connector) then
            return false
        end
    end

    return true
end

function ManureSystemConnector:loadSharedSetFromXML(xmlFile, key, connector)
    local spec = self.spec_manureSystemConnector

    connector.setId = xmlFile:getValue(key .. "#id", 1)

    local linkNode = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, key)
    connector.setSharedLinkNode = linkNode

    local set = g_currentMission.manureSystem.connectorManager:getConnectorSet(connector.setId)
    if set ~= nil then
        local strategy = spec.connectorStrategies[connector.type]

        local placeHolderNode = self.xmlFile:getValue(key .. "#placeholderNode", nil, self.components, self.i3dMappings)
        if placeHolderNode ~= nil then
            connector.placeHolderNode = placeHolderNode
            setVisibility(connector.placeHolderNode, false)
        end

        local sharedXMLFile = loadXMLFile("sharedXMLFile", set.xmlFilename)
        local sharedConnectorKey = xmlFile:getValue(key .. ".connector#type")
        if sharedConnectorKey ~= nil then
            local sharedConnector = set.connectors[sharedConnectorKey:upper()]

            if sharedConnector ~= nil then
                local connectorNode = clone(sharedConnector.node, false, false, false)
                if strategy ~= nil then
                    strategy:loadSharedSetConnectorAttributes(xmlFile, key .. ".connector", connector, connectorNode, sharedConnector)
                    strategy:loadSharedSetConnectorAnimation(sharedXMLFile, sharedConnector.animationKey, connector, connectorNode, "lockAnimationName", sharedConnector)
                end

                link(linkNode, connectorNode)
                ManureSystemUtil.loadNodePositionAndRotation(xmlFile, key .. ".connector", connectorNode)
            end
        end

        local sharedValveKey = xmlFile:getValue(key .. ".valve#type")
        if sharedValveKey ~= nil then
            local sharedValve = set.valves[sharedValveKey:upper()]
            if sharedValve ~= nil then
                local valveNode = clone(sharedValve.node, false, false, false)
                link(linkNode, valveNode)
                ManureSystemUtil.loadNodePositionAndRotation(xmlFile, key .. ".valve", valveNode)

                local sharedHandleKey = xmlFile:getValue(key .. ".handle#type")
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
        Logging.xmlError(self.configFileName, ("Shared connector set %s not found!"):format(connector.setId))
        return false
    end

    return true
end

---Returns a list of all the connectors.
function ManureSystemConnector:getConnectors()
    return self.spec_manureSystemConnector.manureSystemConnectors
end

---Returns a connector for the given id.
function ManureSystemConnector:getConnectorById(id)
    return self.spec_manureSystemConnector.manureSystemConnectors[id]
end

---Returns a list of connectors based on the given type.
function ManureSystemConnector:getConnectorsByType(type)
    local types = self.spec_manureSystemConnector.manureSystemConnectorsByType[type]
    if types ~= nil then
        return types
    end
    --Given type does not exist, so return empty table.
    return {}
end

---Returns a list of active connectors based on the given type.
function ManureSystemConnector:getActiveConnectorsByType(type)
    local types = self.spec_manureSystemConnector.manureSystemActiveConnectorsByType[type]
    if types ~= nil then
        return types
    end
    --Given type does not exist, so return empty table.
    return {}
end

---Sets the given connector active or not.
function ManureSystemConnector:setIsConnectorActive(connector, state)
    local spec = self.spec_manureSystemConnector
    --Add the connector to the active table to reduce processing of non active connectors
    if state then
        if not table.hasElement(spec.manureSystemActiveConnectorsByType[connector.type], connector) then
            table.addElement(spec.manureSystemActiveConnectorsByType[connector.type], connector)
        end
    else
        table.removeElement(spec.manureSystemActiveConnectorsByType[connector.type], connector)

        --Reset pump target when no connectors are active for strategy.
        if #spec.manureSystemActiveConnectorsByType[connector.type] == 0 then
            if self.spec_manureSystemPumpMotor ~= nil then
                local strategy = spec.connectorStrategies[connector.type]
                if strategy.resetPumpTargetObject ~= nil then
                    strategy:resetPumpTargetObject(self)
                end
            end
        end
    end
end

---Gets the inRange node for the connector vehicle.
function ManureSystemConnector:getConnectorInRangeNode()
    local spec = self.spec_manureSystemConnector

    if spec.inRangeNode ~= nil then
        return spec.inRangeNode
    end

    return self.components[1].node
end

---Sets the `isConnected` state on the connector with additional information of the connected hose object, if present it will play the animations.
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

        --Add or remove connector to the table for further interaction.
        self:setIsConnectorActive(connector, state)
    end
end

---Sets the `hasOpenManureFlow` state on the connector, if present it will play the animations.
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

----------------
-- Overwrites --
----------------

---Load extra depending part on connectors for moving tools.
function ManureSystemConnector:loadExtraDependentParts(superFunc, xmlFile, baseName, entry)
    if not superFunc(self, xmlFile, baseName, entry) then
        return false
    end

    local indices = StringUtil.getVectorNFromString(getXMLString(xmlFile, baseName .. ".manureSystemConnectors#indices"))
    if indices ~= nil then
        entry.manureSystemConnectors = {}

        for _, id in ipairs(indices) do
            table.insert(entry.manureSystemConnectors, id)
        end
    end

    return true
end

---Update moving tool depending part to set the hose joint frame.
function ManureSystemConnector:updateExtraDependentParts(superFunc, part, dt)
    superFunc(self, part, dt)

    if part.manureSystemConnectors ~= nil and self.isServer then
        for i, id in ipairs(part.manureSystemConnectors) do
            local connector = self:getConnectorById(id)

            if connector == nil then
                part.manureSystemConnectors[i] = nil
                Logging.xmlWarning(self.configFileName, "Unable to find manureSystemConnectors index '%d' for movingPart/movingTool '%s'", id, getName(part.node))
            else
                if connector.isConnected then
                    local object = connector.connectedObject
                    if object.isaHose ~= nil and object:isaHose() then
                        local grabNode = object:getGrabNodeById(connector.connectedNodeId)

                        if grabNode.jointIndex ~= nil then
                            setJointFrame(grabNode.jointIndex, 0, grabNode.jointTransform)
                        end
                    end
                end
            end
        end
    end
end

---Allow note creation, due to lack of code modularity we have to completely copy the code from the connection hoses spec.
function ManureSystemConnector:loadHoseTargetNode(superFunc, xmlFile, targetKey, entry)
    if Utils.getNoNil(getXMLBool(xmlFile, targetKey .. "#createNode"), false) then
        entry.node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, targetKey)

        if entry.node == nil then
            Logging.xmlWarning(self.configFileName, "Missing node for connection hose target '%s'", targetKey)

            return false
        end

        local attacherJointIndices = {
            StringUtil.getVectorFromString(getXMLString(xmlFile, targetKey .. "#attacherJointIndices"))
        }
        entry.attacherJointIndices = {}

        for _, v in ipairs(attacherJointIndices) do
            entry.attacherJointIndices[v] = v
        end

        entry.type = getXMLString(xmlFile, targetKey .. "#type")
        entry.straighteningFactor = Utils.getNoNil(getXMLFloat(xmlFile, targetKey .. "#straighteningFactor"), 1)
        local socketName = getXMLString(xmlFile, targetKey .. "#socket")

        if socketName ~= nil then
            entry.socket = g_connectionHoseManager:linkSocketToNode(socketName, entry.node)
        end

        if entry.type ~= nil then
            entry.adapterName = Utils.getNoNil(getXMLString(xmlFile, targetKey .. "#adapterType"), "DEFAULT")

            if entry.adapter == nil then
                entry.adapter = {
                    node = entry.node,
                    refNode = entry.node
                }
            end

            entry.objectChanges = {}

            ObjectChangeUtil.loadObjectChangeFromXML(self.xmlFile, targetKey, entry.objectChanges, self.components, self)
            ObjectChangeUtil.setObjectChanges(entry.objectChanges, false)
        else
            Logging.xmlWarning(self.configFileName, "Missing type for '%s'", targetKey)

            return false
        end

        return true
    end

    return superFunc(self, xmlFile, targetKey, entry)
end
