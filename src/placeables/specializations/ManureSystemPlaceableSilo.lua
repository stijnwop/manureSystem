-- ManureSystemPlaceableSilo
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to silos
-- Name: ManureSystemPlaceableSilo
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableSilo
ManureSystemPlaceableSilo = {}

---@return boolean
function ManureSystemPlaceableSilo.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSilo, specializations)
end

---@return void
function ManureSystemPlaceableSilo.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableSilo)
end

---@return void
function ManureSystemPlaceableSilo:onPreLoad(savegame)
    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableSilo)
    end
end

---@return void
function ManureSystemPlaceableSilo:onLoad(savegame)
    local spec = self.spec_silo
    if spec.storages ~= nil then
        for _, storage in ipairs(spec.storages) do
            if self:addManureSystemStorage(storage) then
                storage.canFarmAccess = function(_, farmId)
                    if spec.loadingStation ~= nil then
                        return spec.loadingStation:hasFarmAccessToStorage(farmId, storage)
                    end

                    return g_currentMission.accessHandler:canFarmAccess(farmId, storage)
                end

                storage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
                    local oldFillLevel = storage:getFillLevel(fillTypeIndex)
                    storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
                    local newFillLevel = storage:getFillLevel(fillTypeIndex)

                    return newFillLevel - oldFillLevel
                end
            end
        end
    end
end

---@return void
function ManureSystemPlaceableSilo:onPreDelete()
    local spec = self.spec_silo
    if spec.storages ~= nil then
        for _, storage in ipairs(spec.storages) do
            self:removeManureSystemStorage(storage)
        end
    end
end
