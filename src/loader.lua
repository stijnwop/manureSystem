---
-- loader
--
-- loader script for the mod
--
-- Copyright (c) Wopster, 2019

local directory = g_currentModDirectory
local modName = g_currentModName

-- DataStructures
source(Utils.getFilename("src/misc/ManureSystemConnectorManager.lua", directory))
source(Utils.getFilename("src/misc/ManureSystemFillArmManager.lua", directory))

source(Utils.getFilename("src/misc/strategies/connectors/ManureSystemCouplingStrategy.lua", directory))
source(Utils.getFilename("src/misc/strategies/connectors/ManureSystemDockStrategy.lua", directory))

source(Utils.getFilename("src/utils/Logger.lua", directory))
source(Utils.getFilename("src/ManureSystem.lua", directory))

source(Utils.getFilename("src/events/ManureSystemPumpDirectionEvent.lua", directory))
source(Utils.getFilename("src/events/ManureSystemPumpIsRunningEvent.lua", directory))
source(Utils.getFilename("src/events/HoseAttachDetachEvent.lua", directory))
source(Utils.getFilename("src/events/HoseGrabDropEvent.lua", directory))

source(Utils.getFilename("src/utils/ManureSystemUtil.lua", directory))
source(Utils.getFilename("src/utils/ManureSystemXMLUtil.lua", directory))

source(Utils.getFilename("src/hose/HosePlayer.lua", directory))

local manureSystem

local function isEnabled()
    return manureSystem ~= nil
end

function init()
    g_placeableTypeManager:addPlaceableType("manureSystemLagoon", "ManureSystemLagoon", directory .. "src/placeables/ManureSystemLagoon.lua")

    Mission00.load = Utils.prependedFunction(Mission00.load, loadMission)
    Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, loadedMission)

    VehicleTypeManager.validateVehicleTypes = Utils.prependedFunction(VehicleTypeManager.validateVehicleTypes, validateVehicleTypes)

    --BaseMission.loadVehicle = Utils.overwrittenFunction(BaseMission.loadVehicle, loadVehicle)
    Vehicle.load = Utils.overwrittenFunction(Vehicle.load, vehicleLoad)
end

function loadMission(mission)
    assert(g_manureSystem == nil)

    manureSystem = ManureSystem:new(mission, g_inputBinding, g_i18n, directory, modName)

    getfenv(0)["g_manureSystem"] = manureSystem

    addModEventListener(manureSystem)
end

function loadedMission(mission, node)
    if not isEnabled() then
        return
    end

    if mission.cancelLoading then
        return
    end

    g_manureSystem:onMissionLoaded(mission)
end

function validateVehicleTypes(vehicleTypeManager)
    ManureSystem.installSpecializations(g_vehicleTypeManager, g_specializationManager, directory, modName)
end

local vehicles = {
    ["data/vehicles/samsonAgro/pgII20/pgII20.xml"] = { typeName = "vanillaPGII20" },
    ["data/vehicles/samsonAgro/pgII25m/pgII25m.xml"] = { typeName = "vanillaPGII25" },
    ["data/vehicles/samsonAgro/pgII35m/pgII35m.xml"] = { typeName = "vanillaPGII35" },
    ["data/vehicles/kotte/frc/frc.xml"] = { typeName = "vanillaFRC" }
}

function vehicleLoad(self, superFunc, vehicleData, ...)
    if vehicles[vehicleData.filename] ~= nil then
        local data = vehicles[vehicleData.filename]
        local replacementType = modName .. "." .. data.typeName
        local typeEntry = g_vehicleTypeManager:getVehicleTypeByName(replacementType)
        if typeEntry ~= nil then
            vehicleData.typeName = replacementType
            self.typeName = replacementType
        end
    end

    return superFunc(self, vehicleData, ...)
end

init()
