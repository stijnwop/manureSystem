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

        local currentNode = linkNode
        while currentNode ~= object.rootNode do
            if not NodeExtensions.hasFrozenScale(currentNode) then
                Logging.xmlWarning(xmlFile, "Freeze scale of node '%s'.", getName(currentNode))
                return nil
            end

            currentNode = getParent(currentNode)
        end

        NodeExtensions.setVectorByXML(node, xmlFile, baseKey .. "#position", NodeExtensions.setPosition)
        NodeExtensions.setVectorByXML(node, xmlFile, baseKey .. "#rotation", NodeExtensions.setRotation)

        setVisibility(linkNode, true)

        if not getEffectiveVisibility(linkNode) then
            Logging.xmlWarning(xmlFile, "Not all parents of link node '%s' are visible.", getName(linkNode))
        end

        link(linkNode, node)

        return node
    end

    return xmlFile:getValue(baseKey .. "#node", nil, object.components, object.i3dMappings)
end
