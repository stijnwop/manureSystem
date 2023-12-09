--
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
    if SpecializationUtil.hasSpecialization(PlaceableProductionPoint, specializations) then
        return true
    end

    if pdlc_pumpsAndHosesPack ~= nil and SpecializationUtil.hasSpecialization(pdlc_pumpsAndHosesPack.SandboxPlaceableProductionPoint, specializations) then
        return true
    end

    for _, specializationObject in ipairs(specializations) do
        if ManureSystem.getTypeNameModType(specializationObject.className) == "PlaceableExtendedProductionPoint" then
            return true
        end
    end

    return false
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
    local productionPoint = ManureSystemPlaceableProductionPoint.getProductionPoint(self)
    if productionPoint ~= nil then
        if self:addManureSystemStorage(productionPoint.storage) then
            productionPoint.storage.canFarmAccess = function(_, farmId)
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
    local productionPoint = ManureSystemPlaceableProductionPoint.getProductionPoint(self)
    if productionPoint ~= nil then
        self:removeManureSystemStorage(productionPoint.storage)
    end
end

---@return table | nil
function ManureSystemPlaceableProductionPoint.getProductionPoint(self)
    if self.spec_productionPoint ~= nil then
        return self.spec_productionPoint.productionPoint
    end

    if self.spec_sandboxPlaceableProductionPoint ~= nil then
        return self.spec_sandboxPlaceableProductionPoint.productionPoint
    end

    if self.spec_extendedProductionPoint ~= nil then
        return self.spec_extendedProductionPoint.productionPoint
    end

    return nil
end
