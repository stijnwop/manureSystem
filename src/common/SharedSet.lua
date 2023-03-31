--
-- SharedSet
--
-- Author: Stijn Wopereis
-- Description: Load preconfigured shared sets for connectors
-- Name: SharedSet
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class SharedSet
SharedSet = {}

local SharedSet_mt = Class(SharedSet)

---@return SharedSet
function SharedSet.new(modDirectory)
    local self = setmetatable({}, SharedSet_mt)

    self.modDirectory = modDirectory
    self.connectors = {}
    self.valves = {}

    return self
end

---@return void
function SharedSet:delete()
    if self.sharedNode ~= nil then
        delete(self.sharedNode)
        self.sharedNode = nil
    end

    if self.sharedRoot ~= nil then
        delete(self.sharedRoot)
        self.sharedRoot = nil
    end

    if self.sharedLoadRequestId ~= nil then
        g_i3DManager:releaseSharedI3DFile(self.sharedLoadRequestId)
        self.sharedLoadRequestId = nil
    end
end

---@return boolean
function SharedSet:loadFromXML(xmlFile, baseKey, xmlFilename)
    local filename = xmlFile:getString(baseKey .. "#filename")
    if filename == nil then
        return false
    end

    self.xmlFilename = xmlFilename
    self.filename = Utils.getFilename(filename, self.modDirectory)
    self.sharedRoot, self.sharedLoadRequestId = g_i3DManager:loadSharedI3DFile(self.filename, false, false)
    self.sharedNode = getChildAt(self.sharedRoot, 0)

    self:loadConnectorsFromXML(xmlFile, baseKey)
    self:loadValvesFromXML(xmlFile, baseKey)

    return true
end

---@return void
function SharedSet:loadConnectorsFromXML(xmlFile, baseKey)
    local i = 0
    while true do
        local key = ("%s.connectors.connector(%d)"):format(baseKey, i)
        if not xmlFile:hasProperty(key) then
            break
        end

        local connectorTypeString = xmlFile:getString(key .. "#type")
        local connectorNode = I3DUtil.indexToObject(self.sharedNode, xmlFile:getString(key .. "#node"))

        if connectorTypeString ~= nil and connectorNode ~= nil then
            local connector = {}
            connector.node = connectorNode
            connector.connectorXMLKey = key
            connector.hasAnimation = xmlFile:hasProperty(key .. ".vehicle.animation")

            self.connectors[connectorTypeString:upper()] = connector
        end

        i = i + 1
    end
end

---@return void
function SharedSet:loadValvesFromXML(xmlFile, baseKey)
    local i = 0
    while true do
        local key = ("%s.valves.valve(%d)"):format(baseKey, i)
        if not xmlFile:hasProperty(key) then
            break
        end

        local valveTypeString = xmlFile:getString(key .. "#type")
        local valveNode = I3DUtil.indexToObject(self.sharedNode, xmlFile:getString(key .. "#node"))

        if valveTypeString ~= nil and valveNode ~= nil then
            local valve = {}

            valve.node = valveNode
            valve.handles = {}

            local h = 0
            while true do
                local handleKey = ("%s.handle(%d)"):format(key, h)
                if not xmlFile:hasProperty(handleKey) then
                    break
                end

                local handleTypeString = xmlFile:getString(handleKey .. "#type")
                local handleNode = I3DUtil.indexToObject(self.sharedNode, xmlFile:getString(handleKey .. "#node"))
                if handleTypeString ~= nil and handleNode ~= nil then
                    local handle = {}
                    handle.node = handleNode
                    handle.handleXMLKey = handleKey
                    handle.hasAnimation = xmlFile:hasProperty(handleKey .. ".vehicle.animation")
                    handle.linkOffset = Utils.getNoNil(string.getVectorN(xmlFile:getString(handleKey .. "#linkOffset"), 3), { 0, 0, 0 })

                    valve.handles[handleTypeString:upper()] = handle
                end

                h = h + 1
            end

            self.valves[valveTypeString:upper()] = valve
        end

        i = i + 1
    end
end

---@return void
function SharedSet:applySharedSet(object, connector, strategy, xmlFile, baseKey)
    local placeHolderNode = xmlFile:getValue(baseKey .. "#placeholderNode", nil, object.components, object.i3dMappings)
    if placeHolderNode ~= nil then
        connector.placeHolderNode = placeHolderNode
        setVisibility(connector.placeHolderNode, false)
    end

    local sharedXMLFile = XMLFile.load("sharedXMLFile", self.xmlFilename, ManureSystemConnectorManager.xmlSchema)
    if sharedXMLFile ~= nil then
        self:applySharedConnector(connector, strategy, xmlFile, baseKey, sharedXMLFile)
        self:applySharedValve(connector, strategy, xmlFile, baseKey, sharedXMLFile)
        sharedXMLFile:delete()
    end
end

---@return void
function SharedSet:applySharedConnector(connector, strategy, xmlFile, baseKey, xmlFileShared)
    local sharedConnectorKey = xmlFile:getValue(baseKey .. ".connector#type")
    if sharedConnectorKey == nil then
        return
    end

    local sharedConnector = self.connectors[sharedConnectorKey:upper()]
    if sharedConnector == nil then
        return
    end

    local connectorNode = clone(sharedConnector.node, false, false, false)
    if strategy ~= nil then
        strategy:loadSharedSetConnectorAttributes(xmlFile, baseKey .. ".connector", connector, connectorNode, sharedConnector)
        strategy:loadSharedSetConnectorAnimation(xmlFileShared, sharedConnector.connectorXMLKey, connector, connectorNode, "lockAnimationName", sharedConnector)
    end

    link(connector.sharedSetLinkNode, connectorNode)

    NodeExtensions.setVectorByXML(connectorNode, xmlFile, baseKey .. ".connector#position", NodeExtensions.setPosition)
    NodeExtensions.setVectorByXML(connectorNode, xmlFile, baseKey .. ".connector#rotation", NodeExtensions.setRotation)
end

---@return void
function SharedSet:applySharedValve(connector, strategy, xmlFile, baseKey, xmlFileShared)
    local sharedValveKey = xmlFile:getValue(baseKey .. ".valve#type")
    if sharedValveKey == nil then
        return
    end

    local sharedValve = self.valves[sharedValveKey:upper()]
    if sharedValve == nil then
        return
    end

    local valveNode = clone(sharedValve.node, false, false, false)
    link(connector.sharedSetLinkNode, valveNode)

    NodeExtensions.setVectorByXML(valveNode, xmlFile, baseKey .. ".valve#position", NodeExtensions.setPosition)
    NodeExtensions.setVectorByXML(valveNode, xmlFile, baseKey .. ".valve#rotation", NodeExtensions.setRotation)

    local sharedHandleKey = xmlFile:getValue(baseKey .. ".handle#type")
    if sharedHandleKey == nil then
        return
    end

    local sharedHandle = sharedValve.handles[sharedHandleKey:upper()]
    if sharedHandle == nil then
        return
    end

    local handleNode = clone(sharedHandle.node, false, false, false)
    if strategy ~= nil then
        strategy:loadSharedSetConnectorAnimation(xmlFileShared, sharedHandle.handleXMLKey, connector, handleNode, "manureFlowAnimationName", sharedHandle)
    end

    link(valveNode, handleNode)
    setTranslation(handleNode, unpack(sharedHandle.linkOffset))
end

---@return void
function SharedSet:undoSharedSet(object, connector)
    if connector.placeHolderNode ~= nil then
        setVisibility(connector.placeHolderNode, true)
    end
end

---@return void
function SharedSet.setNodeMaterialColor(xmlFile, xmlKey, node, nodeAttribute)
    local visualNode = nodeAttribute ~= nil and I3DUtil.indexToObject(node, getUserAttribute(node, nodeAttribute)) or node
    local materialName = Utils.getNoNil(getUserAttribute(node, "materialName"), "colorMat0")

    if visualNode == nil or not getHasShaderParameter(visualNode, materialName) then
        return
    end

    local color = xmlFile:getValue(xmlKey .. "#color", nil, true)
    if color ~= nil then
        local _, _, _, materialId = getShaderParameter(visualNode, materialName)
        local r, g, b = unpack(color)
        setShaderParameter(visualNode, materialName, r, g, b, materialId, false)
    end
end

---@return void
function SharedSet.setNodeVisibility(xmlFile, xmlKey, node, nodeAttribute)
    local visualNode = I3DUtil.indexToObject(node, getUserAttribute(node, nodeAttribute))
    if visualNode ~= nil then
        setVisibility(visualNode, xmlFile:getValue(xmlKey, false))
    end
end

--region XML
---@return void
function SharedSet.registerXMLPaths(schema, baseName)
    XMLExtensions.registerXMLPaths(schema, baseName)

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
