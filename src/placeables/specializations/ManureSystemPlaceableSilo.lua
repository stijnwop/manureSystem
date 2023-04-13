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
ManureSystemPlaceableSilo.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableSilo.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSilo, specializations)
end

---@return void
function ManureSystemPlaceableSilo.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableSilo)
end

---@return void
function ManureSystemPlaceableSilo:onPreLoad(savegame)
    self.spec_manureSystemPlaceableSilo = self[("spec_%s.manureSystemPlaceableSilo"):format(ManureSystemPlaceableSilo.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onDelete", ManureSystemPlaceableSilo)
    end
end

---@return void
function ManureSystemPlaceableSilo:onLoad(savegame)
    local spec = self.spec_silo
    if spec.storages ~= nil then
        for _, storage in ipairs(spec.storages) do
            local manureSystemStorage = table.copy(storage, math.huge)
            if manureSystemStorage ~= nil then
                manureSystemStorage.getOwnerFarmId = function(_, ...)
                    return storage:getOwnerFarmId(...)
                end

                manureSystemStorage.getSupportedFillTypes = function(_, ...)
                    return storage:getSupportedFillTypes(...)
                end

                manureSystemStorage.getIsFillTypeSupported = function(_, ...)
                    return storage:getIsFillTypeSupported(...)
                end

                manureSystemStorage.setFillLevel = function(_, ...)
                    return storage:setFillLevel(...)
                end

                manureSystemStorage.getFillLevel = function(_, ...)
                    return storage:getFillLevel(...)
                end

                manureSystemStorage.getFillLevels = function(_, ...)
                    return storage:getFillLevels(...)
                end

                manureSystemStorage.getCapacity = function(_, ...)
                    return storage:getCapacity(...)
                end

                manureSystemStorage.getFreeCapacity = function(_, ...)
                    return storage:getFreeCapacity(...)
                end

                manureSystemStorage.canFarmAccess = function(_, farmId)
                    if spec.loadingStation ~= nil then
                        return spec.loadingStation:hasFarmAccessToStorage(farmId, manureSystemStorage)
                    end

                    return g_currentMission.accessHandler:canFarmAccess(farmId, manureSystemStorage)
                end

                manureSystemStorage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
                    local oldFillLevel = manureSystemStorage:getFillLevel(fillTypeIndex)
                    manureSystemStorage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
                    local newFillLevel = manureSystemStorage:getFillLevel(fillTypeIndex)

                    return newFillLevel - oldFillLevel
                end

                if self:addManureSystemStorage(manureSystemStorage) then
                    self.spec_manureSystemPlaceableSilo.storage = manureSystemStorage
                end
            end
        end
    end
end

---@return void
function ManureSystemPlaceableSilo:onDelete()
    local spec = self.spec_manureSystemPlaceableSilo
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
