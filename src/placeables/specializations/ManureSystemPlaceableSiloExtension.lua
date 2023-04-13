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
ManureSystemPlaceableSiloExtension.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableSiloExtension.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSiloExtension, specializations)
end

---@return void
function ManureSystemPlaceableSiloExtension.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableSiloExtension)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableSiloExtension)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableSiloExtension)
end

---@return void
function ManureSystemPlaceableSiloExtension:onPreLoad(savegame)
    self.spec_manureSystemPlaceableSiloExtension = self[("spec_%s.manureSystemPlaceableSiloExtension"):format(ManureSystemPlaceableSiloExtension.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableSiloExtension)
        SpecializationUtil.removeEventListener(self, "onDelete", ManureSystemPlaceableSiloExtension)
    end
end

---@return void
function ManureSystemPlaceableSiloExtension:onLoad(savegame)
    local spec = self.spec_siloExtension

    local manureSystemStorage = table.copy(spec.storage, math.huge)
    if manureSystemStorage ~= nil then
        manureSystemStorage.getOwnerFarmId = function(_, ...)
            return spec.storage:getOwnerFarmId(...)
        end

        manureSystemStorage.getSupportedFillTypes = function(_, ...)
            return spec.storage:getSupportedFillTypes(...)
        end

        manureSystemStorage.getIsFillTypeSupported = function(_, ...)
            return spec.storage:getIsFillTypeSupported(...)
        end

        manureSystemStorage.setFillLevel = function(_, ...)
            return spec.storage:setFillLevel(...)
        end

        manureSystemStorage.getFillLevel = function(_, ...)
            return spec.storage:getFillLevel(...)
        end

        manureSystemStorage.getFillLevels = function(_, ...)
            return spec.storage:getFillLevels(...)
        end

        manureSystemStorage.getCapacity = function(_, ...)
            return spec.storage:getCapacity(...)
        end

        manureSystemStorage.getFreeCapacity = function(_, ...)
            return spec.storage:getFreeCapacity(...)
        end

        manureSystemStorage.canFarmAccess = function(_, farmId)
            return g_currentMission.accessHandler:canFarmAccess(farmId, manureSystemStorage)
        end

        manureSystemStorage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
            local oldFillLevel = manureSystemStorage:getFillLevel(fillTypeIndex)
            manureSystemStorage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
            local newFillLevel = manureSystemStorage:getFillLevel(fillTypeIndex)

            return newFillLevel - oldFillLevel
        end

        if self:addManureSystemStorage(manureSystemStorage) then
            self.spec_manureSystemPlaceableSiloExtension.storage = manureSystemStorage
        end
    end
end

---@return void
function ManureSystemPlaceableSiloExtension:onDelete()
    local spec = self.spec_manureSystemPlaceableSiloExtension
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
