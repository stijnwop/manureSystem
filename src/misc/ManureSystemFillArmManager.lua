----------------------------------------------------------------------------------------------------
-- ManureSystemFillArmManager
----------------------------------------------------------------------------------------------------
-- Purpose: Manager to handle fill arms.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFillArmManager
ManureSystemFillArmManager = {}
ManureSystemFillArmManager.COLLISION_MASK = 8194

local ManureSystemFillArmManager_mt = Class(ManureSystemFillArmManager, AbstractManager)

function ManureSystemFillArmManager:new(customMt)
    local self = AbstractManager:new(customMt or ManureSystemFillArmManager_mt)

    self:initDataStructures()

    return self
end

function ManureSystemFillArmManager:initDataStructures()
    self.typeByName = {}
    self.numTypes = 0
end

function ManureSystemFillArmManager:loadMapData()
    ManureSystemFillArmManager:superClass().loadMapData(self)

    local collisionRoot = g_i3DManager:loadSharedI3DFile("resources/collisions/fillArmCollision.i3d", g_manureSystem.modDirectory, false, true, false)
    self.collision = getChildAt(collisionRoot, 0)
    setCollisionMask(self.collision, ManureSystemFillArmManager.COLLISION_MASK)
end

function ManureSystemFillArmManager:unloadMapData()
    ManureSystemFillArmManager:superClass().unloadMapData(self)
    delete(self.collision)
end
