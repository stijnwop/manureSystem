-- ManureSystemPlaceableSiloExtension
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to silo extensions
-- Name: ManureSystemPlaceableSiloExtension
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableSiloExtension
ManureSystemPlaceableSiloExtension = {}

---@return boolean
function ManureSystemPlaceableSiloExtension.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSiloExtension, specializations)
end

---@return void
function ManureSystemPlaceableSiloExtension.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableSiloExtension)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableSiloExtension)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableSiloExtension)
end

---@return void
function ManureSystemPlaceableSiloExtension:onPreLoad(savegame)
    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableSiloExtension)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableSiloExtension)
    end
end

---@return void
function ManureSystemPlaceableSiloExtension:onLoad(savegame)
    local spec = self.spec_siloExtension

    if self:addManureSystemStorage(spec.storage) then
        spec.storage.canFarmAccess = function(_, farmId)
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
function ManureSystemPlaceableSiloExtension:onPreDelete()
    self:removeManureSystemStorage(self.spec_siloExtension.storage)
end
