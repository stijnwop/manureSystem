--
-- insertion
--
-- Author: Stijn Wopereis
-- Description: handles the vehicle insertions
-- Name: insertion
-- Hide: yes
--
-- Copyright (c) Wopster, 2022

---@type string directory of the mod.
local modDirectory = g_currentModDirectory or ""
---@type string name of the mod.
local modName = g_currentModName or "unknown"

local insertionVehiclesDirectory = "resources/insertionVehicles/"

local vehicles = {}
local typeToXMLSetFunction = {
    ["bool"] = 'setBool',
    ["int"] = 'setInt',
    ["float"] = 'setFloat',
    ["string"] = 'setString',
}

local typeToXMLGetFunction = {
    ["bool"] = 'getBool',
    ["int"] = 'getInt',
    ["float"] = 'getFloat',
    ["string"] = 'getString',
}

local function generateSpecObject(data)
    local spec = {
        __d = data
    }

    spec.prerequisitesPresent = function()
        return true
    end

    spec.onPreLoad = function(self)
        for baseKey, mapping in pairs(data.mapping) do
            for _, map in ipairs(mapping) do
                if g_currentMission.manureSystem.debug then
                    log("MS - map:", baseKey .. map.xmlKey, map.xmlValue, map.xmlType)
                end
                self.xmlFile[typeToXMLSetFunction[map.xmlType]](self.xmlFile, baseKey .. map.xmlKey, map.xmlValue)
            end
        end
    end

    return spec
end

local function loadInsertionVehicles()
    local baseDirectory = Utils.getFilename(insertionVehiclesDirectory, modDirectory)
    local files = Files.new(baseDirectory).files

    local function loadMapping(xmlFile, baseKey, mapping)
        mapping[baseKey] = {}

        xmlFile:iterate(baseKey .. ".entry", function(_, key)
            local map = {}
            map.xmlType = xmlFile:getString(key .. "#type", "string")
            map.xmlKey = xmlFile:getString(key .. "#key")
            map.xmlValue = xmlFile[typeToXMLGetFunction[map.xmlType]](xmlFile, key .. "#value")
            table.insert(mapping[baseKey], map)
        end)
    end

    for _, file in ipairs(files) do
        if not file.isDirectory then
            local name = Utils.getFilenameInfo(file.filename)
            local entry = {}

            local xmlFile = XMLFile.load("vehicle", baseDirectory .. file.filename)

            entry.name = name
            entry.xml = xmlFile:getString("vehicle#xml")

            entry.mapping = {}
            loadMapping(xmlFile, "vehicle.manureSystemFillArm", entry.mapping)
            loadMapping(xmlFile, "vehicle.manureSystemFillArmReceiver", entry.mapping)
            loadMapping(xmlFile, "vehicle.manureSystemPumpMotor", entry.mapping)

            xmlFile:iterate("vehicle.manureSystemConnectors.connector", function(_, key)
                loadMapping(xmlFile, key, entry.mapping)
            end)

            vehicles[entry.xml] = entry

            xmlFile:delete()
        end
    end
end

local function vehicleLoad(self, superFunc, vehicleData, ...)
    local _, baseDir = Utils.getModNameAndBaseDirectory(vehicleData.filename)
    local xmlFilename = ManureSystemUtil.replaceSanitized(vehicleData.filename, baseDir, "")

    if vehicles[xmlFilename] == nil then
        return superFunc(self, vehicleData, ...)
    end

    local generatedSpec = nil
    local orgEntry = g_vehicleTypeManager:getTypeByName(vehicleData.typeName)
    local doReplace = orgEntry ~= nil
    local stringParts = string.split(vehicleData.typeName, ".")

    if #stringParts ~= 1 then
        local typeModName = unpack(stringParts)
        doReplace = doReplace and not (g_specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemRegistry") ~= nil)
    end

    if doReplace then
        generatedSpec = generateSpecObject(vehicles[xmlFilename])
        table.addElement(orgEntry.eventListeners["onPreLoad"], generatedSpec)
    end

    local loadingState = superFunc(self, vehicleData, ...)

    if doReplace then
        table.removeElement(orgEntry.eventListeners["onPreLoad"], generatedSpec)
    end

    return loadingState
end

local function init()
    loadInsertionVehicles()
    Vehicle.load = Utils.overwrittenFunction(Vehicle.load, vehicleLoad)
end

init()
