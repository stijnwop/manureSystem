----------------------------------------------------------------------------------------------------
-- ManureSystem
----------------------------------------------------------------------------------------------------
-- Purpose: Main class the handle the Manure System.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystem
ManureSystem = {}
ManureSystem.VEHICLE_CLASSNAME = "Vehicle"

local ManureSystem_mt = Class(ManureSystem)

---Sorter to manage saving and loading hoses from savegame.
local sortByClassAndId = function(arg1, arg2)
    -- Sort by id when dealing with the same classNames.
    if arg1.className == arg2.className then
        if arg1.className == ManureSystem.VEHICLE_CLASSNAME then
            local id1 = g_manureSystem.savedVehiclesToId[arg1] or 0
            local id2 = g_manureSystem.savedVehiclesToId[arg2] or 0
            return id1 < id2
        else
            -- When placeable we sort on the current position because the load order is not guarantee by the item system.
            local item1 = g_manureSystem.savedItemsToId[arg1]
            local item2 = g_manureSystem.savedItemsToId[arg2]
            if item1 and item2 ~= nil then
                local x1, y1, z1 = unpack(item1.pos)
                local x2, y2, z2 = unpack(item2.pos)
                local cord1 = math.abs(x1) + math.abs(y1) + math.abs(z1)
                local cord2 = math.abs(x2) + math.abs(y2) + math.abs(z2)

                return item1.id < item2.id and cord1 < cord2
            end
        end
    end

    return arg1.className < arg2.className
end

function ManureSystem:new(mission, input, soundManager, modDirectory, modName)
    local self = setmetatable({}, ManureSystem_mt)

    self.isServer = mission:getIsServer()
    self.isClient = mission:getIsClient()
    self.modDirectory = modDirectory
    self.modName = modName
    self.debug = false

    self.mission = mission
    self.soundManager = soundManager
    self.connectorManager = ManureSystemConnectorManager:new(self.modDirectory)
    self.fillArmManager = ManureSystemFillArmManager:new(self.modDirectory)
    self.player = HosePlayer:new(self.isClient, self.isServer, mission, input)
    self.husbandryModuleLiquidManure = ManureSystemHusbandryModuleLiquidManure:new(self.isClient, self.isServer, mission, input)
    self.bga = ManureSystemBga:new(self.isClient, self.isServer, mission, input)

    self.manureSystemConnectors = {}
    self.samples = {}

    self:loadManureSystemSamples()

    addConsoleCommand("msToggleDebug", "Toggle debugging", "consoleCommandToggleDebug", self)

    g_fillTypeManager:addFillTypeToCategory(FillType.WATER, g_fillTypeManager.nameToCategoryIndex["SLURRYTANK"])

    return self
end

function ManureSystem:delete()
    self.player:delete()
    self.husbandryModuleLiquidManure:delete()
    self.bga:delete()

    self.connectorManager:unloadMapData()
    self.fillArmManager:unloadMapData()

    self.soundManager:deleteSamples(self.samples)
    removeConsoleCommand("msToggleDebug")
end

function ManureSystem:onMissionLoaded(mission)
    self.connectorManager:loadMapData()
    self.fillArmManager:loadMapData()
end

---Gets the mission item save list.
function ManureSystem:getSavedItemsList()
    local savedItemsToId = {}

    local id = 1
    for item, _ in pairs(self.mission.itemsToSave) do
        --Only get placeables.
        if item:isa(Placeable) then
            savedItemsToId[item] = { id = id, pos = { getTranslation(item.nodeId) } }
        end
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
function ManureSystem:onMissionLoadFromSavegame(xmlFile)
    self.savedVehiclesToId = self:getSavedVehiclesList()
    self.savedItemsToId = self:getSavedItemsList()
    table.sort(self.manureSystemConnectors, sortByClassAndId)

    local i = 0
    while true do
        local key = ("manureSystem.hoses.hose(%d)"):format(i)
        if not hasXMLProperty(xmlFile, key) then
            break
        end

        local hoseId = getXMLInt(xmlFile, key .. "#objectId")
        if self:connectorObjectExists(hoseId) then
            local object = self:getConnectorObject(hoseId)
            if object.isaHose ~= nil and object:isaHose() then
                object:onMissionLoadFromSavegame(key, xmlFile)
            end
        end

        i = i + 1
    end
end

---Called when mission is being saved with our own xml file.
function ManureSystem:onMissionSaveToSavegame(xmlFile)
    setXMLInt(xmlFile, "manureSystem#version", 1)

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
        setXMLInt(xmlFile, key .. "#objectId", id)
        object:onMissionSaveToSavegame(key, xmlFile)
    end
end

---Loads the shared sample files for the manure system.
function ManureSystem:loadManureSystemSamples()
    local xmlFile = loadXMLFile("ManureSystemSamples", Utils.getFilename("resources/sounds.xml", self.modDirectory))
    if xmlFile ~= nil then
        local soundsNode = getRootNode()

        self.samples.pump = self.soundManager:loadSampleFromXML(xmlFile, "vehicle.sounds", "pump", self.modDirectory, soundsNode, 1, AudioGroup.VEHICLE, nil, nil)

        delete(xmlFile)
    end
end

---Returns the current loaded samples.
function ManureSystem:getManureSystemSamples()
    return self.samples
end

---Adds connector object to the list and force it being distinct.
function ManureSystem:addConnectorObject(object)
    if not ListUtil.hasListElement(self.manureSystemConnectors, object) then
        ListUtil.addElementToList(self.manureSystemConnectors, object)
    end
end

---Removes connector object from the list.
function ManureSystem:removeConnectorObject(object)
    ListUtil.removeElementFromList(self.manureSystemConnectors, object)
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
    return ListUtil.findListElementFirstIndex(self.manureSystemConnectors, object)
end

---Return true when the object exists, false otherwise.
function ManureSystem:connectorObjectExists(id)
    return self.manureSystemConnectors[id] ~= nil
end

function ManureSystem.installSpecializations(vehicleTypeManager, specializationManager, modDirectory, modName)
    for typeName, typeEntry in pairs(vehicleTypeManager:getVehicleTypes()) do
        local stringParts = StringUtil.splitString(".", typeName)
        local hasVehicleSpec = false
        if #stringParts ~= 1 then
            local typeModName, vehicleType = unpack(stringParts)
            local spec = specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemVehicle")
            hasVehicleSpec = spec ~= nil and spec.getManureSystemVehicleHasFeatureEnabled ~= nil

            if hasVehicleSpec then
                if spec.getManureSystemVehicleHasFeatureEnabled(vehicleType, "hasPumpMotor") then
                    if not SpecializationUtil.hasSpecialization(ManureSystemPumpMotor, typeEntry.specializations) then
                        vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
                        Logger.info("Adding ManureSystemPumpMotor to: '" .. typeName)
                    end
                end

                if spec.getManureSystemVehicleHasFeatureEnabled(vehicleType, "hasConnectors") then
                    if not SpecializationUtil.hasSpecialization(ManureSystemConnector, typeEntry.specializations) then
                        vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
                        Logger.info("Adding ManureSystemConnector to: '" .. typeName)
                    end
                end

                if spec.getManureSystemVehicleHasFeatureEnabled(vehicleType, "hasFillArm") then
                    if not SpecializationUtil.hasSpecialization(ManureSystemFillArm, typeEntry.specializations) then
                        vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
                        Logger.info("Adding ManureSystemFillArm to: '" .. typeName)
                    end
                end

                if spec.getManureSystemVehicleHasFeatureEnabled(vehicleType, "hasFillArmReceiver") then
                    if not SpecializationUtil.hasSpecialization(ManureSystemFillArmReceiver, typeEntry.specializations) then
                        vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArmReceiver")
                        Logger.info("Adding ManureSystemFillArmReceiver to: '" .. typeName)
                    end
                end
            end
        end

        if not hasVehicleSpec and SpecializationUtil.hasSpecialization(ManureBarrel, typeEntry.specializations) then
            if not SpecializationUtil.hasSpecialization(ManureSystemPumpMotor, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
            end
            if not SpecializationUtil.hasSpecialization(ManureSystemConnector, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
            end
            if not SpecializationUtil.hasSpecialization(ManureSystemFillArm, typeEntry.specializations) then
                vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
            end
        end
    end
end

----------------------
-- Commands
----------------------

function ManureSystem:consoleCommandToggleDebug()
    self.debug = not self.debug

    if self.debug then
        for _, object in ipairs(self.manureSystemConnectors) do
            object:raiseActive()
        end
    end

    return tostring(self.debug)
end
