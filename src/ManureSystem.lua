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

    self.connectorManager = ManureSystemConnectorManager:new()
    self.fillArmManager = ManureSystemFillArmManager:new()
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
    self.fillArmManager:unloadMapData()
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
            local hose = self:getConnectorObject(hoseId)
            hose:onMissionLoadFromSavegame(key, xmlFile)
        end

        i = i + 1
    end
end

function ManureSystem:onMissionSaveToSavegame(xmlFile)
    setXMLInt(xmlFile, "manureSystem#version", 1)

    local hoses = {}
    for id, object in ipairs(self.manureSystemConnectors) do
        if object.isaHose ~= nil and object:isaHose() then
            table.insert(hoses, { id, object })
        end
    end

    for i, saveData in ipairs(hoses) do
        local id, object = unpack(saveData)
        local key = ("manureSystem.hoses.hose(%d)"):format(i - 1)
        setXMLInt(xmlFile, key .. "#id", id)
        object:onMissionSaveToSavegame(key, xmlFile)
    end
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

function ManureSystem:addConnectorObject(object)
    if not ListUtil.hasListElement(self.manureSystemConnectors, object) then
        ListUtil.addElementToList(self.manureSystemConnectors, object)
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

function ManureSystem:draw(dt)
end

function ManureSystem.installSpecializations(vehicleTypeManager, specializationManager, modDirectory, modName)
    for typeName, typeEntry in pairs(vehicleTypeManager:getVehicleTypes()) do
        local stringParts = StringUtil.splitString(".", typeName)
        local hasVehicleSpec = false
        if #stringParts ~= 1 then
            local typeModName = unpack(stringParts)
            local spec = specializationManager:getSpecializationObjectByName(typeModName .. ".manureSystemVehicle")

            if spec ~= nil then
                hasVehicleSpec = true

                if spec.hasPumpMotor() then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemPumpMotor")
                end

                if spec.hasConnectors() then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemConnector")
                end

                if spec.hasFillArm() then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArm")
                end

                if spec.hasFillArmReceiver() then
                    vehicleTypeManager:addSpecialization(typeName, modName .. ".manureSystemFillArmReceiver")
                end

                Logger.info("Mod '" .. typeModName .. "' hasPumpMotor", spec.hasPumpMotor())
                Logger.info("Mod '" .. typeModName .. "' hasConnectors", spec.hasConnectors())
                Logger.info("Mod '" .. typeModName .. "' hasFillArm", spec.hasFillArm())
                Logger.info("Mod '" .. typeModName .. "' hasFillArmReceiver", spec.hasFillArmReceiver())
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
