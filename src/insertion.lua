--
-- insertion
--
-- Author: Stijn Wopereis
-- Description: handles the insertions
-- Name: insertion
-- Hide: yes
--
-- Copyright (c) Wopster, 2022

---@type string directory of the mod.
local modDirectory = g_currentModDirectory or ""
---@type string name of the mod.
local modName = g_currentModName or "unknown"

local insertionFunction = "onPreLoad"
local insertionDirectories = {
    ["vehicle"] = "resources/insertionVehicles/",
    ["placeable"] = "resources/insertionPlaceables/",
}

local insertions = {}

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

local function replaceSanitized(input, what, with)
    what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") -- escape pattern
    with = string.gsub(with, "[%%]", "%%%%") -- escape replacement
    return input:gsub(what, with)
end

local function generateSpecObject(data)
    local spec = {
        __d = data
    }

    spec.prerequisitesPresent = function()
        return true
    end

    spec.onPreLoad = function(self)
        if g_currentMission.manureSystem.debug then
            log("MS - loading XML mapping for", data.xml)
        end

        for baseKey, mapping in pairs(data.mapping) do
            for _, map in ipairs(mapping) do
                if g_currentMission.manureSystem.debug then
                    log(("MS map - <%s> [%s] %s"):format(baseKey .. map.xmlKey, map.xmlType, map.xmlValue))
                end

                self.xmlFile[typeToXMLSetFunction[map.xmlType]](self.xmlFile, baseKey .. map.xmlKey, map.xmlValue)
            end
        end
    end

    return spec
end

local function injectRegistry(xmlFilename, orgEntry, data)
    local generatedSpec
    local doInject = orgEntry ~= nil
    local stringParts = string.split(data.typeName, ".")

    if #stringParts ~= 1 then
        local typeModName = unpack(stringParts)
        doInject = doInject and not (g_specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemRegistry") ~= nil)
    end

    if doInject then
        generatedSpec = generateSpecObject(insertions[xmlFilename])
        table.addElement(orgEntry.eventListeners[insertionFunction], generatedSpec)
    end

    return doInject, generatedSpec
end

local function vehicleLoad(self, superFunc, data, ...)
    local _, baseDir = Utils.getModNameAndBaseDirectory(data.filename)
    local xmlFilename = replaceSanitized(data.filename, baseDir, "")

    if insertions[xmlFilename] == nil then
        return superFunc(self, data, ...)
    end

    local orgEntry = g_vehicleTypeManager:getTypeByName(data.typeName)
    local isInjected, registrySpec = injectRegistry(xmlFilename, orgEntry, data)

    local loadingState = superFunc(self, data, ...)
    if isInjected then
        table.removeElement(orgEntry.eventListeners[insertionFunction], registrySpec)
    end

    return loadingState
end

local function placeableLoad(self, superFunc, data, ...)
    local _, baseDir = Utils.getModNameAndBaseDirectory(data.filename)
    local xmlFilename = replaceSanitized(data.filename, baseDir, "")

    if insertions[xmlFilename] == nil then
        return superFunc(self, data, ...)
    end

    local orgEntry = g_placeableTypeManager:getTypeByName(data.typeName)
    local isInjected, registrySpec = injectRegistry(xmlFilename, orgEntry, data)

    local loadingState = superFunc(self, data, ...)
    if isInjected then
        table.removeElement(orgEntry.eventListeners[insertionFunction], registrySpec)
    end

    return loadingState
end

local function loadInsertion(directory, xmlRoot)
    local baseDirectory = Utils.getFilename(directory, modDirectory)
    local files = Files.new(baseDirectory).files

    ---Replace the 'data.' prefix and remove the iteration marker for the xml root
    local function convertToMappingKey(baseKey)
        local key = baseKey:gsub("data.", "", 1)
        return key:gsub("%(%d*%)", "", 1)
    end

    local function loadMapping(xmlFile, baseKey, mapping)
        local mappingKey = convertToMappingKey(baseKey)
        mapping[mappingKey] = {}

        xmlFile:iterate(baseKey .. ".entry", function(_, key)
            local map = {}
            map.xmlType = xmlFile:getString(key .. "#type", "string")
            map.xmlKey = xmlFile:getString(key .. "#key")
            map.xmlValue = xmlFile[typeToXMLGetFunction[map.xmlType]](xmlFile, key .. "#value")

            table.insert(mapping[mappingKey], map)
        end)
    end

    for _, file in ipairs(files) do
        if not file.isDirectory then
            local xmlFile = XMLFile.load(xmlRoot, baseDirectory .. file.filename)

            xmlFile:iterate("data." .. xmlRoot, function(_, xmlRootKey)
                local entry = {}
                entry.name = Utils.getFilenameInfo(file.filename)
                entry.xml = xmlFile:getString(xmlRootKey .. "#xml")

                entry.mapping = {}
                loadMapping(xmlFile, xmlRootKey .. ".manureSystemFillArm", entry.mapping)
                loadMapping(xmlFile, xmlRootKey .. ".manureSystemFillArmReceiver", entry.mapping)
                loadMapping(xmlFile, xmlRootKey .. ".manureSystemPumpMotor", entry.mapping)

                xmlFile:iterate(xmlRootKey .. ".manureSystemConnectors.connector", function(_, key)
                    loadMapping(xmlFile, key, entry.mapping)
                end)

                insertions[entry.xml] = entry
            end)

            xmlFile:delete()
        end
    end
end

local function init()
    for xmlRoot, directory in pairs(insertionDirectories) do
        loadInsertion(directory, xmlRoot)
    end

    Vehicle.load = Utils.overwrittenFunction(Vehicle.load, vehicleLoad)
    Placeable.load = Utils.overwrittenFunction(Placeable.load, placeableLoad)
end

init()
