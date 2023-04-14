-- ManureSystemPlaceableHusbandry
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to husbandries
-- Name: ManureSystemPlaceableHusbandry
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableHusbandry
ManureSystemPlaceableHusbandry = {}

---@return boolean
function ManureSystemPlaceableHusbandry.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableHusbandry, specializations)
end

---@return void
function ManureSystemPlaceableHusbandry.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableHusbandry)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableHusbandry)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableHusbandry)
end

---@return void
function ManureSystemPlaceableHusbandry:onPreLoad(savegame)
    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableHusbandry)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableHusbandry)
    end
end

---@return void
function ManureSystemPlaceableHusbandry:onLoad(savegame)
    local spec = self.spec_husbandry

    if self:addManureSystemStorage(spec.storage) then
        spec.storage.canFarmAccess = function(_, farmId)
            if spec.loadingStation ~= nil then
                return spec.loadingStation:hasFarmAccessToStorage(farmId, spec.storage)
            end

            return g_currentMission.accessHandler:canFarmAccess(farmId, spec.storage)
        end

        spec.storage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
            local oldFillLevel = spec.storage:getFillLevel(fillTypeIndex)
            spec.storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
            local newFillLevel = spec.storage:getFillLevel(fillTypeIndex)

            return newFillLevel - oldFillLevel
        end
    end
end

---@return void
function ManureSystemPlaceableHusbandry:onPreDelete()
    self:removeManureSystemStorage(self.spec_husbandry.storage)
end
