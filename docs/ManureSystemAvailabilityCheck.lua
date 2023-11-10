--
-- ManureSystemAvailabilityCheck
--
-- Author: Wopster (Stijn Wopereis)
-- Description: Removes ManureSystem-dependend store items from the store if ManureSystem is not available.
-- Name: ManureSystemAvailabilityCheck
-- Hide: yes
--
-- Copyright (c) Wopster, 2022

local modDirectory = g_currentModDirectory
local modName = g_currentModName

local storeItems = {}
local modDesc = loadXMLFile("modDesc", modDirectory .. "modDesc.xml")

local i = 0
while true do
    local storeItemKey = ("modDesc.storeItems.storeItem(%d)"):format(i)
    if not hasXMLProperty(modDesc, storeItemKey) then break end
    local xmlFilename = getXMLString(modDesc, storeItemKey .. "#xmlFilename")
    storeItems[xmlFilename] = true
    i = i + 1
end

delete(modDesc)

local function isManureSystemActive()
    -- Might not be set at this point
    if g_currentMission ~= nil and g_currentMission.manureSystem ~= nil then
        return true
    end

    return g_modIsLoaded["FS22_manureSystem"] or g_modIsLoaded["fs22_manureSystem"]
end

local function ignoreStoreItems(self, superFunc, xmlFilename, baseDir, ...)
    if baseDir == modDirectory and storeItems[xmlFilename] ~= nil then
        return nil
    end

    return superFunc(self, xmlFilename, baseDir, ...)
end

local function validateVehicleTypes()
    if not isManureSystemActive() then
        log(("Warning: ManureSystem is missing. %s will be removed from the store."):format(modName))
        StoreManager.loadItem = Utils.overwrittenFunction(StoreManager.loadItem, ignoreStoreItems)
    end
end

FillTypeManager.validateVehicleTypes = Utils.prependedFunction(FillTypeManager.validateVehicleTypes, validateVehicleTypes)
