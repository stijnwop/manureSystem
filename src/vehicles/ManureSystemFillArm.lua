----------------------------------------------------------------------------------------------------
-- ManureSystemFillArm
----------------------------------------------------------------------------------------------------
-- Purpose: allows filling from lagoons and fillarm receivers.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFillArm
ManureSystemFillArm = {}
ManureSystemFillArm.RAYCAST_MASK = 32 + 64 + 128 + 256 + 4096 + 8194
ManureSystemFillArm.RAYCAST_DISTANCE = 5

function ManureSystemFillArm.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

function ManureSystemFillArm.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemFillArmFromXML", ManureSystemFillArm.loadManureSystemFillArmFromXML)
    SpecializationUtil.registerFunction(vehicleType, "getFillArm", ManureSystemFillArm.getFillArm)
    SpecializationUtil.registerFunction(vehicleType, "fillArmRaycastCallback", ManureSystemFillArm.fillArmRaycastCallback)
end

function ManureSystemFillArm.registerOverwrittenFunctions(vehicleType)
end

function ManureSystemFillArm.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemFillArm)
end

function ManureSystemFillArm:onLoad(savegame)
    self.spec_manureSystemFillArm = ManureSystemUtil.getSpecTable(self, "manureSystemFillArm")
    local spec = self.spec_manureSystemFillArm

    spec.hasFillArm = hasXMLProperty(self.xmlFile, "vehicle.manureSystemFillArm")
    spec.fillArm = {}
    spec.fillArm.isRaycastAllowed = true
    spec.fillArm.lastRaycastDistance = 0
    spec.fillArm.lastRaycastVehicle = nil
    self:loadManureSystemFillArmFromXML(spec.fillArm, self.xmlFile, "vehicle.manureSystemFillArm", 0)
end

function ManureSystemFillArm:onDelete()
    local spec = self.spec_manureSystemFillArm
    local fillArm = spec.fillArm
    if fillArm.collision ~= nil then
        delete(fillArm.collision)
    end
end

function ManureSystemFillArm:onUpdate(dt)
end

function ManureSystemFillArm:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemFillArm
    if self.isServer and spec.hasFillArm and self.canTurnOnPump ~= nil then
        local fillArm = spec.fillArm
        if fillArm.isRaycastAllowed then
            fillArm.lastRaycastDistance = 0
            fillArm.lastRaycastVehicle = nil

            local x, y, z = getWorldTranslation(fillArm.node)
            local dx, dy, dz = localDirectionToWorld(fillArm.node, 0, 0, -1)

            raycastAll(x, y, z, dx, dy, dz, "fillArmRaycastCallback", 2, self, ManureSystemFillArm.RAYCAST_MASK, true)

            local lx, ly, lz = worldToLocal(fillArm.node, x, y, z)
            local r, g, b = 1, 0, 0

            if fillArm.lastRaycastVehicle ~= nil then
                r, g = 0, 1

                if self:isPumpingIn() then
                    local specPumpMotor = self.spec_manureSystemPumpMotor
                    specPumpMotor.pumpHasContact = fillArm.lastRaycastVehicle:isUnderFillPlane(x, y + fillArm.fillYOffset, z)
                end

                self:setPumpTargetObject(fillArm.lastRaycastVehicle, fillArm.fillUnitIndex)
            else
                self:setPumpTargetObject(nil, nil)
            end

            lz = lz - ManureSystemFillArm.RAYCAST_DISTANCE
            lx, ly, lz = localToWorld(fillArm.node, lx, ly, lz)
            drawDebugLine(x, y, z, r, g, b, lx, ly, lz, r, g, b)
        end
        -- Reset
        fillArm.isRaycastAllowed = true
    end
end

function ManureSystemFillArm:getFillArm()
    return self.spec_manureSystemFillArm.fillArm
end

function ManureSystemFillArm:loadManureSystemFillArmFromXML(fillArm, xmlFile, baseKey, id)
    local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, id)

    if node ~= nil then
        fillArm.id = id + 1
        fillArm.node = node
        fillArm.type = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK)
        fillArm.fillYOffset = Utils.getNoNil(getXMLFloat(xmlFile, baseKey .. "#fillYOffset"), 0)
        fillArm.fillUnitIndex = Utils.getNoNil(getXMLInt(xmlFile, baseKey .. "#fillUnitIndex"), 1)
        fillArm.needsDockingCollision = Utils.getNoNil(getXMLBool(xmlFile, baseKey .. "#needsDockingCollision"), false)

        if fillArm.needsDockingCollision then
            local collision = clone(g_manureSystem.fillArmManager.collision, false, false, true)

            if collision ~= 0 then
                fillArm.collision = collision

                local translation = { StringUtil.getVectorFromString(getXMLString(xmlFile, baseKey .. ".collision#position")) }
                if translation[1] ~= nil and translation[2] ~= nil and translation[3] ~= nil then
                    setTranslation(fillArm.collision, unpack(translation))
                end

                local rotation = { StringUtil.getVectorFromString(getXMLString(xmlFile, baseKey .. ".collision#rotation")) }
                if rotation[1] ~= nil and rotation[2] ~= nil and rotation[3] ~= nil then
                    setRotation(fillArm.collision, MathUtil.degToRad(rotation[1]), MathUtil.degToRad(rotation[2]), MathUtil.degToRad(rotation[3]))
                end

                link(node, fillArm.collision)
            end
        end

        return true
    end

    return false
end

function ManureSystemFillArm:fillArmRaycastCallback(hitObjectId, x, y, z, distance)
    if hitObjectId ~= 0 then
        if hitObjectId == g_currentMission.terrainRootNode then
            return true
        end

        local object = g_currentMission:getNodeObject(hitObjectId)
        if object ~= nil and object.isa ~= nil then
            local spec = self.spec_manureSystemFillArm

            if object:isa(Vehicle) then
                if SpecializationUtil.hasSpecialization(ManureSystemFillArmReceiver, object.specializations) then
                    spec.fillArm.lastRaycastDistance = distance
                    spec.fillArm.lastRaycastVehicle = object

                    return false
                end
            elseif object:isa(ManureSystemStorage) then
                spec.fillArm.lastRaycastDistance = distance
                spec.fillArm.lastRaycastVehicle = object
                return false
            end
        end
    end

    return true
end
