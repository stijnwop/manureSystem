--
-- FillPlaneRayCast
--
-- Author: Stijn Wopereis
-- Description: ray cast wrapper for manure system fill planes.
-- Name: FillPlaneRayCast
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class FillPlaneRayCast
FillPlaneRayCast = {}
FillPlaneRayCast.DEFAULT_DISTANCE = 5
FillPlaneRayCast.DEBUG_COLOR_HIT = { 0, 1, 0 }
FillPlaneRayCast.DEBUG_COLOR_MISS = { 1, 0, 0 }

local FillPlaneRayCast_mt = Class(FillPlaneRayCast)

---@return FillPlaneRayCast
function FillPlaneRayCast.new(distance)
    local self = setmetatable({}, FillPlaneRayCast_mt)

    self.distance = distance or FillPlaneRayCast.DEFAULT_DISTANCE
    self.mask = CollisionFlag.STATIC_OBJECT + CollisionFlag.VEHICLE + CollisionFlag.FILLABLE
    self.isAllowed = true

    self.hitObject = nil
    self.hitDistance = nil

    return self
end

---@return void
function FillPlaneRayCast:setIsAllowed(isAllowed)
    self.isAllowed = isAllowed
end

---@return void
function FillPlaneRayCast:clear()
    local object = self.hitObject
    if object ~= nil and object.resetFillPlaneInfo ~= nil then
        object:resetFillPlaneInfo()
    end

    self.hitObject = nil
    self.hitDistance = nil
end

---@return void
function FillPlaneRayCast:castRay(x, y, z, dx, dy, dz, distance)
    distance = distance or self.distance

    if not self.isAllowed then
        return
    end

    self:clear()

    raycastAll(x, y, z, dx, dy, dz, "castCallback", distance, self, self.mask, true)

    if g_currentMission.manureSystem.debug then
        local color = self.hitObject ~= nil and FillPlaneRayCast.DEBUG_COLOR_HIT or FillPlaneRayCast.DEBUG_COLOR_MISS
        drawDebugArrow(x, y, z, dx * distance, dy * distance, dz * distance, 0.3, 0.3, 0.3, color[1], color[2], color[3], true)
    end

    return self.hitObject, self.hitDistance
end

---@return boolean
function FillPlaneRayCast:castCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast)
    if hitObjectId ~= 0 then
        if hitObjectId == g_currentMission.terrainRootNode then
            return true
        end

        local object = g_currentMission:getNodeObject(hitObjectId)
        if object ~= nil and object.isUnderFillPlane ~= nil then
            self.hitDistance = distance
            self.hitObject = object

            if object.updateFillPlaneInfo ~= nil then
                object:updateFillPlaneInfo(x, y, z)
            end

            return false
        end
    end

    return true
end
