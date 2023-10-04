-- ManureSystemFillArm
--
-- Author: Stijn Wopereis
-- Description: Allows filling from lagoons and fillarm receivers
-- Name: ManureSystemFillArm
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemFillArm
ManureSystemFillArm = {}
ManureSystemFillArm.MOD_NAME = g_currentModName

---@return void
function ManureSystemFillArm.initSpecialization()
    local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("ManureSystemFillArm")
    ManureSystemFillArm.registerFillArmXMLPaths(schema, "vehicle.manureSystemFillArm")
    ManureSystemFillArm.registerFillArmXMLPaths(schema, "vehicle.manureSystemFillArms.fillArm(?)")
    schema:setXMLSpecializationType()

    g_configurationManager:addConfigurationType("manureSystemFillArm", g_i18n:getText("configuration_manureSystemFillArm"), nil, nil, nil, nil, ConfigurationUtil.SELECTOR_MULTIOPTION)
    ObjectChangeUtil.registerObjectChangeXMLPaths(schema, "vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration(?)")
end

---@return boolean
function ManureSystemFillArm.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillUnit, specializations)
end

---@return void
function ManureSystemFillArm.registerFillArmXMLPaths(schema, baseName)
    XMLExtensions.registerXMLPaths(schema, baseName)
    schema:register(XMLValueType.STRING, baseName .. "#type", "Connector type")
    schema:register(XMLValueType.FLOAT, baseName .. "#fillYOffset", "Fill Y offset to the plane")
    schema:register(XMLValueType.INT, baseName .. "#fillUnitIndex", "Fill unit index")
    schema:register(XMLValueType.FLOAT, baseName .. "#rayCastDistance", "Distance to raycast for objects")
    schema:register(XMLValueType.INT, baseName .. "#controlGroupIndex", "The index of the mouse control group")
    schema:register(XMLValueType.STRING, baseName .. "#limitedFillDirection", "Limit the fill direction of a fillarm to e.g. only out")
    schema:register(XMLValueType.BOOL, baseName .. "#needsDockingCollision", "Fillarm needs docking collision")
    schema:register(XMLValueType.VECTOR_TRANS, baseName .. ".collision#position", "The position of the collision")
    schema:register(XMLValueType.VECTOR_ROT, baseName .. ".collision#rotation", "The rotation of the collision")
    schema:register(XMLValueType.BOOL, baseName .. "#showEffects", "Show effects on the fillarm")
    EffectManager.registerEffectXMLPaths(schema, baseName .. ".effects")
end

---@return void
function ManureSystemFillArm.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemFillArmFromXML", ManureSystemFillArm.loadManureSystemFillArmFromXML)
    SpecializationUtil.registerFunction(vehicleType, "getFillArms", ManureSystemFillArm.getFillArms)
end

---@return void
function ManureSystemFillArm.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "canChangePumpDirection", ManureSystemFillArm.canChangePumpDirection)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getCanDischargeToObject", ManureSystemFillArm.getCanDischargeToObject)
end

---@return void
function ManureSystemFillArm.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemFillArm)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemFillArm)
end

---@return void
function ManureSystemFillArm:onLoad(savegame)
    self.spec_manureSystemFillArm = self[("spec_%s.manureSystemFillArm"):format(ManureSystemFillArm.MOD_NAME)]
    local spec = self.spec_manureSystemFillArm

    spec.isActive = self.xmlFile:getBool("vehicle.manureSystem#hasFillArm") or false

    local configurationId = self.configurations["manureSystemFillArm"] or 1
    local baseKey = ("vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration(%d)"):format(configurationId - 1)
    ObjectChangeUtil.updateObjectChanges(self.xmlFile, "vehicle.manureSystemFillArmConfigurations.manureSystemFillArmConfiguration", configurationId, self.components, self)

    --Fallback
    if not self.xmlFile:hasProperty(baseKey) then
        baseKey = "vehicle"
    end

    spec.fillArms = {}
    spec.rayCast = FillPlaneRayCast.new()

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

    if not spec.isActive or not spec.hasFillArm then
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemFillArm)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemFillArm)
    end
end

---@return void
function ManureSystemFillArm:onDelete()
    local spec = self.spec_manureSystemFillArm

    for _, fillArm in ipairs(spec.fillArms) do
        g_effectManager:deleteEffects(fillArm.effects)
        if fillArm.collision ~= nil then
            delete(fillArm.collision)
        end
    end
end

---@return void
function ManureSystemFillArm:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemFillArm
    if self.isClient and spec.hasFillArm and self.canTurnOnPump ~= nil then
        local pumpHasLoad = self.spec_manureSystemPumpMotor.pumpHasLoad
        local isFillArmPumpMode = self:getPumpMode() == ManureSystemPumpMotor.MODE_FILLARM
        local pumpIsRunning = self:isPumpRunning()
        local isPumpingIn = self:isPumpingIn()

        for _, fillArm in ipairs(spec.fillArms) do
            if not pumpIsRunning then
                g_effectManager:stopEffects(fillArm.effects)
            end

            if pumpHasLoad then
                if isPumpingIn then
                    g_effectManager:stopEffects(fillArm.effects)
                else
                    if pumpIsRunning and isFillArmPumpMode then
                        g_effectManager:setFillType(fillArm.effects, FillType.LIQUIDMANURE)
                        g_effectManager:startEffects(fillArm.effects)
                    end
                end
            end
        end
    end
end

---@return void
function ManureSystemFillArm:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_manureSystemFillArm
    if self.isServer and spec.hasFillArm and self.canTurnOnPump ~= nil then

        spec.rayCast:clear()

        local isFillArmPumpMode = self:getPumpMode() == ManureSystemPumpMotor.MODE_FILLARM
        for _, fillArm in ipairs(spec.fillArms) do
            if fillArm.isRaycastAllowed then
                local x, y, z = getWorldTranslation(fillArm.node)
                local dx, dy, dz = localDirectionToWorld(fillArm.node, 0, 0, -1)

                if self:getIsOperating() then
                    if g_currentMission.manureSystem.debug then
                        DebugUtil.drawDebugNode(fillArm.node, "ACTIVE FILLARM")
                    end

                    spec.rayCast:castRay(x, y, z, dx, dy, dz, fillArm.rayCastDistance)
                end

                local object = spec.rayCast.hitObject
                if object ~= nil then
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
                    if isFillArmPumpMode then
                        self:setPumpTargetObject(nil, nil)
                    end
                end

                local waterY = g_currentMission.environmentAreaSystem:getWaterYAtWorldPosition(x, y, z) or -2000
                local isNearWater = (y <= waterY + 0.1)
                if isNearWater then
                    self:setPumpMode(ManureSystemPumpMotor.MODE_FILLARM)
                end
                self:setIsPumpSourceWater(isNearWater)

                if g_currentMission.manureSystem.debug then
                    spec.rayCast:draw(fillArm.node, fillArm.rayCastDistance)
                end
            end

            -- Reset
            fillArm.isRaycastAllowed = true
        end
    end
end

---@return table
function ManureSystemFillArm:getFillArms()
    return self.spec_manureSystemFillArm.fillArms
end

---@return boolean
function ManureSystemFillArm:loadManureSystemFillArmFromXML(fillArm, xmlFile, baseKey, id)
    local node = XMLExtensions.ensureExistingNode(self, xmlFile, baseKey)

    if node ~= nil then
        fillArm.id = id + 1
        fillArm.node = node
        fillArm.fillYOffset = xmlFile:getValue(baseKey .. "#fillYOffset", 0)
        fillArm.fillUnitIndex = xmlFile:getValue(baseKey .. "#fillUnitIndex", 1)
        fillArm.rayCastDistance = xmlFile:getValue(baseKey .. "#rayCastDistance", 2)
        fillArm.controlGroupIndex = xmlFile:getValue(baseKey .. "#controlGroupIndex", 0)
        fillArm.isRaycastAllowed = true

        local connectorManager = g_currentMission.manureSystem.connectorManager
        local typeString = xmlFile:getValue(baseKey .. "#type", ManureSystemConnectorManager.CONNECTOR_TYPE_OPTICAL)
        fillArm.type = connectorManager:getConnectorType(typeString) or connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_OPTICAL)

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

                NodeExtensions.setVectorByXML(collision, xmlFile, baseKey .. ".collision#position", NodeExtensions.setPosition)
                NodeExtensions.setVectorByXML(collision, xmlFile, baseKey .. ".collision#rotation", NodeExtensions.setRotation)

                fillArm.collision = collision
                link(node, fillArm.collision)
            end
        end

        if self.isClient and xmlFile:getValue(baseKey .. "#showEffects", true) then
            if xmlFile:hasProperty(baseKey .. ".effects") then
                fillArm.effects = g_effectManager:loadEffect(self.xmlFile, baseKey .. ".effects", self.components, self, self.i3dMappings)
            else
                fillArm.effects = g_currentMission.manureSystem.fillArmManager:loadEffectsAtNode(node)
            end
        end

        return true
    end

    Logging.xmlWarning(self.configFileName, "Could not load fillArm from XML, missing node entry!")

    return false
end

----------------
-- Overwrites --
----------------

---Allow limiting the pump direction for a given fill arm
---@return boolean
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

---@return boolean
function ManureSystemFillArm:getCanDischargeToObject(superFunc, dischargeNode)
    local object, _ = self:getDischargeTargetObject(dischargeNode)
    if object ~= nil then
        local targetObject = object
        local trigger

        if object.target ~= nil and object.target.owningPlaceable ~= nil then
            targetObject = object.target.owningPlaceable
            trigger = object
        end

        local sourceObjectCanDisableVanillaLoading = self.getCanDisableVanillaUnloading == nil or self:getCanDisableVanillaUnloading(targetObject, trigger)
        local targetObjectCanDisableVanillaLoading = targetObject.getCanDisableVanillaUnloading == nil or targetObject:getCanDisableVanillaUnloading(self, trigger)

        if sourceObjectCanDisableVanillaLoading and targetObjectCanDisableVanillaLoading then
            local pumpDirectionIn = ManureSystemPumpMotor.PUMP_DIRECTION_IN
            local pumpDirectionOut = ManureSystemPumpMotor.PUMP_DIRECTION_OUT

            if g_currentMission.manureSystem:getObjectSupportsFillArms(targetObject) and g_currentMission.manureSystem:getObjectHasFillArms(self, nil, pumpDirectionOut) then
                return false
            end

            local dockTypeName = ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK

            if g_currentMission.manureSystem:getObjectHasConnectors(targetObject, dockTypeName, pumpDirectionIn) and g_currentMission.manureSystem:getObjectHasFillArms(self, dockTypeName, pumpDirectionOut) then
                return false
            end
        end
    end

    return superFunc(self, dischargeNode)
end
