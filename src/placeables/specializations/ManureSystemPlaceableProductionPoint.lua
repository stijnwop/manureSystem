-- ManureSystemPlaceableProductionPoint
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to production points
-- Name: ManureSystemPlaceableProductionPoint
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableProductionPoint
ManureSystemPlaceableProductionPoint = {}
ManureSystemPlaceableProductionPoint.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableProductionPoint.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableProductionPoint, specializations)
end

---@return void
function ManureSystemPlaceableProductionPoint.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableProductionPoint)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableProductionPoint)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableProductionPoint)
end

---@return void
function ManureSystemPlaceableProductionPoint:onPreLoad(savegame)
    self.spec_manureSystemPlaceableProductionPoint = self[("spec_%s.manureSystemPlaceableProductionPoint"):format(ManureSystemPlaceableProductionPoint.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onLoad", ManureSystemPlaceableProductionPoint)
        SpecializationUtil.removeEventListener(self, "onDelete", ManureSystemPlaceableProductionPoint)
    end
end

---@return void
function ManureSystemPlaceableProductionPoint:onLoad(savegame)
    local productionPoint = self.spec_productionPoint.productionPoint
    if productionPoint ~= nil then
        local manureSystemStorage = table.copy(productionPoint.storage, 5) -- Todo: "math.huge" results in a stack overflow
        if manureSystemStorage ~= nil then
            manureSystemStorage.getOwnerFarmId = function(_, ...)
                return productionPoint.storage:getOwnerFarmId(...)
            end

            manureSystemStorage.getSupportedFillTypes = function(_, ...)
                return productionPoint.storage:getSupportedFillTypes(...)
            end

            manureSystemStorage.getIsFillTypeSupported = function(_, ...)
                return productionPoint.storage:getIsFillTypeSupported(...)
            end

            manureSystemStorage.setFillLevel = function(_, ...)
                return productionPoint.storage:setFillLevel(...)
            end

            manureSystemStorage.getFillLevel = function(_, ...)
                return productionPoint.storage:getFillLevel(...)
            end

            manureSystemStorage.getFillLevels = function(_, ...)
                return productionPoint.storage:getFillLevels(...)
            end

            manureSystemStorage.getCapacity = function(_, ...)
                return productionPoint.storage:getCapacity(...)
            end

            manureSystemStorage.getFreeCapacity = function(_, ...)
                return productionPoint.storage:getFreeCapacity(...)
            end

            manureSystemStorage.canFarmAccess = function(_, farmId)
                if productionPoint.loadingStation ~= nil then
                    return productionPoint.loadingStation:hasFarmAccessToStorage(farmId, manureSystemStorage)
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
                self.spec_manureSystemPlaceableProductionPoint.storage = manureSystemStorage
            end
        end
    end
end

---@return void
function ManureSystemPlaceableProductionPoint:onDelete()
    local spec = self.spec_manureSystemPlaceableProductionPoint
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
