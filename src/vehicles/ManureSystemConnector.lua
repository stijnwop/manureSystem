-- ManureSystemConnector
--
-- Author: Stijn Wopereis
-- Description: Connector implementation for vehicles
-- Name: ManureSystemConnector
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemConnector
ManureSystemConnector = {}
ManureSystemConnector.MOD_NAME = g_currentModName

---@return void
function ManureSystemConnector.initSpecialization()
    local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("ManureSystemConnector")
    ManureSystemConnectors.registerXMLPaths(schema, "vehicle")
    schema:setXMLSpecializationType()
end

---@return boolean
function ManureSystemConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

---@return void
function ManureSystemConnector.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "setIsConnected", ManureSystemConnector.setIsConnected)
    SpecializationUtil.registerFunction(vehicleType, "setIsManureFlowOpen", ManureSystemConnector.setIsManureFlowOpen)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorById", ManureSystemConnector.getConnectorById)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorsByType", ManureSystemConnector.getConnectorsByType)
    SpecializationUtil.registerFunction(vehicleType, "getActiveConnectorsByType", ManureSystemConnector.getActiveConnectorsByType)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorInRangeNode", ManureSystemConnector.getConnectorInRangeNode)
end

---@return void
function ManureSystemConnector.registerOverwrittenFunctions(vehicleType)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "loadExtraDependentParts", ManureSystemConnector.loadExtraDependentParts)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "updateExtraDependentParts", ManureSystemConnector.updateExtraDependentParts)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "loadHoseTargetNode", ManureSystemConnector.loadHoseTargetNode)
end

---@return void
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

---@return void
function ManureSystemConnector:onLoad(savegame)
    self.spec_manureSystemConnector = self[("spec_%s.manureSystemConnector"):format(ManureSystemConnector.MOD_NAME)]

    local spec = self.spec_manureSystemConnector

    spec.isActive = self.xmlFile:getBool("vehicle.manureSystem#hasConnectors") or false

    if spec.isActive then
        spec.connectors = ManureSystemConnectors.new(self, g_currentMission.manureSystem)
        if not spec.connectors:loadFromVehicleXML(self.xmlFile) then
            spec.connectors:delete()
        end
    end

    if not spec.isActive or not spec.connectors:hasConnectors() then
        SpecializationUtil.removeEventListener(self, "onPostLoad", ManureSystemConnector)
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemConnector)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemConnector)
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemConnector)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemConnector)
        SpecializationUtil.removeEventListener(self, "onPumpInvalid", ManureSystemConnector)
    end
end

---@return void
function ManureSystemConnector:onPostLoad(savegame)
    self.spec_manureSystemConnector.connectors:register()
end

---@return void
function ManureSystemConnector:onDelete()
    local spec = self.spec_manureSystemConnector
    if spec.isActive then
        spec.connectors:delete()
    end
end

---@return void
function ManureSystemConnector:onReadStream(streamId, connection)
    self.spec_manureSystemConnector.connectors:readStream(streamId, connection)
end

---@return void
function ManureSystemConnector:onWriteStream(streamId, connection)
    self.spec_manureSystemConnector.connectors:writeStream(streamId, connection)
end

---@return void
function ManureSystemConnector:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    self.spec_manureSystemConnector.connectors:update(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
end

---@return void
function ManureSystemConnector:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    self.spec_manureSystemConnector.connectors:updateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
end

---@return void
function ManureSystemConnector:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    self.spec_manureSystemConnector.connectors:setIsConnected(id, state, grabNodeId, hose, noEventSend)
end

---@return void
function ManureSystemConnector:setIsManureFlowOpen(id, state, force, noEventSend)
    self.spec_manureSystemConnector.connectors:setIsManureFlowOpen(id, state, force, noEventSend)
end

---@return table
function ManureSystemConnector:getConnectorById(type)
    return self.spec_manureSystemConnector.connectors:getConnectorById(type)
end

---@return table
function ManureSystemConnector:getConnectorsByType(type)
    return self.spec_manureSystemConnector.connectors:getConnectorsByType(type)
end

---@return table
function ManureSystemConnector:getActiveConnectorsByType(type)
    return self.spec_manureSystemConnector.connectors:getActiveConnectorsByType(type)
end

---@return boolean
function ManureSystemConnector:getConnectorInRangeNode()
    return self.spec_manureSystemConnector.connectors:getConnectorInRangeNode()
end

---@return void
function ManureSystemConnector:onPumpInvalid()
    local connectors = self.spec_manureSystemConnector.connectors

    local message
    for _, strategy in pairs(connectors.connectorStrategies) do
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
        entry.node = XMLExtensions.ensureExistingNode(self, xmlFile, targetKey)

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
