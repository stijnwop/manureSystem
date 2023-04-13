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
ManureSystemPlaceableHusbandry.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableHusbandry.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableHusbandry, specializations)
end

---@return void
function ManureSystemPlaceableHusbandry.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableHusbandry)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableHusbandry)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableHusbandry)
end

---@return void
function ManureSystemPlaceableHusbandry:onPreLoad(savegame)
    self.spec_manureSystemPlaceableHusbandry = self[("spec_%s.manureSystemPlaceableHusbandry"):format(ManureSystemPlaceableHusbandry.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableHusbandry)
        SpecializationUtil.removeEventListener(self, "onDelete", ManureSystemPlaceableHusbandry)
    end
end

---@return void
function ManureSystemPlaceableHusbandry:onLoad(savegame)
    local spec = self.spec_husbandry

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
            self.spec_manureSystemPlaceableHusbandry.storage = manureSystemStorage
        end
    end
end

---@return void
function ManureSystemPlaceableHusbandry:onDelete()
    local spec = self.spec_manureSystemPlaceableHusbandry
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
