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

---@return boolean
function ManureSystemPlaceableProductionPoint.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableProductionPoint, specializations)
end

---@return void
function ManureSystemPlaceableProductionPoint.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableProductionPoint)
    SpecializationUtil.registerEventListener(placeableType, "onPostLoad", ManureSystemPlaceableProductionPoint)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableProductionPoint)
end

---@return void
function ManureSystemPlaceableProductionPoint:onPreLoad(savegame)
    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onPostLoad", ManureSystemPlaceableProductionPoint)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableProductionPoint)
    end
end

---@return void
function ManureSystemPlaceableProductionPoint:onPostLoad(savegame)
    local productionPoint = self.spec_productionPoint.productionPoint
    if productionPoint ~= nil then
        if self:addManureSystemStorage(productionPoint.storage) then
            productionPoint.storage.canFarmAccess = function(_, farmId)
                if productionPoint.isOwned then
                    if productionPoint.loadingStation ~= nil then
                        return productionPoint.loadingStation:hasFarmAccessToStorage(farmId, productionPoint.storage)
                    end
                end

                return g_currentMission.accessHandler:canFarmAccess(farmId, productionPoint.storage)
            end

            productionPoint.storage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
                if not productionPoint.isOwned then
                    if productionPoint.unloadingStation ~= nil then
                        return productionPoint.unloadingStation:addFillLevelFromTool(farmId, fillLevelDelta, fillTypeIndex, fillPositionData, toolType)
                    end

                    return 0
                end

                local oldFillLevel = productionPoint.storage:getFillLevel(fillTypeIndex)
                productionPoint.storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
                local newFillLevel = productionPoint.storage:getFillLevel(fillTypeIndex)

                return newFillLevel - oldFillLevel
            end
        end
    end
end

---@return void
function ManureSystemPlaceableProductionPoint:onPreDelete()
    local productionPoint = self.spec_productionPoint.productionPoint
    if productionPoint ~= nil then
        self:removeManureSystemStorage(productionPoint.storage)
    end
end
