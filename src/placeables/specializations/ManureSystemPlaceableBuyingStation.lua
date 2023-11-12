--
-- ManureSystemPlaceableBuyingStation
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to buying stations
-- Name: ManureSystemPlaceableBuyingStation
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableBuyingStation
ManureSystemPlaceableBuyingStation = {}
ManureSystemPlaceableBuyingStation.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableBuyingStation.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableBuyingStation, specializations)
end

---@return void
function ManureSystemPlaceableBuyingStation.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableBuyingStation)
    SpecializationUtil.registerEventListener(placeableType, "onPostLoad", ManureSystemPlaceableBuyingStation)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableBuyingStation)
end

---@return void
function ManureSystemPlaceableBuyingStation:onPreLoad(savegame)
    self.spec_manureSystemPlaceableBuyingStation = self[("spec_%s.manureSystemPlaceableBuyingStation"):format(ManureSystemPlaceableBuyingStation.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onPostLoad", ManureSystemPlaceableBuyingStation)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableBuyingStation)
    end
end

---@return void
function ManureSystemPlaceableBuyingStation:onPostLoad(savegame)
    local buyingStation = self:getBuyingStation()
    if buyingStation ~= nil then
        local manureSystemStorage = {}

        manureSystemStorage.getOwnerFarmId = function(_, ...)
            return buyingStation:getOwnerFarmId(...)
        end

        manureSystemStorage.getSupportedFillTypes = function(_)
            return buyingStation.providedFillTypes
        end

        manureSystemStorage.getIsFillTypeSupported = function(_, fillTypeIndex)
            return buyingStation.providedFillTypes[fillTypeIndex]
        end

        manureSystemStorage.getFillLevel = function(_, fillTypeIndex)
            return math.huge
        end

        manureSystemStorage.getFillLevels = function(_)
            local fillLevels = {}
            for fillTypeIndex, _ in pairs(buyingStation.providedFillTypes) do
                fillLevels[fillTypeIndex] = math.huge
            end
            return fillLevels
        end

        manureSystemStorage.getCapacity = function(_, fillTypeIndex)
            return 0
        end

        manureSystemStorage.getFreeCapacity = function(_, fillTypeIndex)
            return 0
        end

        manureSystemStorage.canFarmAccess = function(_, farmId)
            return g_currentMission.accessHandler:canFarmAccess(farmId, manureSystemStorage)
        end

        local fillableObject = {}

        fillableObject.addFillUnitFillLevel = function(_, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
            return fillLevelDelta
        end

        manureSystemStorage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
            fillableObject.getOwnerFarmId = function(_, ...)
                local ownerFarmId = self:getOwnerFarmId(...)
                if ownerFarmId ~= AccessHandler.EVERYONE then
                    return ownerFarmId
                end

                return farmId
            end

            return -(buyingStation:addFillLevelToFillableObject(fillableObject, 1, fillTypeIndex, -fillLevelDelta, fillPositionData, toolType or ToolType.UNDEFINED))
        end

        if self:addManureSystemStorage(manureSystemStorage) then
            self.spec_manureSystemPlaceableBuyingStation.storage = manureSystemStorage
        end
    end
end

---@return void
function ManureSystemPlaceableBuyingStation:onPreDelete()
    local spec = self.spec_manureSystemPlaceableBuyingStation
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
