---@class XMLExtensions
XMLExtensions = {}

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
