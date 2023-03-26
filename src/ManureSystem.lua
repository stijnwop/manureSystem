----------------------------------------------------------------------------------------------------
-- ManureSystem
----------------------------------------------------------------------------------------------------
-- Purpose: Main class the handle the Manure System.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystem
---@field connectorManager ManureSystemConnectorManager
---@field fillArmManager ManureSystemFillArmManager
---@field player HosePlayer
ManureSystem = {}
ManureSystem.VEHICLE_CLASSNAME = "Vehicle"

local ManureSystem_mt = Class(ManureSystem)

---Sorter to manage saving and loading hoses from savegame.
local sortByClassAndId = function(arg1, arg2)
    -- Sort by id when dealing with the same classNames.
    if arg1.className == arg2.className then
        if arg1.className == ManureSystem.VEHICLE_CLASSNAME then
            local id1 = g_currentMission.manureSystem.savedVehiclesToId[arg1] or 0
            local id2 = g_currentMission.manureSystem.savedVehiclesToId[arg2] or 0
            return id1 < id2
        else
            -- When placeable we sort on the current position because the load order is not guarantee by the item system.
            local item1 = g_currentMission.manureSystem.savedItemsToId[arg1]
            local item2 = g_currentMission.manureSystem.savedItemsToId[arg2]
            if item1 and item2 ~= nil then
                local x1, y1, z1 = unpack(item1.pos)
                local x2, y2, z2 = unpack(item2.pos)
                local cord1 = math.abs(x1) + math.abs(y1) + math.abs(z1)
                local cord2 = math.abs(x2) + math.abs(y2) + math.abs(z2)

                local name1 = arg1:getName() or "placeable"
                local name2 = arg2:getName() or "placeable"
                -- Compare same placeables based on the position.
                if name1 == name2 then
                    return cord1 < cord2
                end

                return name1 < name2
            end
        end
    end

    return arg1.className < arg2.className
end

function ManureSystem.new(mission, input, soundManager, modDirectory, modName)
    local self = setmetatable({}, ManureSystem_mt)

    self.version = 2
    self.isServer = mission:getIsServer()
    self.isClient = mission:getIsClient()
    self.modDirectory = modDirectory
    self.modName = modName

    --Debug flags
    self.debug = false
    self.debugShowConnectors = false

    self.mission = mission
    self.soundManager = soundManager
    self.connectorManager = ManureSystemConnectorManager.new(self.modDirectory)
    self.fillArmManager = ManureSystemFillArmManager.new(self.modDirectory)
    self.player = HosePlayer.new(self.isClient, self.isServer, mission, input)
    --self.husbandryModuleLiquidManure = ManureSystemHusbandryModuleLiquidManure:new(self.isClient, self.isServer, mission, input)
    --self.bga = ManureSystemBga:new(self.isClient, self.isServer, mission, input)

    self.manureSystemConnectors = {}
    self.samples = {}

    self:loadManureSystemSamples()

    addConsoleCommand("msToggleDebug", "Toggle debugging", "consoleCommandToggleDebug", self)
    addConsoleCommand("msToggleConnectorNodes", "Toggle connector node", "consoleCommandToggleConnectors", self)

    return self
end

function ManureSystem:delete()
    self.player:delete()
    --self.husbandryModuleLiquidManure:delete()
    --self.bga:delete()

    self.connectorManager:unloadMapData()
    self.fillArmManager:unloadMapData()

    self.soundManager:deleteSamples(self.samples)
    removeConsoleCommand("msToggleDebug")
    removeConsoleCommand("msToggleConnectorNodes")
end

function ManureSystem:onMissionLoaded(mission)
    self.connectorManager:loadMapData()
    self.fillArmManager:loadMapData()
end

---Gets the mission item save list.
function ManureSystem:getSavedItemsList()
    local savedItemsToId = {}

    local id = 1
    for _, placeable in pairs(self.mission.placeableSystem.placeables) do
        savedItemsToId[placeable] = { id = id, pos = { getWorldTranslation(placeable.rootNode) } }
        id = id + 1
    end

    return savedItemsToId
end

---Gets the mission vehicle save list.
function ManureSystem:getSavedVehiclesList()
    local savedVehiclesToId = {}

    local id = 1
    for _, vehicle in pairs(self.mission.vehicles) do
        if vehicle.isVehicleSaved then
            savedVehiclesToId[vehicle] = id
            id = id + 1
        end
    end

    return savedVehiclesToId
end

---Called when mission is loaded.
function ManureSystem:load(xmlFilename)
    local xmlFile = XMLFile.load("ManureSystemXML", xmlFilename)
    if xmlFile ~= nil then
        self:loadFromXML(xmlFile)
        xmlFile:delete()
    end
end
---Called when mission is loaded.
function ManureSystem:loadFromXML(xmlFile)
    local version = xmlFile:getInt("manureSystem#version")
    local validVersion = not (version ~= nil and version < self.version)

    if not validVersion then
        Logging.warning("Skipping loading of saved hose connections due to loading from an older ManureSystem savegame!")
    end

    self.savedVehiclesToId = self:getSavedVehiclesList()
    self.savedItemsToId = self:getSavedItemsList()
    table.sort(self.manureSystemConnectors, sortByClassAndId)

    local i = 0
    while true do
        local key = ("manureSystem.hoses.hose(%d)"):format(i)
        if not xmlFile:hasProperty(key) then
            break
        end

        local hoseId = xmlFile:getInt(key .. "#objectId")
        if self:connectorObjectExists(hoseId) then
            local object = self:getConnectorObject(hoseId)
            if object.isaHose ~= nil and object:isaHose() then
                object:loadFromXML(key, xmlFile, validVersion)
            end
        end

        i = i + 1
    end
end

function ManureSystem:save(xmlFilename)
    local xmlFile = XMLFile.create("ManureSystemXML", xmlFilename, "manureSystem")
    if xmlFile ~= nil then
        self:saveToXML(xmlFile)
        xmlFile:delete()
    end
end

---Called when mission is being saved with our own xml file.
function ManureSystem:saveToXML(xmlFile)
    xmlFile:setInt("manureSystem#version", self.version)

    self.savedVehiclesToId = self:getSavedVehiclesList()
    self.savedItemsToId = self:getSavedItemsList()
    table.sort(self.manureSystemConnectors, sortByClassAndId)

    local hoses = {}
    local objectToId = {}
    for id, object in ipairs(self.manureSystemConnectors) do
        if object.isaHose ~= nil and object:isaHose() then
            objectToId[object] = id
            table.insert(hoses, object)
        end
    end

    -- We only need to store the hoses information.
    for i, object in ipairs(hoses) do
        local id = objectToId[object]
        local key = ("manureSystem.hoses.hose(%d)"):format(i - 1)
        xmlFile:setInt(key .. "#objectId", id)
        object:saveToXML(key, xmlFile)
    end

    xmlFile:save()
end

---Loads the shared sample files for the manure system.
function ManureSystem:loadManureSystemSamples()
    local xmlFile = XMLFile.load("ManureSystemSamples", Utils.getFilename("resources/sounds.xml", self.modDirectory))
    if xmlFile ~= nil then
        local soundsNode = getRootNode()
        self.samples.pump = self.soundManager:loadSampleFromXML(xmlFile.handle, "vehicle.sounds", "pump", self.modDirectory, soundsNode, 1, AudioGroup.VEHICLE, nil, nil)
        xmlFile:delete()
    end
end

---Returns the current loaded samples.
function ManureSystem:getManureSystemSamples()
    return self.samples
end

---Adds connector object to the list and force it being distinct.
function ManureSystem:addConnectorObject(object)
    if not table.hasElement(self.manureSystemConnectors, object) then
        table.addElement(self.manureSystemConnectors, object)
    end
end

---Removes connector object from the list.
function ManureSystem:removeConnectorObject(object)
    table.removeElement(self.manureSystemConnectors, object)
end

---Returns the connector objects list.
function ManureSystem:getConnectorObjects()
    return self.manureSystemConnectors
end

---Returns the connector with the given id.
function ManureSystem:getConnectorObject(id)
    return self.manureSystemConnectors[id]
end

---Return the id for the given object.
function ManureSystem:getConnectorObjectId(object)
    return table.findListElementFirstIndex(self.manureSystemConnectors, object)
end

---Return true when the object exists, false otherwise.
function ManureSystem:connectorObjectExists(id)
    return self.manureSystemConnectors[id] ~= nil
end

function ManureSystem.hasManureSystemRegistry(typeName, specializationManager)
    local stringParts = string.split(typeName, ".")
    if #stringParts ~= 1 then
        local typeModName = unpack(stringParts)
        return specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemRegistry") ~= nil
    end

    return false
end

function ManureSystem.installByManureSystemVehicleSpec(typeName, typeEntry, vehicleTypeManager, specializationManager, modName)
    local stringParts = string.split(typeName, ".")
    local hasVehicleSpec = false
    if #stringParts ~= 1 then
        local typeModName, vehicleType = unpack(stringParts)
        local spec = specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemRegistry")
        hasVehicleSpec = spec ~= nil and spec.hasFeatureEnabled ~= nil

        if hasVehicleSpec then
            if spec.hasFeatureEnabled(vehicleType, "hasPumpMotor") then
                if not SpecializationUtil.hasSpecialization(ManureSystemPumpMotor, typeEntry.specializations) then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
                    Logging.info("Adding ManureSystemPumpMotor to: '" .. typeName)
                end
            end

            if spec.hasFeatureEnabled(vehicleType, "hasConnectors") then
                if not SpecializationUtil.hasSpecialization(ManureSystemConnector, typeEntry.specializations) then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
                    Logging.info("Adding ManureSystemConnector to: '" .. typeName)
                end
            end

            if spec.hasFeatureEnabled(vehicleType, "hasFillArm") then
                if not SpecializationUtil.hasSpecialization(ManureSystemFillArm, typeEntry.specializations) then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
                    Logging.info("Adding ManureSystemFillArm to: '" .. typeName)
                end
            end

            if spec.hasFeatureEnabled(vehicleType, "hasFillArmReceiver") then
                if not SpecializationUtil.hasSpecialization(ManureSystemFillArmReceiver, typeEntry.specializations) then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArmReceiver")
                    Logging.info("Adding ManureSystemFillArmReceiver to: '" .. typeName)
                end
            end
        end
    end
end

function ManureSystem.installSpecializations(vehicleTypeManager, specializationManager, modDirectory, modName)
    for typeName, typeEntry in pairs(vehicleTypeManager:getTypes()) do
        ManureSystem.installByManureSystemVehicleSpec(typeName, typeEntry, vehicleTypeManager, specializationManager, modName)

        if typeName == "manureTrailer"
            or SpecializationUtil.hasSpecialization(ManureBarrel, typeEntry.specializations)
            or ManureSystem.hasManureSystemRegistry(typeName, specializationManager) then
            if not SpecializationUtil.hasSpecialization(ManureSystemPumpMotor, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
                Logging.info("Adding ManureSystemPumpMotor to: '" .. typeName)
            end

            if not SpecializationUtil.hasSpecialization(ManureSystemConnector, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
                Logging.info("Adding ManureSystemConnector to: '" .. typeName)
            end

            if not SpecializationUtil.hasSpecialization(ManureSystemFillArm, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
                Logging.info("Adding ManureSystemFillArm to: '" .. typeName)
            end

            if not SpecializationUtil.hasSpecialization(ManureSystemFillArmReceiver, typeEntry.specializations)
                and SpecializationUtil.hasSpecialization(FillVolume, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArmReceiver")
                Logging.info("Adding ManureSystemFillArmReceiver to: '" .. typeName)
            end
        end
    end
end

function ManureSystem.installPlaceableSpecializations(typeManager, specializationManager, modDirectory, modName)
    for typeName, typeEntry in pairs(typeManager:getTypes()) do
        if SpecializationUtil.hasSpecialization(PlaceableSilo, typeEntry.specializations) then
            typeManager:addSpecialization(typeName, modName .. ".manureSystemPlaceableSilo")
            Logging.info("Adding ManureSystemPlaceableSilo to: '" .. typeName)
        end
    end
end

---Add our global translations to the global table.
function ManureSystem.addModTranslations(i18n)
    local global = getfenv(0).g_i18n.texts
    for key, text in pairs(i18n.texts) do
        if string.startsWith(key, "global_") then
            global[key:sub(8)] = text
        end
    end
end

---Remove are global entries to avoid duplications.
function ManureSystem.removeModTranslations(i18n)
    local global = getfenv(0).g_i18n.texts
    for key, _ in pairs(i18n.texts) do
        if string.startsWith(key, "global_") then
            global[key:sub(8)] = nil
        end
    end
end

----------------------
-- Commands
----------------------

---Raise all manure system connector objects active.
function ManureSystem:wakeupManureSystemConnectors()
    for _, object in ipairs(self.manureSystemConnectors) do
        object:raiseActive()
    end
end

---Console command for showing general debug information.
function ManureSystem:consoleCommandToggleDebug()
    self.debug = not self.debug

    if self.debug then
        self:wakeupManureSystemConnectors()
    end

    return tostring(self.debug)
end

---Console command for highlighting the connector nodes.
function ManureSystem:consoleCommandToggleConnectors()
    self.debugShowConnectors = not self.debugShowConnectors

    if self.debugShowConnectors then
        self:wakeupManureSystemConnectors()
    end

    return tostring(self.debugShowConnectors)
end
