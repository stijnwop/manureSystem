-- ManureSystemMixer
--
-- Author: Stijn Wopereis
-- Description: Mixer implementation for vehicles
-- Name: ManureSystemMixer
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemMixer
ManureSystemMixer = {}
ManureSystemMixer.MOD_NAME = g_currentModName

function ManureSystemMixer.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(TurnOnVehicle, specializations)
end

function ManureSystemMixer.initSpecialization()
    local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("ManureSystemMixer")
    XMLExtensions.registerXMLPaths(schema, "vehicle.manureSystemMixer")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemMixer#mixPerSecond", "Mix per seconds")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemMixer#mixYOffset", "Mix Y offset to the fill plane")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemMixer#rayCastDistance", "Distance to raycast for objects")
    EffectManager.registerEffectXMLPaths(schema, "vehicle.manureSystemMixer.effects")
    schema:setXMLSpecializationType()
end

function ManureSystemMixer.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemMixer)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemMixer)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemMixer)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemMixer)
    SpecializationUtil.registerEventListener(vehicleType, "onReadUpdateStream", ManureSystemMixer)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteUpdateStream", ManureSystemMixer)
end

function ManureSystemMixer.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getConsumingLoad", ManureSystemMixer.getConsumingLoad)
end

function ManureSystemMixer:onLoad(savegame)
    self.spec_manureSystemMixer = self[("spec_%s.manureSystemMixer"):format(ManureSystemMixer.MOD_NAME)]
    local spec = self.spec_manureSystemMixer

    spec.isActive = self.xmlFile:getBool("vehicle.manureSystem#hasMixer") or false
    if spec.isActive then
        spec.hasContact = false
        spec.hasContactSend = spec.hasContact

        spec.mixYOffset = self.xmlFile:getValue("vehicle.manureSystemMixer#mixYOffset", 0)
        spec.mixPerSecond = self.xmlFile:getValue("vehicle.manureSystemMixer#mixPerSecond", 30) * 10
        spec.node = XMLExtensions.ensureExistingNode(self, self.xmlFile, "vehicle.manureSystemMixer")
        local rayCastDistance = self.xmlFile:getValue("vehicle.manureSystemMixer#rayCastDistance", 5)
        spec.rayCast = FillPlaneRayCast.new(rayCastDistance)

        if self.isClient then
            spec.effects = {}
            spec.effects = g_effectManager:loadEffect(self.xmlFile, "vehicle.manureSystemMixer.effects", self.components, self, self.i3dMappings)
        end

        spec.dirtyFlag = self:getNextDirtyFlag()
    end

    if not spec.isActive then
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemMixer)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemMixer)
        SpecializationUtil.removeEventListener(self, "onReadUpdateStream", ManureSystemMixer)
        SpecializationUtil.removeEventListener(self, "onWriteUpdateStream", ManureSystemMixer)
    end
end

function ManureSystemMixer:onDelete()
    local spec = self.spec_manureSystemMixer
    if self.isClient then
        g_effectManager:deleteEffects(spec.effects)
    end
end

function ManureSystemMixer:onReadUpdateStream(streamId, timestamp, connection)
    if connection:getIsServer() then
        local isDirty = streamReadBool(streamId)

        if isDirty then
            local spec = self.spec_manureSystemMixer
            spec.hasContact = streamReadBool(streamId)
        end
    end
end

function ManureSystemMixer:onWriteUpdateStream(streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        local spec = self.spec_manureSystemMixer

        if streamWriteBool(streamId, bitAND(dirtyMask, spec.dirtyFlag) ~= 0) then
            streamWriteBool(streamId, spec.hasContact)
        end
    end
end

function ManureSystemMixer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemMixer
    if not self.isClient then
        return
    end

    local isTurnedOn = self:getIsTurnedOn()
    if spec.hasContact and isTurnedOn then
        g_effectManager:setFillType(spec.effects, FillType.LIQUIDMANURE)
        g_effectManager:startEffects(spec.effects)
    else
        g_effectManager:stopEffects(spec.effects)
    end
end

function ManureSystemMixer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemMixer
    if self.isServer and spec.node ~= nil then
        spec.hasContact = false

        local isTurnedOn = self:getIsTurnedOn()
        local x, y, z = getWorldTranslation(spec.node)
        local dx, dy, dz = localDirectionToWorld(spec.node, 0, 0, -1)

        if isTurnedOn then
            spec.rayCast:castRay(x, y, z, dx, dy, dz)
        else
            spec.rayCast:clear()
        end

        local object = spec.rayCast.hitObject
        if object ~= nil and object.decreaseThickness ~= nil then
            spec.hasContact = object:isUnderFillPlane(x, y + spec.mixYOffset, z)
            if isTurnedOn and spec.hasContact then
                object:decreaseThickness(spec.mixPerSecond)
                self:raiseActive()
            end
        end

        if g_currentMission.manureSystem.debug then
            spec.rayCast:draw(spec.node)
        end

        if spec.hasContact ~= spec.hasContactSend then
            spec.hasContactSend = spec.hasContact
            self:raiseDirtyFlags(spec.dirtyFlag)
        end
    end
end

function ManureSystemMixer:getConsumingLoad(superFunc)
    local value, count = superFunc(self)
    local spec = self.spec_manureSystemMixer
    local load = 0
    local object = spec.rayCast.hitObject
    if object ~= nil then
        local thickness = object:getThickness()
        load = load + thickness * 0.5
    end
    return value + load, count + 1
end
