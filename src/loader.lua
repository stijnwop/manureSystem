---
-- loader
--
-- loader script for the mod
--
-- Copyright (c) Wopster, 2019

local directory = g_currentModDirectory
local modName = g_currentModName

source(Utils.getFilename("src/placeables/ManureSystemAnimatedObjectExtension.lua", directory))
source(Utils.getFilename("src/misc/ManureSystemFillPlane.lua", directory))

-- DataStructures
source(Utils.getFilename("src/misc/ManureSystemConnectorManager.lua", directory))
source(Utils.getFilename("src/misc/ManureSystemFillArmManager.lua", directory))
source(Utils.getFilename("src/misc/ManureSystemHusbandryModuleLiquidManure.lua", directory))

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
local vehicles = {}

local function isEnabled()
    return manureSystem ~= nil
end

local function loadInsertionVehicles()
    local xmlFile = loadXMLFile("ManureSystemInsertionVehicles", Utils.getFilename("resources/insertionVehicles.xml", directory))

    local i = 0
    while true do
        local key = ("vehicles.vehicle(%d)"):format(i)
        if not hasXMLProperty(xmlFile, key) then
            break
        end

        local entry = {}
        entry.xml = getXMLString(xmlFile, key .. ".xml")
        entry.replaceTypeName = modName .. "." .. getXMLString(xmlFile, key .. ".replaceTypeName")
        entry.copySpecializations = hasXMLProperty(xmlFile, key .. ".copySpecializations")

        entry.specializations = {}
        if entry.copySpecializations then
            local s = 0
            while true do
                local specKey = ("%s.copySpecializations.specialization(%d)"):format(key, s)
                if not hasXMLProperty(xmlFile, specKey) then
                    break
                end

                local name = getXMLString(xmlFile, specKey .. "#name")
                table.insert(entry.specializations, name)

                s = s + 1
            end

        end

        vehicles[entry.xml] = entry

        i = i + 1
    end

    delete(xmlFile)
end

local function loadMission(mission)
    assert(g_manureSystem == nil)

    manureSystem = ManureSystem:new(mission, g_inputBinding, g_i18n, directory, modName)

    getfenv(0)["g_manureSystem"] = manureSystem

    addModEventListener(manureSystem)
end

local function loadedMission(mission, node)
    if not isEnabled() then
        return
    end

    if mission.cancelLoading then
        return
    end

    g_manureSystem:onMissionLoaded(mission)
end

local function loadedItems(mission)
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

local function saveToXMLFile(missionInfo)
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

local function validateVehicleTypes(vehicleTypeManager)
    ManureSystem.installSpecializations(g_vehicleTypeManager, g_specializationManager, directory, modName)
end

local function vehicleLoad(self, superFunc, vehicleData, ...)
    local _, baseDir = Utils.getModNameAndBaseDirectory(vehicleData.filename)
    local xmlFilename = vehicleData.filename:gsub(baseDir, "")

    if vehicles[xmlFilename] ~= nil then
        local data = vehicles[xmlFilename]
        local replacementType = data.replaceTypeName

        if data.copySpecializations then
            local orgEntry = g_vehicleTypeManager:getVehicleTypeByName(vehicleData.typeName)
            if orgEntry ~= nil then
                local stringParts = StringUtil.splitString(".", vehicleData.typeName)
                if #stringParts ~= 1 then
                    local typeModName = unpack(stringParts)

                    for _, name in pairs(data.specializations) do
                        local specName = typeModName .. "." .. name
                        local spec = g_specializationManager:getSpecializationObjectByName(specName)

                        if spec ~= nil then
                            g_vehicleTypeManager:addSpecialization(replacementType, specName)
                        end
                    end
                end
            end

            data.copySpecializations = false
        end

        local typeEntry = g_vehicleTypeManager:getVehicleTypeByName(replacementType)
        if typeEntry ~= nil then
            vehicleData.typeName = replacementType
            self.typeName = replacementType
        end
    end

    return superFunc(self, vehicleData, ...)
end

local function init()
    loadInsertionVehicles()

    g_placeableTypeManager:addPlaceableType("manureSystemStorage", "ManureSystemStorage", directory .. "src/placeables/ManureSystemStorage.lua")

    Mission00.load = Utils.prependedFunction(Mission00.load, loadMission)
    Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, loadedMission)
    Mission00.loadItemsFinished = Utils.appendedFunction(Mission00.loadItemsFinished, loadedItems)

    FSCareerMissionInfo.saveToXMLFile = Utils.appendedFunction(FSCareerMissionInfo.saveToXMLFile, saveToXMLFile)

    VehicleTypeManager.validateVehicleTypes = Utils.prependedFunction(VehicleTypeManager.validateVehicleTypes, validateVehicleTypes)

    Vehicle.load = Utils.overwrittenFunction(Vehicle.load, vehicleLoad)
end

init()

-------------------------------------------------------------------------------
--- Development only
-------------------------------------------------------------------------------

if g_showDevelopmentWarnings and g_addCheatCommands then
    function Utils.getTimeScaleIndex(timeScale)
        if timeScale >= 12000 then return 7
        elseif timeScale >= 120 then return 6
        elseif timeScale >= 60 then return 5
        elseif timeScale >= 30 then return 4
        elseif timeScale >= 15 then return 3
        elseif timeScale >= 5 then return 2
        end
        return 1
    end

    function Utils.getTimeScaleFromIndex(timeScaleIndex)
        if timeScaleIndex >= 7 then return 12000
        elseif timeScaleIndex >= 6 then return 120
        elseif timeScaleIndex >= 5 then return 60
        elseif timeScaleIndex >= 4 then return 30
        elseif timeScaleIndex >= 3 then return 15
        elseif timeScaleIndex >= 2 then return 5
        end
        return 1
    end
end
