-- ManureSystemPlaceableBase
--
-- Author: Stijn Wopereis
-- Description: Manure system implementation for placeables
-- Name: ManureSystemPlaceableBase
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableBase
ManureSystemPlaceableBase = {}
ManureSystemPlaceableBase.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableBase.prerequisitesPresent(specializations)
    return true
end

---@return void
function ManureSystemPlaceableBase.registerFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "getManureSystemStorages", ManureSystemPlaceableBase.getManureSystemStorages)
    SpecializationUtil.registerFunction(placeableType, "getManureSystemStorageByIndex", ManureSystemPlaceableBase.getManureSystemStorageByIndex)
    SpecializationUtil.registerFunction(placeableType, "addManureSystemStorage", ManureSystemPlaceableBase.addManureSystemStorage)
    SpecializationUtil.registerFunction(placeableType, "removeManureSystemStorage", ManureSystemPlaceableBase.removeManureSystemStorage)

    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillType", ManureSystemPlaceableBase.getFillUnitFillType)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitAllowsFillType", ManureSystemPlaceableBase.getFillUnitAllowsFillType)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillLevel", ManureSystemPlaceableBase.getFillUnitFillLevel)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillLevelPercentage", ManureSystemPlaceableBase.getFillUnitFillLevelPercentage)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitCapacity", ManureSystemPlaceableBase.getFillUnitCapacity)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFreeCapacity", ManureSystemPlaceableBase.getFillUnitFreeCapacity)
    SpecializationUtil.registerFunction(placeableType, "addFillUnitFillLevel", ManureSystemPlaceableBase.addFillUnitFillLevel)
end

---@return void
function ManureSystemPlaceableBase.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableBase)
end

---@return void
function ManureSystemPlaceableBase:onPreLoad(savegame)
    local spec = self[("spec_%s.manureSystemPlaceableBase"):format(ManureSystemPlaceableBase.MOD_NAME)]
    spec.storages = {}

    self.spec_manureSystemPlaceableBase = spec
end

---@return table
function ManureSystemPlaceableBase:getManureSystemStorages()
    return self.spec_manureSystemPlaceableBase.storages
end

---@return table
function ManureSystemPlaceableBase:getManureSystemStorageByIndex(index)
    return self.spec_manureSystemPlaceableBase.storages[index]
end

---@return boolean, number
function ManureSystemPlaceableBase:addManureSystemStorage(storage)
    return table.addElement(self.spec_manureSystemPlaceableBase.storages, storage)
end

---@return boolean
function ManureSystemPlaceableBase:removeManureSystemStorage(storage)
    return table.removeElement(self.spec_manureSystemPlaceableBase.storages, storage)
end

---@return number
function ManureSystemPlaceableBase:getFillUnitFillType(fillUnitIndex)
    return FillType.UNKNOWN
end

---@return boolean
function ManureSystemPlaceableBase:getFillUnitAllowsFillType(fillUnitIndex, fillTypeIndex)
    local fillType = self:getFillUnitFillType(fillUnitIndex)
    if fillType ~= FillType.UNKNOWN and fillType ~= fillTypeIndex then
        return false
    end

    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage ~= nil then
        return storage:getIsFillTypeSupported(fillTypeIndex)
    end

    return false
end

---@return number
function ManureSystemPlaceableBase:getFillUnitFillLevel(fillUnitIndex)
    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage ~= nil then
        local fillType = self:getFillUnitFillType(fillUnitIndex)
        return storage:getFillLevel(fillType)
    end

    return 0
end

---@return number
function ManureSystemPlaceableBase:getFillUnitFillLevelPercentage(fillUnitIndex)
    local capacity = self:getFillUnitCapacity(fillUnitIndex)
    if capacity <= 0 then
        return 1
    end

    local fillLevel = self:getFillUnitFillLevel(fillUnitIndex)

    return fillLevel / capacity
end

---@return number
function ManureSystemPlaceableBase:getFillUnitCapacity(fillUnitIndex)
    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage ~= nil then
        local fillType = self:getFillUnitFillType(fillUnitIndex)
        return storage:getCapacity(fillType)
    end

    return 0
end

---@return number
function ManureSystemPlaceableBase:getFillUnitFreeCapacity(fillUnitIndex)
    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage ~= nil then
        local fillType = self:getFillUnitFillType(fillUnitIndex)
        return storage:getFreeCapacity(fillType)
    end

    return 0
end

---@return number
function ManureSystemPlaceableBase:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, ...)
    local movedFillLevel = 0

    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage ~= nil and storage:canFarmAccess(farmId) then
        if self:getFillUnitAllowsFillType(fillUnitIndex, fillTypeIndex) then
            movedFillLevel = storage:changeFillLevel(farmId, fillLevelDelta, fillTypeIndex, ...)

            if movedFillLevel >= fillLevelDelta - 0.001 then
                movedFillLevel = fillLevelDelta
            end
        end
    end

    return movedFillLevel
end
