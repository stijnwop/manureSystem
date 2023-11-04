--
-- ManureSystemAnimatedObjectExtension
--
-- Author: Stijn Wopereis
-- Description: Extensions for placeable animations
-- Name: ManureSystemAnimatedObjectExtension
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@return boolean
function Placeable:getIsAnimationPlaying(id)
    local spec = self.spec_animatedObjects
    if spec == nil or spec.animatedObjects == nil then
        return false
    end

    local animatedObject = spec.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.isMoving
    end

    return false
end

---@return number the animation time
function Placeable:getAnimationTime(id)
    local spec = self.spec_animatedObjects
    if spec == nil or spec.animatedObjects == nil then
        return 0
    end

    local animatedObject = spec.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.animation.time
    end

    return 0
end

---@return void
function Placeable:playAnimation(id, dir)
    local spec = self.spec_animatedObjects

    if spec == nil or spec.animatedObjects == nil then
        return
    end

    local animatedObject = spec.animatedObjects[id]
    if animatedObject ~= nil then
        animatedObject:setDirection(dir)
    end
end
