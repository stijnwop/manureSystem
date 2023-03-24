--
-- XMLExtensions
--
-- Author: Stijn Wopereis
-- Description: XML extensions
-- Name: XMLExtensions
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class XMLExtensions
XMLExtensions = {}

---Register XML paths in order to use the extensions
---@return void
function XMLExtensions.registerXMLPaths(schema, baseName)
    schema:register(XMLValueType.NODE_INDEX, baseName .. "#node", "The node")
    schema:register(XMLValueType.BOOL, baseName .. "#createNode", "Create the node")
    schema:register(XMLValueType.NODE_INDEX, baseName .. "#linkNode", "Link node for linking the created nodes to")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. "#position", "The position")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. "#rotation", "The rotation")
end

---@return number | nil
function XMLExtensions.ensureExistingNode(object, xmlFile, baseKey)
    local createNode = xmlFile:getValue(baseKey .. "#createNode", false)
    if createNode then
        local node = createTransformGroup("manureSystemConnector_node")
        local linkNode = xmlFile:getValue(baseKey .. "#linkNode", "0>", object.components, object.i3dMappings)

        if not NodeExtensions.hasFrozenScale(linkNode) then
            Logging.warning(("Freeze scale of link node '%s'"):format(getName(linkNode)))
            return nil
        end

        NodeExtensions.setVectorByXML(node, xmlFile, baseKey .. "#position", NodeExtensions.setPosition)
        NodeExtensions.setVectorByXML(node, xmlFile, baseKey .. "#rotation", NodeExtensions.setRotation)

        link(linkNode, node)

        return node
    end

    return xmlFile:getValue(baseKey .. "#node", nil, object.components, object.i3dMappings)
end
