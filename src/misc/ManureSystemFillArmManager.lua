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

local ManureSystemFillArmManager_mt = Class(ManureSystemFillArmManager)

function ManureSystemFillArmManager.new(modDirectory, customMt)
    local self = setmetatable({}, customMt or ManureSystemFillArmManager_mt)

    self.modDirectory = modDirectory
    self.typeByName = {}
    self.numTypes = 0

    return self
end

function ManureSystemFillArmManager:loadMapData()
    local collisionRoot = g_i3DManager:loadSharedI3DFile(Utils.getFilename("resources/collisions/fillArmCollision.i3d", self.modDirectory), false, false)
    self.collision = getChildAt(collisionRoot, 0)
    setCollisionMask(self.collision, ManureSystemFillArmManager.COLLISION_MASK)

    local effectsRoot = g_i3DManager:loadSharedI3DFile(Utils.getFilename("resources/effects/effect.i3d", self.modDirectory), false, false)
    self.effects = getChildAt(effectsRoot, 0)
end

function ManureSystemFillArmManager:unloadMapData()
    delete(self.collision)
    delete(self.effects)
end

function ManureSystemFillArmManager:getEffectNode()
    return clone(self.effects, false, false, false)
end

function ManureSystemFillArmManager:loadEffectsAtNode(node)
    local effectNode = self:getFillArmEffectNode()
    local effects = g_effectManager:loadFromNode(effectNode, self)

    --Fix values that are not correctly handled by the load from node option.. note for Giants :)
    for _, effect in ipairs(effects) do
        effect.shapeScaleSpread = { 0.6, 1, 1, 0 }
        effect.controlPoint = { 10, 0.25, 0, 0 }
    end

    link(node, effectNode)

    return effects
end
