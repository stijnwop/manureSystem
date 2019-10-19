----------------------------------------------------------------------------------------------------
-- ManureSystemUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemUtil utility.
--
-- Copyright (c) Wopster, 2018
----------------------------------------------------------------------------------------------------

---@class ManureSystemUtil
ManureSystemUtil = {}

ManureSystemUtil.NO_RIGID_BODY = "norigidbody"

---Gets the spec table for the given spec.
function ManureSystemUtil.getSpecTable(vehicle, name)
    local modName = g_manureSystem.modName
    local spec = vehicle["spec_" .. modName .. "." .. name]
    if spec ~= nil then
        return spec
    end

    return vehicle["spec_" .. name]
end

---Gets the first found physics node when the root node isn't a rigid body.
function ManureSystemUtil.getFirstPhysicsNode(node)
    if getRigidBodyType(node):lower() == ManureSystemUtil.NO_RIGID_BODY then
        for i = 1, getNumOfChildren(node) do
            local childNode = getChildAt(node, i - 1)
            if getRigidBodyType(childNode):lower() ~= ManureSystemUtil.NO_RIGID_BODY then
                return childNode
            end
        end
    end

    return node
end
