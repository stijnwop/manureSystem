----------------------------------------------------------------------------------------------------
-- ManureSystemFillArm
----------------------------------------------------------------------------------------------------
-- Purpose: allows filling from lagoons and fillarm receivers.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFillArm
ManureSystemFillArm = {}
ManureSystemFillArm.MOD_NAME = g_currentModName

ManureSystemFillArm.RAYCAST_MASK = 32 + 64 + 128 + 256 + 4096 + 8194
ManureSystemFillArm.RAYCAST_DISTANCE = 5

function ManureSystemFillArm.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

function ManureSystemFillArm.initSpecialization()
    local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("ManureSystemFillArm")
    ManureSystemFillArm.registerFillArmXMLPaths(schema, "vehicle.manureSystemFillArm")
    ManureSystemFillArm.registerFillArmXMLPaths(schema, "vehicle.manureSystemFillArms.fillArm(?)")
    schema:setXMLSpecializationType()

    g_configurationManager:addConfigurationType("manureSystemFillArm", g_i18n:getText("configuration_manureSystemFillArm"), nil, nil, nil, nil, ConfigurationUtil.SELECTOR_MULTIOPTION)
    ObjectChangeUtil.registerObjectChangeXMLPaths(schema, "vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration(?)")
end

function ManureSystemFillArm.registerFillArmXMLPaths(schema, baseName)
    ManureSystemXMLUtil.registerNodeCreationXMLPaths(schema, baseName)
    schema:register(XMLValueType.FLOAT, baseName .. "#fillYOffset", "Connector type")
    schema:register(XMLValueType.INT, baseName .. "#fillUnitIndex", "Connector type")
    schema:register(XMLValueType.FLOAT, baseName .. "#rayCastDistance", "Connector type")
    schema:register(XMLValueType.INT, baseName .. "#controlGroupIndex", "Connector type")
    schema:register(XMLValueType.STRING, baseName .. "#limitedFillDirection", "Connector type")
    schema:register(XMLValueType.BOOL, baseName .. "#needsDockingCollision", "Connector type")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. ".collision#position", "The position of the collision")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. ".collision#rotation", "The rotation of the collision")
end

function ManureSystemFillArm.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemFillArmFromXML", ManureSystemFillArm.loadManureSystemFillArmFromXML)
    SpecializationUtil.registerFunction(vehicleType, "getFillArms", ManureSystemFillArm.getFillArms)
    SpecializationUtil.registerFunction(vehicleType, "fillArmRaycastCallback", ManureSystemFillArm.fillArmRaycastCallback)
end

function ManureSystemFillArm.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "canChangePumpDirection", ManureSystemFillArm.canChangePumpDirection)
end

function ManureSystemFillArm.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemFillArm)
end

---Called on load.
function ManureSystemFillArm:onLoad(savegame)
    self.spec_manureSystemFillArm = self[("spec_%s.manureSystemFillArm"):format(ManureSystemFillArm.MOD_NAME)]
    local spec = self.spec_manureSystemFillArm

    local configurationId = self.configurations["manureSystemFillArm"] or 1
    local baseKey = ("vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration(%d)"):format(configurationId - 1)
    ObjectChangeUtil.updateObjectChanges(self.xmlFile, "vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration", configurationId, self.components, self)

    --Fallback
    if not self.xmlFile:hasProperty(baseKey) then
        baseKey = "vehicle"
    end

    spec.fillArms = {}
    spec.isRaycastAllowed = true
    spec.lastRaycastDistance = 0
    spec.lastRaycastObject = nil

    local singleEntryKey = ("%s.manureSystemFillArm"):format(baseKey)
    if self.xmlFile:hasProperty(singleEntryKey) then
        local entry = {}
        if self:loadManureSystemFillArmFromXML(entry, self.xmlFile, singleEntryKey, 0) then
            table.insert(spec.fillArms, entry)
        end
    else
        local i = 0
        while true do
            local key = ("%s.manureSystemFillArms.fillArm(%d)"):format(baseKey, i)

            if not self.xmlFile:hasProperty(key) then
                break
            end

            local entry = {}
            if self:loadManureSystemFillArmFromXML(entry, self.xmlFile, key, i) then
                table.insert(spec.fillArms, entry)
            end

            i = i + 1
        end
    end

    spec.hasFillArm = #spec.fillArms ~= 0

    if not spec.hasFillArm then
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemFillArm)
    end
end

---Called on delete.
function ManureSystemFillArm:onDelete()
    local spec = self.spec_manureSystemFillArm

    for _, fillArm in ipairs(spec.fillArms) do
        if fillArm.collision ~= nil then
            delete(fillArm.collision)
        end
    end
end

---Called on update tick.
function ManureSystemFillArm:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemFillArm
    if self.isServer and spec.hasFillArm and self.canTurnOnPump ~= nil then

        if spec.isRaycastAllowed then
            spec.lastRaycastDistance = 0
            spec.lastRaycastObject = nil

            for _, fillArm in ipairs(spec.fillArms) do
                local x, y, z = getWorldTranslation(fillArm.node)
                local dx, dy, dz = localDirectionToWorld(fillArm.node, 0, 0, -1)

                if self:getIsActiveForInput() then
                    raycastAll(x, y, z, dx, dy, dz, "fillArmRaycastCallback", fillArm.rayCastDistance, self, ManureSystemFillArm.RAYCAST_MASK, true)
                end

                local r, g, b = 1, 0, 0

                local object = spec.lastRaycastObject
                if object ~= nil then
                    r, g = 0, 1

                    if fillArm.limitedFillDirection ~= nil then
                        --When the limited direction is present, but not set, we force it.
                        if self:getPumpDirection() ~= fillArm.limitedFillDirection then
                            self:setPumpDirection(fillArm.limitedFillDirection)
                        end
                    end

                    if self:isPumpingIn() then
                        self.spec_manureSystemPumpMotor.pumpHasContact = object:isUnderFillPlane(x, y + fillArm.fillYOffset, z)
                    end

                    local objectFillUnitIndex = object:getFillArmFillUnitIndex()
                    self:setPumpMode(ManureSystemPumpMotor.MODE_FILLARM)
                    self:setPumpTargetObject(object, objectFillUnitIndex)

                    if self.isStandalonePump ~= nil and self:isStandalonePump() then
                        local fillType = object:getFillUnitFillType(objectFillUnitIndex)
                        local rootVehicle = self:getRootVehicle()
                        local sourceObject, sourceFillUnitIndex = ManureSystemPumpMotor.getAttachedPumpSourceObject(rootVehicle, fillType, self)
                        if sourceObject ~= nil then
                            self:setPumpSourceObject(sourceObject, sourceFillUnitIndex)
                        end
                    end
                else
                    if self:getPumpMode() == ManureSystemPumpMotor.MODE_FILLARM then
                        self:setPumpTargetObject(nil, nil)
                    end
                end

                local isNearWater = (y <= g_currentMission.waterY + 0.1)
                self:setIsPumpSourceWater(isNearWater)

                if g_currentMission.manureSystem.debug then
                    local lx, ly, lz = worldToLocal(fillArm.node, x, y, z)
                    lz = lz - ManureSystemFillArm.RAYCAST_DISTANCE
                    lx, ly, lz = localToWorld(fillArm.node, lx, ly, lz)
                    drawDebugLine(x, y, z, r, g, b, lx, ly, lz, r, g, b)
                end
            end
        end

        -- Reset
        spec.isRaycastAllowed = true
    end
end

---Gets the current active fill arms.
function ManureSystemFillArm:getFillArms()
    return self.spec_manureSystemFillArm.fillArms
end

---Load the current fill arm from the xml.
function ManureSystemFillArm:loadManureSystemFillArmFromXML(fillArm, xmlFile, baseKey, id)
    local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, id)

    if node ~= nil then
        fillArm.id = id + 1
        fillArm.node = node
        fillArm.type = g_currentMission.manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK)
        fillArm.fillYOffset = xmlFile:getValue(baseKey .. "#fillYOffset", 0)
        fillArm.fillUnitIndex = xmlFile:getValue(baseKey .. "#fillUnitIndex", 1)
        fillArm.rayCastDistance = xmlFile:getValue(baseKey .. "#rayCastDistance", 2)
        fillArm.controlGroupIndex = xmlFile:getValue(baseKey .. "#controlGroupIndex", 0)

        local limit = xmlFile:getValue(baseKey .. "#limitedFillDirection")
        if limit ~= nil then
            fillArm.limitedFillDirection = limit:upper() == ManureSystemPumpMotor.PUMP_DIRECTION_IN_STR and ManureSystemPumpMotor.PUMP_DIRECTION_IN or ManureSystemPumpMotor.PUMP_DIRECTION_OUT
        end

        fillArm.needsDockingCollision = xmlFile:getValue(baseKey .. "#needsDockingCollision", false)
        if fillArm.needsDockingCollision then
            local collision = clone(g_currentMission.manureSystem.fillArmManager.collision, false, false, false)

            if collision ~= 0 then
                setIsCompoundChild(collision, true)
                addToPhysics(collision)
                ManureSystemUtil.loadNodePositionAndRotation(xmlFile, baseKey .. ".collision", collision)
                fillArm.collision = collision
                link(node, fillArm.collision)
            end
        end

        return true
    end

    Logging.xmlWarning(self.configFileName, "Could not load fillArm from XML, missing node entry!")

    return false
end

---Raycast callback for detecting fill arm object.
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
                    spec.lastRaycastDistance = distance
                    spec.lastRaycastObject = object

                    return false
                end
            elseif object:isa(Placeable) and object.isUnderFillPlane ~= nil then
                spec.lastRaycastDistance = distance
                spec.lastRaycastObject = object

                return false
            end
        end
    end

    return true
end

----------------
-- Overwrites --
----------------

---Allow limiting the pump direction for a given fill arm.
function ManureSystemFillArm:canChangePumpDirection(superFunc)
    local spec = self.spec_cylindered
    --We need cylindered (for moving tools) to check the limited fill direction of the arm.
    if spec ~= nil then
        local currentDirection = self:getPumpDirection()
        for _, fillArm in ipairs(self:getFillArms()) do
            if fillArm.limitedFillDirection ~= nil then
                local isSelectedFillArm = fillArm.controlGroupIndex == 0
                    or fillArm.controlGroupIndex == spec.currentControlGroupIndex

                if isSelectedFillArm then
                    if currentDirection == fillArm.limitedFillDirection then
                        return false
                    end
                end
            end
        end
    end

    return superFunc(self)
end
