--
-- main
--
-- Author: Stijn Wopereis
-- Description: loads the mod.
-- Name: main
-- Hide: yes
--
-- Copyright (c) Wopster, 2021

---@type string directory of the mod.
local modDirectory = g_currentModDirectory or ""
---@type string name of the mod.
local modName = g_currentModName or "unknown"
---@type ManureSystem the current loaded mod env.
local modEnvironment

---Loading order should be based on dependency order
---@type table<string> files to source.
local sourceFiles = {
    "src/insertion.lua",
    --Network
    "src/vehicles/events/ManureSystemConnectorIsConnectedEvent.lua",
    "src/vehicles/events/ManureSystemConnectorManureFlowEvent.lua",
    "src/vehicles/events/ManureSystemPumpModeEvent.lua",
    "src/vehicles/events/ManureSystemPumpDirectionEvent.lua",
    "src/vehicles/events/ManureSystemPumpIsRunningEvent.lua",
    "src/vehicles/events/ManureSystemPumpIsAllowedEvent.lua",
    --Misc
    "src/misc/ManureSystemConnectorManager.lua",
    "src/misc/ManureSystemFillArmManager.lua",
    "src/misc/strategies/connectors/ManureSystemCouplingStrategy.lua",
    "src/misc/strategies/connectors/ManureSystemDockStrategy.lua",
    --Hose
    "src/hose/events/HoseAttachDetachEvent.lua",
    "src/hose/events/HoseGrabDropEvent.lua",
    "src/hose/HosePlayer.lua",
    --Utils
    "src/utils/ManureSystemUtil.lua",
    "src/utils/ManureSystemXMLUtil.lua",
    --Main
    "src/ManureSystem.lua",
}

for _, file in ipairs(sourceFiles) do
    source(modDirectory .. file)
end

---Returns true when the current mod env is loaded, false otherwise.
local function isLoaded()
    return modEnvironment ~= nil
end

---Load the mod.
local function load(mission)
    assert(modEnvironment == nil)
    modEnvironment = ManureSystem.new(mission, g_inputBinding, g_soundManager, modDirectory, modName)
    mission.manureSystem = modEnvironment
    addModEventListener(modEnvironment)
end

---Unload the mod when the mod is unselected and savegame is (re)loaded or game is closed.
local function unload()
    if not isLoaded() then
        return
    end

    if modEnvironment ~= nil then
        removeModEventListener(modEnvironment)
        modEnvironment:delete()
        modEnvironment = nil -- GC

        if g_currentMission ~= nil then
            g_currentMission.manureSystem = nil
        end
    end
end

local function loadedMission(mission, node)
    if not isLoaded() then
        return
    end

    if mission.cancelLoading then
        return
    end

    mission.manureSystem:onMissionLoaded(mission)
end

local function loadFromXMLFile(mission)
    if isLoaded() and mission:getIsServer() then
        local missionInfo = mission.missionInfo
        local xmlFilename = missionInfo.savegameDirectory .. "/manureSystem.xml"
        if missionInfo.savegameDirectory ~= nil and fileExists(xmlFilename) then
            modEnvironment:load(xmlFilename)
        end
    end
end

local function saveToXMLFile(missionInfo)
    if isLoaded() and missionInfo.isValid then
        modEnvironment:save(missionInfo.savegameDirectory .. "/manureSystem.xml")
    end
end

local function validateVehicleTypes(typeManager)
    if typeManager.typeName == "vehicle" then
        --ManureSystem.addModTranslations(g_i18n)
        ManureSystem.installSpecializations(typeManager, g_specializationManager, modDirectory, modName)
    end
end

--- Init the mod.
local function init()
    FSBaseMission.delete = Utils.appendedFunction(FSBaseMission.delete, unload)
    Mission00.load = Utils.prependedFunction(Mission00.load, load)
    Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, loadedMission)
    Mission00.loadItemsFinished = Utils.appendedFunction(Mission00.loadItemsFinished, loadFromXMLFile)
    FSCareerMissionInfo.saveToXMLFile = Utils.appendedFunction(FSCareerMissionInfo.saveToXMLFile, saveToXMLFile)

    TypeManager.validateTypes = Utils.prependedFunction(TypeManager.validateTypes, validateVehicleTypes)
end

init()

---Make modName globally available
g_manureSystemModName = modName -- Todo: look for better solution..
