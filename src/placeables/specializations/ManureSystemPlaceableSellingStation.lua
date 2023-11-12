--
-- ManureSystemPlaceableSellingStation
--
-- Author: Stijn Wopereis
-- Description: Add manure system compatibility to selling stations
-- Name: ManureSystemPlaceableSellingStation
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableSellingStation
ManureSystemPlaceableSellingStation = {}
ManureSystemPlaceableSellingStation.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableSellingStation.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSellingStation, specializations)
end

---@return void
function ManureSystemPlaceableSellingStation.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableSellingStation)
    SpecializationUtil.registerEventListener(placeableType, "onPostLoad", ManureSystemPlaceableSellingStation)
    SpecializationUtil.registerEventListener(placeableType, "onPreDelete", ManureSystemPlaceableSellingStation)
end

---@return void
function ManureSystemPlaceableSellingStation:onPreLoad(savegame)
    self.spec_manureSystemPlaceableSellingStation = self[("spec_%s.manureSystemPlaceableSellingStation"):format(ManureSystemPlaceableSellingStation.MOD_NAME)]

    if self.addManureSystemStorage == nil or self.removeManureSystemStorage == nil then
        SpecializationUtil.removeEventListener(self, "onPostLoad", ManureSystemPlaceableSellingStation)
        SpecializationUtil.removeEventListener(self, "onPreDelete", ManureSystemPlaceableSellingStation)
    end
end

---@return void
function ManureSystemPlaceableSellingStation:onPostLoad(savegame)
    local sellingStation = self:getSellingStation()
    if sellingStation ~= nil then
        local manureSystemStorage = {}

        manureSystemStorage.getOwnerFarmId = function(_, ...)
            return sellingStation:getOwnerFarmId(...)
        end

        manureSystemStorage.getSupportedFillTypes = function(_)
            return sellingStation.acceptedFillTypes
        end

        manureSystemStorage.getIsFillTypeSupported = function(_, fillTypeIndex)
            return sellingStation.acceptedFillTypes[fillTypeIndex]
        end

        manureSystemStorage.getFillLevel = function(_, fillTypeIndex)
            return 0
        end

        manureSystemStorage.getFillLevels = function(_)
            local fillLevels = {}
            for fillTypeIndex, _ in pairs(sellingStation.acceptedFillTypes) do
                fillLevels[fillTypeIndex] = 0
            end
            return fillLevels
        end

        manureSystemStorage.getCapacity = function(_, fillTypeIndex)
            return math.huge
        end

        manureSystemStorage.getFreeCapacity = function(_, fillTypeIndex)
            return math.huge
        end

        manureSystemStorage.canFarmAccess = function(_, farmId)
            return g_currentMission.accessHandler:canFarmAccess(farmId, manureSystemStorage)
        end

        manureSystemStorage.changeFillLevel = function(_, farmId, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
            local ownerFarmId = self:getOwnerFarmId()
            if ownerFarmId ~= AccessHandler.EVERYONE then
                farmId = ownerFarmId
            end

            return sellingStation:addFillLevelFromTool(farmId, fillLevelDelta, fillTypeIndex, fillPositionData, toolType)
        end

        if self:addManureSystemStorage(manureSystemStorage) then
            self.spec_manureSystemPlaceableSellingStation.storage = manureSystemStorage
        end
    end
end

---@return void
function ManureSystemPlaceableSellingStation:onPreDelete()
    local spec = self.spec_manureSystemPlaceableSellingStation
    if spec.storage ~= nil then
        self:removeManureSystemStorage(spec.storage)
        spec.storage = nil
    end
end
