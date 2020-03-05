----------------------------------------------------------------------------------------------------
-- ManureSystemAvailabilityCheck
----------------------------------------------------------------------------------------------------
-- Purpose:  Removes ManureSystem-dependend store items from the store if ManureSystem is not available.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

local modDirectory = g_currentModDirectory
local modName = g_currentModName

-- Modify this name when dealing with other objects!
local storeItemXMLFile = "OUR_XML_FILENAME.xml"

local function isManureSystemActive()
    -- Might not be set at this point
    if g_manureSystem ~= nil then
        return true
    end

    return g_modIsLoaded["FS19_manureSystem"]
end

local function ignoreStoreItems(self, superFunc, xmlFilename, baseDir, ...)
    if baseDir == modDirectory and xmlFilename == storeItemXMLFile then
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

VehicleTypeManager.validateVehicleTypes = Utils.prependedFunction(VehicleTypeManager.validateVehicleTypes, validateVehicleTypes)
