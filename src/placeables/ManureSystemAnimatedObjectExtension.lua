----------------------------------------------------------------------------------------------------
-- ManureSystemAnimatedObjectExtension
----------------------------------------------------------------------------------------------------
-- Purpose: Animated object function extension on the placeables in order to play animations by function.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

function Placeable:getIsAnimationPlaying(id)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.isMoving
    end

    return false
end

function Placeable:getAnimationTime(id)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        return animatedObject.animation.time
    end

    return 0
end

function Placeable:playAnimation(id, dir)
    local animatedObject = self.animatedObjects[id]
    if animatedObject ~= nil then
        animatedObject.animation.direction = dir
        animatedObject:raiseActive()
    end
end
