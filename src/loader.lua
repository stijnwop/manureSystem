---
-- loader
--
-- loader script for the mod
--
-- Copyright (c) Wopster, 2019

local directory = g_currentModDirectory
local modName = g_currentModName

source(Utils.getFilename("src/ManureSystem.lua", directory))
source(Utils.getFilename("src/utils/ManureSystemUtil.lua", directory))
source(Utils.getFilename("src/utils/ManureSystemXMLUtil.lua", directory))
source(Utils.getFilename("src/hose/HosePlayer.lua", directory))

local manureSystem

local function isEnabled()
    return manureSystem ~= nil
end

function init()
    Mission00.load = Utils.prependedFunction(Mission00.load, loadMission)
    VehicleTypeManager.validateVehicleTypes = Utils.prependedFunction(VehicleTypeManager.validateVehicleTypes, validateVehicleTypes)
end

function loadMission(mission)
    assert(g_manureSystem == nil)

    manureSystem = ManureSystem:new(mission, directory, modName, g_i18n)

    getfenv(0)["g_manureSystem"] = manureSystem

    addModEventListener(manureSystem)
end

function validateVehicleTypes(vehicleTypeManager)
    ManureSystem.installSpecializations(g_vehicleTypeManager, g_specializationManager, directory, modName)
end

init()
