---
-- ManureSystem
--
-- Main class for PumpTools
--
-- Copyright (c) Wopster, 2019

ManureSystem = {}

local ManureSystem_mt = Class(ManureSystem)

function ManureSystem:new(mission, modDirectory, modName, i18n)
    local self = setmetatable({}, ManureSystem_mt)

    self.isServer = mission:getIsServer()
    self.isClient = mission:getIsClient()
    self.modDirectory = modDirectory
    self.modName = modName

    self.player = HosePlayer:new(self.isClient, self.isServer)

    self.manureSystemConnectors = {}

    return self
end

function ManureSystem:delete()
    self.player:delete()
end

function ManureSystem:update(dt)
    self.player:update(dt)
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
    specializationManager:addSpecialization("manureSystemConnector", "ManureSystemConnector", Utils.getFilename("src/vehicles/ManureSystemConnector.lua", modDirectory), nil)

    for typeName, typeEntry in pairs(vehicleTypeManager:getVehicleTypes()) do
        if SpecializationUtil.hasSpecialization(ManureBarrel, typeEntry.specializations) then
            vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
        end
    end
end
