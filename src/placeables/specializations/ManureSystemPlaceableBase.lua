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

    SpecializationUtil.registerFunction(placeableType, "getCanDisableVanillaUnloading", ManureSystemPlaceableBase.getCanDisableVanillaUnloading)
    SpecializationUtil.registerFunction(placeableType, "getCanDisableVanillaLoading", ManureSystemPlaceableBase.getCanDisableVanillaLoading)

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
    local success, index = table.addElement(self.spec_manureSystemPlaceableBase.storages, storage)

    if success then
        storage.index = index
    end

    return success, index
end

---@return boolean
function ManureSystemPlaceableBase:removeManureSystemStorage(storage)
    local success = table.removeElement(self.spec_manureSystemPlaceableBase.storages, storage)

    if success then
        for i, storage in ipairs(self.spec_manureSystemPlaceableBase.storages) do
            storage.index = i
        end
    end

    return success
end

---@return boolean
function ManureSystemPlaceableBase:getCanDisableVanillaUnloading(sourceObject, trigger)
    return true
end

---@return boolean
function ManureSystemPlaceableBase:getCanDisableVanillaLoading(targetObject, trigger)
    if trigger ~= nil and trigger.effects ~= nil and #trigger.effects > 0 then
        if targetObject ~= nil then
            if g_currentMission.manureSystem:getObjectSupportsFillArms(targetObject) then
                return false
            end

            if targetObject.getCoverByFillUnitIndex ~= nil then
                local spec = targetObject.spec_cover
                if spec.hasCovers then
                    if targetObject.getPumpSourceObjectOrSelf ~= nil then
                        local pumpObject, fillUnitIndex = targetObject:getPumpSourceObjectOrSelf()
                        if pumpObject == targetObject then
                            local cover = targetObject:getCoverByFillUnitIndex(fillUnitIndex)
                            if cover ~= nil then
                                return false
                            end
                        end
                    end

                    if targetObject.getConnectors ~= nil then
                        for _, connector in ipairs(targetObject:getConnectors()) do
                            local cover = targetObject:getCoverByFillUnitIndex(connector.fillUnitIndex)
                            if cover ~= nil then
                                return false
                            end
                        end
                    end

                    if targetObject.getFillArms ~= nil then
                        for _, fillArm in ipairs(targetObject:getFillArms()) do
                            local cover = targetObject:getCoverByFillUnitIndex(fillArm.fillUnitIndex)
                            if cover ~= nil then
                                return false
                            end
                        end
                    end
                end
            end
        end
    end

    return true
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
        return 0
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

    if fillLevelDelta ~= 0 then
        local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
        if storage ~= nil and storage:canFarmAccess(farmId) then
            if self:getFillUnitAllowsFillType(fillUnitIndex, fillTypeIndex) then
                movedFillLevel = storage:changeFillLevel(farmId, fillLevelDelta, fillTypeIndex, ...)

                if movedFillLevel >= math.abs(fillLevelDelta) - 0.001 then
                    movedFillLevel = fillLevelDelta
                end
            end
        end
    end

    return movedFillLevel
end
