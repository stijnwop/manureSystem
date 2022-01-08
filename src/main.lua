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
---@type Manure the current loaded mod env.
local modEnvironment

---Loading order should be based on dependency order
---@type table<string> files to source.
local sourceFiles = {
    --Network
    "src/network/ManureSystemEventBits.lua",
    --Misc
    "src/misc/ManureSystemConnectorManager.lua",
    --Hose
    "src/events/HoseAttachDetachEvent.lua",
    "src/events/HoseGrabDropEvent.lua",
    "src/hose/HosePlayer.lua",
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
    modEnvironment = ManureSystem.new(mission, g_inputBinding, g_soundManager, modName, modDirectory)
    mission.manureSystem = modEnvironment
    addModEventListener(modEnvironment)
end

---Unload the mod when the mod is unselected and savegame is (re)loaded or game is closed.
local function unload()
    if not isLoaded() then
        return
    end

    if modEnvironment ~= nil then
        modEnvironment:delete()
        modEnvironment = nil -- GC

        if g_currentMission ~= nil then
            g_currentMission.manureSystem = nil
        end
    end
end

--- Init the mod.
local function init()
    FSBaseMission.delete = Utils.appendedFunction(FSBaseMission.delete, unload)
    Mission00.load = Utils.prependedFunction(Mission00.load, load)
end

init()

---Make modName globally available
g_manureSystemModName = modName -- Todo: look for better solution..
