----------------------------------------------------------------------------------------------------
-- ManureSystemXMLUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemXMLUtil utility.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemXMLUtil
ManureSystemXMLUtil = {}

---Validates the given node on scale and physics state.
function ManureSystemXMLUtil.isValidNode(node, checkPhysics)
    if checkPhysics then
        if not (getRigidBodyType(node) ~= RigidBodyType.NONE) then
            Logger.warning(("Node with wrong rigid body type found for manure system node '%s'. Please link to a rigid body node!"):format(getName(node)))
            return false
        end
    end

    local x, y, z = getScale(node)
    if x ~= 1 or y ~= 1 or z ~= 1 then
        Logger.warning(("Node with bad scale found for manure system node '%s'. Reset/freeze scale to 1"):format(getName(node)))
        return false
    end

    return true
end

function ManureSystemXMLUtil.registerNodeCreationXMLPaths(schema, baseName)
    schema:register(XMLValueType.NODE_INDEX, baseName .. "#node", "The node")
    schema:register(XMLValueType.BOOL, baseName .. "#createNode", "Create the node")
    schema:register(XMLValueType.NODE_INDEX, baseName .. "#linkNode", "Link node for linking the created nodes to")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. "#position", "The position")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. "#rotation", "The rotation")
end

---Gets a node or creates a node when set.
function ManureSystemXMLUtil.getOrCreateNode(vehicle, xmlFile, key, index)
    if xmlFile:getValue(key .. "#createNode", false) then
        if index == nil then
            index = 0
        end

        local node = createTransformGroup(("manureSystemConnector_node_%d"):format(index + 1))
        local linkNode = xmlFile:getValue(key .. "#linkNode", "0>", vehicle.components, vehicle.i3dMappings)
        local checkPhysics = vehicle.owner ~= nil and (vehicle.owner:isa(Placeable) or vehicle.owner:isa(Bga)) or (vehicle:isa(Placeable) or vehicle:isa(Bga))
        if not ManureSystemXMLUtil.isValidNode(linkNode, checkPhysics) then
            return nil
        end

        local parentNode = getParent(linkNode)
        if not ManureSystemXMLUtil.isValidNode(parentNode) then
            return nil
        end

        ManureSystemUtil.loadNodePositionAndRotation(xmlFile, key, node)
        link(linkNode, node)

        return node
    end

    return xmlFile:getValue(key .. "#node", nil, vehicle.components, vehicle.i3dMappings)
end
