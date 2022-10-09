----------------------------------------------------------------------------------------------------
-- ManureSystemUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemUtil utility.
--
-- Copyright (c) Wopster, 2018
----------------------------------------------------------------------------------------------------

---@class ManureSystemUtil
ManureSystemUtil = {}

---Does a sanitized replacement with the given `what` value in the given `input` with the `with` value.
function ManureSystemUtil.replaceSanitized(input, what, with)
    what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") -- escape pattern
    with = string.gsub(with, "[%%]", "%%%%") -- escape replacement
    return input:gsub(what, with)
end

---Gets the first found physics node when the root node isn't a rigid body.
function ManureSystemUtil.getFirstPhysicsNode(nodeId)
    if getRigidBodyType(nodeId) ~= RigidBodyType.NONE then
        return nodeId
    end

    for i = 0, getNumOfChildren(nodeId) - 1 do
        local tmp = ManureSystemUtil.getFirstPhysicsNode(getChildAt(nodeId, i))

        if tmp ~= 0 then
            return tmp
        end
    end

    return 0
end

---Loads the optional rotation and position for the given node and applies it.
function ManureSystemUtil.loadNodePositionAndRotation(xmlFile, xmlKey, node)
    local x, y, z = xmlFile:getValue(xmlKey .. "#position", nil, false)
    if x ~= nil and y ~= nil and z ~= nil then
        setTranslation(node, x, y, z)
    end

    local xRot, yRot, zRot = xmlFile:getValue(xmlKey .. "#rotation", nil, false)
    if xRot ~= nil and yRot ~= nil and zRot ~= nil then
        setRotation(node, xRot, yRot, zRot)
    end
end

function ManureSystemUtil.setSharedSetNodeMaterialColor(xmlFile, xmlKey, node, nodeAttribute)
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

function ManureSystemUtil.setSharedSetNodeVisibility(xmlFile, xmlKey, node, nodeAttribute)
    local visualNode = I3DUtil.indexToObject(node, getUserAttribute(node, nodeAttribute))
    if visualNode ~= nil then
        setVisibility(visualNode, xmlFile:getValue(xmlKey, false))
    end
end
