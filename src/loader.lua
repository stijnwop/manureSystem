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
source(Utils.getFilename("src/events/ManureSystemConnectorIsConnectedEvent.lua", directory))
source(Utils.getFilename("src/events/ManureSystemConnectorManureFlowEvent.lua", directory))

source(Utils.getFilename("src/utils/ManureSystemUtil.lua", directory))
source(Utils.getFilename("src/utils/ManureSystemXMLUtil.lua", directory))

source(Utils.getFilename("src/hose/HosePlayer.lua", directory))

local manureSystem

local function isEnabled()
    return manureSystem ~= nil
end

function init()
    g_placeableTypeManager:addPlaceableType("manureSystemStorage", "ManureSystemStorage", directory .. "src/placeables/ManureSystemStorage.lua")

    Mission00.load = Utils.prependedFunction(Mission00.load, loadMission)
    Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, loadedMission)
    Mission00.loadItemsFinished = Utils.appendedFunction(Mission00.loadItemsFinished, loadedItems)

    FSCareerMissionInfo.saveToXMLFile = Utils.appendedFunction(FSCareerMissionInfo.saveToXMLFile, saveToXMLFile)

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

function loadedItems(mission)
    if not isEnabled() then
        return
    end

    if mission:getIsServer() then
        if mission.missionInfo.savegameDirectory ~= nil and fileExists(mission.missionInfo.savegameDirectory .. "/manureSystem.xml") then
            local xmlFile = loadXMLFile("ManureSystemXML", mission.missionInfo.savegameDirectory .. "/manureSystem.xml")
            if xmlFile ~= nil then
                manureSystem:onMissionLoadFromSavegame(xmlFile)
                delete(xmlFile)
            end
        end
    end
end

function saveToXMLFile(missionInfo)
    if not isEnabled() then
        return
    end

    if missionInfo.isValid then
        local xmlFile = createXMLFile("ManureSystemXML", missionInfo.savegameDirectory .. "/manureSystem.xml", "manureSystem")
        if xmlFile ~= nil then
            manureSystem:onMissionSaveToSavegame(xmlFile)

            saveXMLFile(xmlFile)
            delete(xmlFile)
        end
    end
end

function validateVehicleTypes(vehicleTypeManager)
    ManureSystem.installSpecializations(g_vehicleTypeManager, g_specializationManager, directory, modName)
end

local vehicles = {
    ["data/vehicles/samsonAgro/pgII20/pgII20.xml"] = { typeName = "vanillaPGII20" },
    ["data/vehicles/samsonAgro/pgII25m/pgII25m.xml"] = { typeName = "vanillaPGII25" },
    ["data/vehicles/samsonAgro/pgII35m/pgII35m.xml"] = { typeName = "vanillaPGII35" },
    ["data/vehicles/kotte/frc/frc.xml"] = { typeName = "vanillaFRC" },
    ["data/vehicles/kotte/tsa/tsa.xml"] = { typeName = "vanillaTSA" },
    ["data/vehicles/kotte/ve8000/ve8000.xml"] = { typeName = "vanillaVE8000" },
    ["data/vehicles/joskin/modulo/modulo.xml"] = { typeName = "vanillaModulo" },
    ["zunhammer/TV585/TV585.xml"] = { typeName = "dlcTV585" },
}

function vehicleLoad(self, superFunc, vehicleData, ...)
    local _, baseDir = Utils.getModNameAndBaseDirectory(vehicleData.filename)
    local xmlFilename = vehicleData.filename:gsub(baseDir, "")

    if vehicles[xmlFilename] ~= nil then
        local data = vehicles[xmlFilename]
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
