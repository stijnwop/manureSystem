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

---Gets the first found physics node when the root node isn't a rigid body.
function ManureSystemUtil.getFirstPhysicsNode(nodeId)
    if getRigidBodyType(nodeId):lower() ~= ManureSystemUtil.NO_RIGID_BODY then
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
