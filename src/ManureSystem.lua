----------------------------------------------------------------------------------------------------
-- ManureSystem
----------------------------------------------------------------------------------------------------
-- Purpose: Main class the handle the Manure System.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystem
ManureSystem = {}

local ManureSystem_mt = Class(ManureSystem)

function ManureSystem:new(mission, input, i18n, modDirectory, modName)
    local self = setmetatable({}, ManureSystem_mt)

    self.isServer = mission:getIsServer()
    self.isClient = mission:getIsClient()
    self.modDirectory = modDirectory
    self.modName = modName
    self.debug = false

    self.connectorManager = ManureSystemConnectorManager:new(self.modDirectory)
    self.fillArmManager = ManureSystemFillArmManager:new(self.modDirectory)
    self.player = HosePlayer:new(self.isClient, self.isServer, mission, input)
    self.husbandryModuleLiquidManure = ManureSystemHusbandryModuleLiquidManure:new(self.isClient, self.isServer, mission, input)

    self.manureSystemConnectors = {}
    self.samples = {}

    self:loadManureSystemSamples()

    addConsoleCommand("msToggleDebug", "Toggle debugging", "consoleCommandToggleDebug", self)

    return self
end

function ManureSystem:delete()
    self.player:delete()
    self.husbandryModuleLiquidManure:delete()

    self.connectorManager:unloadMapData()
    self.fillArmManager:unloadMapData()

    g_soundManager:deleteSamples(self.samples)
    removeConsoleCommand("msToggleDebug")
end

function ManureSystem:onMissionLoaded(mission)
    self.connectorManager:loadMapData()
    self.fillArmManager:loadMapData()
end

function ManureSystem:onMissionLoadFromSavegame(xmlFile)
    local i = 0
    while true do
        local key = ("manureSystem.hoses.hose(%d)"):format(i)
        if not hasXMLProperty(xmlFile, key) then
            break
        end

        local hoseId = getXMLInt(xmlFile, key .. "#id")
        if self:connectorObjectExists(hoseId) then
            local object = self:getConnectorObject(hoseId)
            if object.isaHose ~= nil and object:isaHose() then
                object:onMissionLoadFromSavegame(key, xmlFile)
            end
        end

        i = i + 1
    end
end

local sortByConfigFileName = function(arg1, arg2)
    local id1 = ListUtil.findListElementFirstIndex(g_currentMission.vehicles, arg1) or 0
    local id2 = ListUtil.findListElementFirstIndex(g_currentMission.vehicles, arg2) or 0

    return id1 < id2
end

function ManureSystem:onMissionSaveToSavegame(xmlFile)
    setXMLInt(xmlFile, "manureSystem#version", 1)

    local hoses = {}
    local objectToId = {}
    for id, object in ipairs(self.manureSystemConnectors) do
        if object.isaHose ~= nil and object:isaHose() then
            objectToId[object] = id
            table.insert(hoses, object)
        end
    end

    table.sort(hoses, sortByConfigFileName)

    for i, object in ipairs(hoses) do
        local id = objectToId[object]
        local key = ("manureSystem.hoses.hose(%d)"):format(i - 1)
        setXMLInt(xmlFile, key .. "#id", id)
        local idVeh = ListUtil.findListElementFirstIndex(g_currentMission.vehicles, object) or 0
        setXMLInt(xmlFile, key .. "#idVeh", idVeh)
        object:onMissionSaveToSavegame(key, xmlFile)
    end
end

function ManureSystem:update(dt)
end

function ManureSystem:loadManureSystemSamples()
    local xmlFile = loadXMLFile("ManureSystemSamples", Utils.getFilename("resources/sounds.xml", self.modDirectory))
    if xmlFile ~= nil then
        local soundsNode = getRootNode()

        self.samples.pump = g_soundManager:loadSampleFromXML(xmlFile, "vehicle.sounds", "pump", self.modDirectory, soundsNode, 1, AudioGroup.VEHICLE, nil, nil)

        delete(xmlFile)
    end
end

function ManureSystem:getManureSystemSamples()
    return self.samples
end

function ManureSystem:addConnectorObject(object)
    if not ListUtil.hasListElement(self.manureSystemConnectors, object) then
        ListUtil.addElementToList(self.manureSystemConnectors, object)
        table.sort(self.manureSystemConnectors, sortByConfigFileName)
    end
end

function ManureSystem:removeConnectorObject(object)
    ListUtil.removeElementFromList(self.manureSystemConnectors, object)
end

function ManureSystem:getConnectorObjects()
    return self.manureSystemConnectors
end

function ManureSystem:getConnectorObject(id)
    return self.manureSystemConnectors[id]
end

function ManureSystem:getConnectorObjectId(object)
    return ListUtil.findListElementFirstIndex(self.manureSystemConnectors, object)
end

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
    return tostring(self.debug)
end
