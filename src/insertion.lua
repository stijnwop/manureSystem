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

local insertionFunctions = {
    "onPreLoad",
    "onLoadFinished"
}

local insertionRootFile = "resources/insertions.xml"

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

---@type table<string, boolean>
local mappablePaths = {
    ["attributes"] = { isIterable = false, childPath = "", isRelative = false },
    ["manureSystem"] = { isIterable = false, childPath = "", isRelative = true },
    ["manureSystemConnectors"] = { isIterable = true, childPath = "connector", isRelative = true },
    ["manureSystemFillArm"] = { isIterable = false, childPath = "", isRelative = true },
    ["manureSystemFillArmReceiver"] = { isIterable = false, childPath = "", isRelative = true },
    ["manureSystemPumpMotor"] = { isIterable = false, childPath = "", isRelative = true },
    ["manureSystemPumpMixer"] = { isIterable = false, childPath = "", isRelative = true },
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
            log("MS - loading XML mapping for", data.xml, self.typeName)
        end

        for baseKey, mapping in pairs(data.mapping) do
            for _, map in ipairs(mapping) do
                local key = map.isRelative and baseKey .. map.xmlKey or map.xmlKey

                if g_currentMission.manureSystem.debug then
                    log(("MS map - <%s> [%s] %s"):format(key, map.xmlType, map.xmlValue))
                end

                self.xmlFile[typeToXMLSetFunction[map.xmlType]](self.xmlFile, key, map.xmlValue)
            end
        end

        if data.reloadStoreItem then
            local storeItem = g_storeManager:getItemByXMLFilename(self.configFileName)

            if storeItem.species == "vehicle" then
                local rootName = self.xmlFile:getRootName()

                storeItem.configurations, storeItem.defaultConfigurationIds = StoreItemUtil.getConfigurationsFromXML(self.xmlFile, rootName, storeItem.baseDir, storeItem.customEnvironment, storeItem.isMod, storeItem)
                storeItem.subConfigurations = StoreItemUtil.getSubConfigurationsFromXML(storeItem.configurations)
                storeItem.configurationSets = StoreItemUtil.getConfigurationSetsFromXML(storeItem, self.xmlFile, rootName, storeItem.baseDir, storeItem.customEnvironment, storeItem.isMod)
                storeItem.canBeSold = true
            end
        end
    end

    spec.onLoadFinished = function()
        if data.reloadStoreItem then
            g_messageCenter:publish(MessageType.STORE_ITEMS_RELOADED)
            data.reloadStoreItem = false
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

        for _, insertionFunction in ipairs(insertionFunctions) do
            table.addElement(orgEntry.eventListeners[insertionFunction], generatedSpec)
        end
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
        for _, insertionFunction in ipairs(insertionFunctions) do
            table.removeElement(orgEntry.eventListeners[insertionFunction], registrySpec)
        end
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
        for _, insertionFunction in ipairs(insertionFunctions) do
            table.removeElement(orgEntry.eventListeners[insertionFunction], registrySpec)
        end
    end

    return loadingState
end

local function loadInsertion(filePath, type)
    local filename = Utils.getFilename(filePath, modDirectory)

    ---Replace the 'data.' prefix and remove the iteration marker for the xml root
    local function convertToMappingKey(baseKey)
        local key = baseKey:gsub("data.", "", 1)
        return key:gsub("%(%d*%)", "", 1)
    end

    local function loadMapping(xmlFile, baseKey, mapping, isRelative)
        local mappingKey = convertToMappingKey(baseKey)
        mapping[mappingKey] = {}

        xmlFile:iterate(baseKey .. ".entry", function(_, key)
            local map = {}
            map.isRelative = isRelative
            map.xmlType = xmlFile:getString(key .. "#type", "string")
            map.xmlKey = xmlFile:getString(key .. "#key")
            map.xmlValue = xmlFile[typeToXMLGetFunction[map.xmlType]](xmlFile, key .. "#value")

            table.insert(mapping[mappingKey], map)
        end)
    end

    local xmlFile = XMLFile.load(type, filename)

    xmlFile:iterate("data." .. type, function(_, xmlRootKey)
        local entry = {}
        entry.name = Utils.getFilenameInfo(filename)
        entry.xml = xmlFile:getString(xmlRootKey .. "#xml")
        entry.reloadStoreItem = xmlFile:getBool(xmlRootKey .. "#reloadStoreItem") or false

        entry.mapping = {}

        for path, info in pairs(mappablePaths) do
            if info.isIterable then
                xmlFile:iterate(xmlRootKey .. "." .. path .. "." .. info.childPath, function(_, key)
                    loadMapping(xmlFile, key, entry.mapping, info.isRelative)
                end)
            else
                loadMapping(xmlFile, xmlRootKey .. "." .. path, entry.mapping, info.isRelative)
            end
        end

        insertions[entry.xml] = entry
    end)

    xmlFile:delete()
end

local function loadInsertions()
    local xmlFile = XMLFile.load("insertions", modDirectory .. insertionRootFile)
    xmlFile:iterate("files.file", function(_, key)
        local type = xmlFile:getString(key .. "#type") or "vehicle"
        local path = xmlFile:getString(key .. "#path")
        loadInsertion(path, type)
    end)
    xmlFile:delete()
end

local function consoleCommandReloadVehicle(mission, superFunc, resetVehicle, radius)
    loadInsertions()
    return superFunc(mission, resetVehicle, radius)
end

local function init()
    loadInsertions()
    Vehicle.load = Utils.overwrittenFunction(Vehicle.load, vehicleLoad)
    Placeable.load = Utils.overwrittenFunction(Placeable.load, placeableLoad)
    FSBaseMission.consoleCommandReloadVehicle = Utils.overwrittenFunction(FSBaseMission.consoleCommandReloadVehicle, consoleCommandReloadVehicle)
end

init()
