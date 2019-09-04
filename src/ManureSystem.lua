---
-- ManureSystem
--
-- Main class for PumpTools
--
-- Copyright (c) Wopster, 2019

ManureSystem = {}

local ManureSystem_mt = Class(ManureSystem)

function ManureSystem:new(mission, input, i18n, modDirectory, modName)
    local self = setmetatable({}, ManureSystem_mt)

    self.isServer = mission:getIsServer()
    self.isClient = mission:getIsClient()
    self.modDirectory = modDirectory
    self.modName = modName

    self.connectorManager = ManureSystemConnectorManager:new()
    self.player = HosePlayer:new(self.isClient, self.isServer, mission, input)

    self.manureSystemConnectors = {}
    self.samples = {}

    local xmlFile = loadXMLFile("ManureSystemSamples", Utils.getFilename("resources/sounds.xml", modDirectory))
    self:loadManureSystemSamples(xmlFile)

    return self
end

function ManureSystem:delete()
    self.player:delete()

    self.connectorManager:unloadMapData()
end

function ManureSystem:onMissionLoaded(mission)
    self.connectorManager:loadMapData()
end

function ManureSystem:update(dt)
    self.player:update(dt)
end

function ManureSystem:loadManureSystemSamples(xmlFile)
    if xmlFile ~= nil then
        local soundsNode = getRootNode()

        self.samples.pump = g_soundManager:loadSampleFromXML(xmlFile, "vehicle.sounds", "pump", self.modDirectory, soundsNode, 1, AudioGroup.VEHICLE, nil, nil)

        delete(xmlFile)
    end
end

function ManureSystem:getManureSystemSamples()
    return self.samples
end

function ManureSystem:addConnectorVehicle(vehicle)
    if not ListUtil.hasListElement(self.manureSystemConnectors, vehicle) then
        ListUtil.addElementToList(self.manureSystemConnectors, vehicle)
    end
end

function ManureSystem:removeConnectorVehicle(vehicle)
    ListUtil.removeElementFromList(self.manureSystemConnectors, vehicle)
end

function ManureSystem:draw(dt)
end

function ManureSystem.installSpecializations(vehicleTypeManager, specializationManager, modDirectory, modName)
    specializationManager:addSpecialization("manureSystemPumpMotor", "ManureSystemPumpMotor", Utils.getFilename("src/vehicles/ManureSystemPumpMotor.lua", modDirectory), nil)
    specializationManager:addSpecialization("manureSystemConnector", "ManureSystemConnector", Utils.getFilename("src/vehicles/ManureSystemConnector.lua", modDirectory), nil)
    specializationManager:addSpecialization("manureSystemFillArm", "ManureSystemFillArm", Utils.getFilename("src/vehicles/ManureSystemFillArm.lua", modDirectory), nil)

    for typeName, typeEntry in pairs(vehicleTypeManager:getVehicleTypes()) do
        if SpecializationUtil.hasSpecialization(ManureBarrel, typeEntry.specializations) then
            vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
            vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
            vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
        end
    end
end

function ManureSystem.insertSpecializationIntoTypeDefinition(typeName, specializationName, specializationClass, typeEntry)
    if not SpecializationUtil.hasSpecialization(specializationClass, typeEntry.specializations) then
        g_vehicleTypeManager:addSpecialization(typeName, specializationName)

        local specialization = typeEntry.specializationsByName[specializationName]
        if specialization.registerEventListeners ~= nil then
            -- Call event listener register.
            specialization.registerEventListeners(typeEntry)
        end
    end
end
