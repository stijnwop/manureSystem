--
-- ManureSystemPumpMotor
--
-- Author: Stijn Wopereis
-- Description: The pump functionality for the vehicles
-- Name: ManureSystemPumpMotor
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPumpMotor
ManureSystemPumpMotor = {}
ManureSystemPumpMotor.MOD_NAME = g_currentModName
ManureSystemPumpMotor.MOD_DIR = g_CurrentModDirectory

ManureSystemPumpMotor.PUMP_DIRECTION_IN = 1
ManureSystemPumpMotor.PUMP_DIRECTION_OUT = -1

ManureSystemPumpMotor.PUMP_DIRECTION_IN_STR = "IN"
ManureSystemPumpMotor.PUMP_DIRECTION_OUT_STR = "OUT"

ManureSystemPumpMotor.AUTO_STOP_MULTIPLIER_IN = 0.99
ManureSystemPumpMotor.AUTO_STOP_MULTIPLIER_OUT = 0.98

ManureSystemPumpMotor.DEFAULT_FILLUNIT_INDEX = 1

---Messages
ManureSystemPumpMotor.WARNING_TIME = 1500

ManureSystemPumpMotor.WARNING_NONE = 0
ManureSystemPumpMotor.WARNING_EMPTY = 1
ManureSystemPumpMotor.WARNING_FULL = 2
ManureSystemPumpMotor.WARNING_INVALID_FILL_TYPE = 3

---Pump modes
ManureSystemPumpMotor.MODE_NONE = 0
ManureSystemPumpMotor.MODE_CONNECTOR = 1
ManureSystemPumpMotor.MODE_FILLARM = 2
ManureSystemPumpMotor.MODE_FILLARM_DOCK = 3

---@return void
function ManureSystemPumpMotor.initSpecialization()
    local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("ManureSystemPumpMotor")
    ManureSystem.registerConfigurationRestrictionsXMLPaths(schema, "vehicle.manureSystemPumpMotor")
    schema:register(XMLValueType.BOOL, "vehicle.manureSystemPumpMotor#isStandalone", "Fill volume index to interact with")
    schema:register(XMLValueType.BOOL, "vehicle.manureSystemPumpMotor#useStandalonePumpText", "Fill unit index to pump from")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", "Offset for the fillarm interaction")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemPumpMotor#litersPerSecond", "Offset for the fillarm interaction")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemPumpMotor#autoStopPercentageIn", "Offset for the fillarm interaction")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemPumpMotor#autoStopPercentageOut", "Offset for the fillarm interaction")
    schema:register(XMLValueType.FLOAT, "vehicle.manureSystemPumpMotor#warningTime", "Offset for the fillarm interaction")
    schema:register(XMLValueType.INT, "vehicle.manureSystemPumpMotor#fillUnitIndex", "Fill unit index the pump defaults to when using self as source")
    schema:setXMLSpecializationType()
end

---@return boolean
function ManureSystemPumpMotor.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PowerConsumer, specializations)
end

---@return void
function ManureSystemPumpMotor.registerEvents(vehicleType)
    SpecializationUtil.registerEvent(vehicleType, "onPumpStarted")
    SpecializationUtil.registerEvent(vehicleType, "onPumpStopped")
    SpecializationUtil.registerEvent(vehicleType, "onPumpInvalid")
end

---@return void
function ManureSystemPumpMotor.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "setIsPumpRunning", ManureSystemPumpMotor.setIsPumpRunning)
    SpecializationUtil.registerFunction(vehicleType, "isPumpRunning", ManureSystemPumpMotor.isPumpRunning)
    SpecializationUtil.registerFunction(vehicleType, "canTurnOnPump", ManureSystemPumpMotor.canTurnOnPump)
    SpecializationUtil.registerFunction(vehicleType, "getTurnOnPumpNotAllowedWarning", ManureSystemPumpMotor.getTurnOnPumpNotAllowedWarning)
    SpecializationUtil.registerFunction(vehicleType, "checkPumpNotAllowedWarning", ManureSystemPumpMotor.checkPumpNotAllowedWarning)
    SpecializationUtil.registerFunction(vehicleType, "setPumpMode", ManureSystemPumpMotor.setPumpMode)
    SpecializationUtil.registerFunction(vehicleType, "getPumpMode", ManureSystemPumpMotor.getPumpMode)
    SpecializationUtil.registerFunction(vehicleType, "canChangePumpDirection", ManureSystemPumpMotor.canChangePumpDirection)
    SpecializationUtil.registerFunction(vehicleType, "setPumpDirection", ManureSystemPumpMotor.setPumpDirection)
    SpecializationUtil.registerFunction(vehicleType, "getPumpDirection", ManureSystemPumpMotor.getPumpDirection)
    SpecializationUtil.registerFunction(vehicleType, "isPumpingIn", ManureSystemPumpMotor.isPumpingIn)
    SpecializationUtil.registerFunction(vehicleType, "isPumpingOut", ManureSystemPumpMotor.isPumpingOut)
    SpecializationUtil.registerFunction(vehicleType, "handlePump", ManureSystemPumpMotor.handlePump)
    SpecializationUtil.registerFunction(vehicleType, "runPump", ManureSystemPumpMotor.runPump)
    SpecializationUtil.registerFunction(vehicleType, "isStandalonePump", ManureSystemPumpMotor.isStandalonePump)
    SpecializationUtil.registerFunction(vehicleType, "isPumpTargetObjectValid", ManureSystemPumpMotor.isPumpTargetObjectValid)
    SpecializationUtil.registerFunction(vehicleType, "setPumpTargetObject", ManureSystemPumpMotor.setPumpTargetObject)
    SpecializationUtil.registerFunction(vehicleType, "getPumpTargetObject", ManureSystemPumpMotor.getPumpTargetObject)
    SpecializationUtil.registerFunction(vehicleType, "setPumpSourceObject", ManureSystemPumpMotor.setPumpSourceObject)
    SpecializationUtil.registerFunction(vehicleType, "getPumpSourceObject", ManureSystemPumpMotor.getPumpSourceObject)
    SpecializationUtil.registerFunction(vehicleType, "getPumpSourceObjectOrSelf", ManureSystemPumpMotor.getPumpSourceObjectOrSelf)
    SpecializationUtil.registerFunction(vehicleType, "setIsPumpSourceWater", ManureSystemPumpMotor.setIsPumpSourceWater)
    SpecializationUtil.registerFunction(vehicleType, "getIsPumpSourceWater", ManureSystemPumpMotor.getIsPumpSourceWater)
    SpecializationUtil.registerFunction(vehicleType, "setPumpMaxTime", ManureSystemPumpMotor.setPumpMaxTime)
    SpecializationUtil.registerFunction(vehicleType, "getPumpMaxTime", ManureSystemPumpMotor.getPumpMaxTime)
    SpecializationUtil.registerFunction(vehicleType, "getOriginalPumpMaxTime", ManureSystemPumpMotor.getOriginalPumpMaxTime)
    SpecializationUtil.registerFunction(vehicleType, "getCanDisableVanillaUnloading", ManureSystemPumpMotor.getCanDisableVanillaUnloading)
    SpecializationUtil.registerFunction(vehicleType, "getCanDisableVanillaLoading", ManureSystemPumpMotor.getCanDisableVanillaLoading)
end

---@return void
function ManureSystemPumpMotor.registerOverwrittenFunctions(vehicleType)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "getIsTurnedOn", ManureSystemPumpMotor.getIsTurnedOn)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "getCanBeTurnedOn", ManureSystemPumpMotor.getCanBeTurnedOn)
    --SpecializationUtil.registerOverwrittenFunction(vehicleType, "getCanToggleTurnedOn", ManureSystemPumpMotor.getCanToggleTurnedOn)

    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getIsWorkAreaActive", ManureSystemPumpMotor.getIsWorkAreaActive)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getIsFillUnitActive", ManureSystemPumpMotor.getIsFillUnitActive)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getConsumingLoad", ManureSystemPumpMotor.getConsumingLoad)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getDoConsumePtoPower", ManureSystemPumpMotor.getDoConsumePtoPower)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getIsOperating", ManureSystemPumpMotor.getIsOperating)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getRequiresPower", ManureSystemPumpMotor.getRequiresPower)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getIsPowerTakeOffActive", ManureSystemPumpMotor.getIsPowerTakeOffActive)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getUseTurnedOnSchema", ManureSystemPumpMotor.getUseTurnedOnSchema)
end

---@return void
function ManureSystemPumpMotor.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onReadStream", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteStream", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onReadUpdateStream", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteUpdateStream", ManureSystemPumpMotor)
    SpecializationUtil.registerEventListener(vehicleType, "onRegisterActionEvents", ManureSystemPumpMotor)
end

---@return void
function ManureSystemPumpMotor:onLoad(savegame)
    self.spec_manureSystemPumpMotor = self[("spec_%s.manureSystemPumpMotor"):format(ManureSystemPumpMotor.MOD_NAME)]
    local spec = self.spec_manureSystemPumpMotor

    spec.isActive = self.xmlFile:getBool("vehicle.manureSystem#hasPumpMotor") or false

    if not g_currentMission.manureSystem:getAreConfigurationRestrictionsFulfilled(self, self.xmlFile, "vehicle.manureSystemPumpMotor") then
        spec.isActive = false
    end

    spec.pumpIsRunning = false
    spec.pumpHasLoad = true
    spec.pumpHasContact = true
    spec.pumpMode = ManureSystemPumpMotor.MODE_NONE
    spec.pumpDirection = ManureSystemPumpMotor.PUMP_DIRECTION_IN

    spec.isStandalone = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#isStandalone", false)
    spec.useStandalonePumpText = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#useStandalonePumpText", spec.isStandalone)
    spec.fillUnitIndex = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#fillUnitIndex", ManureSystemPumpMotor.DEFAULT_FILLUNIT_INDEX)

    local maxTime = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1500)
    spec.pumpEfficiency = {
        currentLoad = 0,
        currentTime = 0,
        orgMaxTime = maxTime,
        maxTime = maxTime,
        litersPerSecond = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#litersPerSecond", 100)
    }

    spec.autoStopPercentage = {
        inDirection = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#autoStopPercentageIn", ManureSystemPumpMotor.AUTO_STOP_MULTIPLIER_IN),
        outDirection = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#autoStopPercentageOut", ManureSystemPumpMotor.AUTO_STOP_MULTIPLIER_OUT)
    }

    if self.isClient then
        local samplePump = g_soundManager:loadSampleFromXML(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds", "pump", self.baseDirectory, self.components, 1, AudioGroup.VEHICLE, self.i3dMappings, self)
        if samplePump == nil then
            local globalSamples = g_currentMission.manureSystem:getManureSystemSamples()
            samplePump = g_soundManager:cloneSample(globalSamples.pump, self.components[1].node, self)
        end

        spec.samples = {}
        spec.samples.pump = samplePump
    end

    spec.warningMessage = {
        currentId = ManureSystemPumpMotor.WARNING_NONE,
        howLongToShow = self.xmlFile:getValue("vehicle.manureSystemPumpMotor#warningTime", ManureSystemPumpMotor.WARNING_TIME),
        messages = {}
    }

    spec.warningMessage.messages[ManureSystemPumpMotor.WARNING_EMPTY] = g_i18n:getText('warning_objectEmpty')
    spec.warningMessage.messages[ManureSystemPumpMotor.WARNING_FULL] = g_i18n:getText('warning_objectFull')
    spec.warningMessage.messages[ManureSystemPumpMotor.WARNING_INVALID_FILL_TYPE] = g_i18n:getText('warning_invalidFillType')

    spec.dirtyFlag = self:getNextDirtyFlag()

    spec.targetObject = nil
    spec.hasTargetObject = false
    spec.targetFillUnitIndex = nil
    spec.sourceObject = nil
    spec.sourceFillUnitIndex = nil
    spec.sourceIsWater = false

    if not spec.isActive then
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onReadUpdateStream", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onWriteUpdateStream", ManureSystemPumpMotor)
        SpecializationUtil.removeEventListener(self, "onRegisterActionEvents", ManureSystemPumpMotor)
    else
        if SpecializationUtil.hasSpecialization(Dischargeable, self.specializations) then
            ManureSystemPumpMotor.disableDischargeable(self)
        end
    end
end

---@return void
function ManureSystemPumpMotor.disableDischargeable(self)
    local spec_dischargeable = self.spec_dischargeable
    if spec_dischargeable ~= nil then
        for _, dischargeNode in ipairs(spec_dischargeable.dischargeNodes) do
            if dischargeNode.trigger.node ~= nil then
                removeTrigger(dischargeNode.trigger.node)
            end
        end
    end
end

---@return void
function ManureSystemPumpMotor:onDelete()
    if self.isClient then
        local spec = self.spec_manureSystemPumpMotor
        g_soundManager:deleteSamples(spec.samples)
    end
end

---@return void
function ManureSystemPumpMotor:onReadStream(streamId, connection)
    local pumpIsRunning = streamReadBool(streamId)
    self:setIsPumpRunning(pumpIsRunning, true)
    local pumpDirection = streamReadUIntN(streamId, 10) / 1023 * 2 - 1
    if math.abs(pumpDirection) < 0.00099 then
        pumpDirection = 0 -- set to 0 to avoid noise caused by compression
    end
    self:setPumpDirection(pumpDirection, true)
end

---@return void
function ManureSystemPumpMotor:onWriteStream(streamId, connection)
    local spec = self.spec_manureSystemPumpMotor
    streamWriteBool(streamId, spec.pumpIsRunning)
    local pumpDirection = (spec.pumpDirection + 1) / 2 * 1023
    streamWriteUIntN(streamId, pumpDirection, 10)
end

---@return void
function ManureSystemPumpMotor:onReadUpdateStream(streamId, timestamp, connection)
    if connection:getIsServer() then
        local isDirty = streamReadBool(streamId)

        if isDirty then
            local spec = self.spec_manureSystemPumpMotor
            spec.pumpEfficiency.currentLoad = streamReadFloat32(streamId)
            spec.pumpHasLoad = streamReadBool(streamId)
            spec.hasTargetObject = streamReadBool(streamId)
        end
    end
end

---@return void
function ManureSystemPumpMotor:onWriteUpdateStream(streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        local spec = self.spec_manureSystemPumpMotor

        if streamWriteBool(streamId, bitAND(dirtyMask, spec.dirtyFlag) ~= 0) then
            streamWriteFloat32(streamId, spec.pumpEfficiency.currentLoad)
            streamWriteBool(streamId, spec.pumpHasLoad)
            streamWriteBool(streamId, spec.hasTargetObject)
        end
    end
end

---@return void
function ManureSystemPumpMotor:onUpdate(dt)
    if self.isClient then
        local canTurnOnPump = self:canTurnOnPump()
        local spec = self.spec_manureSystemPumpMotor

        if canTurnOnPump then
            if spec.actionEvents ~= nil then
                local toggleActionEvent = spec.actionEvents[InputAction.MS_TOGGLE_PUMP_DIRECTION]
                if toggleActionEvent ~= nil then
                    g_inputBinding:setActionEventTextVisibility(toggleActionEvent.actionEventId, not spec.pumpIsRunning)
                end
            end
        end

        local showPumpAction = canTurnOnPump
        if not spec.pumpIsRunning then
            showPumpAction = showPumpAction and spec.hasTargetObject
        else
            showPumpAction = showPumpAction and spec.pumpIsRunning
        end

        if spec.actionEvents ~= nil then
            local pumpActionEvent = spec.actionEvents[InputAction.MS_ACTIVATE_PUMP]
            if pumpActionEvent ~= nil then
                g_inputBinding:setActionEventTextVisibility(pumpActionEvent.actionEventId, showPumpAction)
            end
        end
    end
end

---@return void
function ManureSystemPumpMotor:onUpdateTick(dt)
    local spec = self.spec_manureSystemPumpMotor
    local isPumpRunning = self:isPumpRunning()

    if self.isClient then
        if isPumpRunning then
            if not g_soundManager:getIsSamplePlaying(spec.samples.pump) then
                g_soundManager:playSample(spec.samples.pump)
            end
        else
            if g_soundManager:getIsSamplePlaying(spec.samples.pump) then
                g_soundManager:stopSample(spec.samples.pump)
            end
        end
    end

    if self.isServer then
        self:handlePump(dt)

        if isPumpRunning and not self:canTurnOnPump() then
            self:setIsPumpRunning(false)
        end

        local pumpMode = self:getPumpMode()
        local hasTargetObject = self:isPumpTargetObjectValid()
        local hasLoad = hasTargetObject and spec.pumpHasContact

        --Reset pump when we still have a target object but no pump mode.
        if hasTargetObject and pumpMode == ManureSystemPumpMotor.MODE_NONE then
            self:setPumpTargetObject(nil, nil)
            self:setPumpSourceObject(nil, nil)
            self:setIsPumpSourceWater(false)
            self:setPumpMaxTime(self:getOriginalPumpMaxTime())
            hasTargetObject = false
        end

        --Reset pump mode when we don't have a target object but a set pump mode.
        if not hasTargetObject and pumpMode ~= ManureSystemPumpMotor.MODE_NONE then
            self:setPumpMode(ManureSystemPumpMotor.MODE_NONE)
        end

        if isPumpRunning and hasLoad then
            if spec.pumpEfficiency.currentTime < spec.pumpEfficiency.maxTime then
                spec.pumpEfficiency.currentTime = math.min(spec.pumpEfficiency.currentTime + dt, spec.pumpEfficiency.maxTime)
            end

            -- Reset the stop timer for the motor, else it will turn of the vehicle even in manual ignition mode.
            local rootVehicle = self:getRootVehicle()
            if rootVehicle.spec_motorized ~= nil then
                rootVehicle.spec_motorized.motorStopTimer = rootVehicle.spec_motorized.motorStopTimerDuration
            end
        else
            if spec.pumpEfficiency.currentTime > 0 then
                spec.pumpEfficiency.currentTime = math.max(spec.pumpEfficiency.currentTime - dt, 0)
            end
        end

        local sourceObject, sourceFillUnitIndex = self:getPumpSourceObjectOrSelf()
        if sourceObject ~= nil then
            local isPumpingOut = spec.pumpDirection == ManureSystemPumpMotor.PUMP_DIRECTION_OUT
            if sourceObject:getFillUnitFillLevelPercentage(sourceFillUnitIndex) >= spec.autoStopPercentage.inDirection
                or isPumpingOut and sourceObject:getFillUnitFillLevelPercentage(sourceFillUnitIndex) <= 1 - spec.autoStopPercentage.outDirection
                or isPumpRunning and not hasTargetObject then
                spec.pumpEfficiency.currentLoad = math.random()
            else
                spec.pumpEfficiency.currentLoad = MathUtil.clamp(spec.pumpEfficiency.currentTime / spec.pumpEfficiency.maxTime, 0, 1)
            end
        end

        if hasLoad ~= spec.pumpHasLoad or hasTargetObject ~= spec.hasTargetObject then
            spec.pumpHasLoad = hasLoad
            spec.hasTargetObject = hasTargetObject

            if spec.pumpEfficiency.currentLoad ~= spec.pumpEfficiency.currentLoadSent
                or spec.pumpHasLoad ~= spec.pumpHasLoadSent then
                spec.pumpEfficiency.currentLoadSent = spec.pumpEfficiency.currentLoad
                spec.pumpHasLoadSent = spec.pumpHasLoad
                self:raiseDirtyFlags(spec.dirtyFlag)
            end
        end

        -- Reset contact
        spec.pumpHasContact = true
    end
end

---@return void
function ManureSystemPumpMotor:setIsPumpRunning(pumpIsRunning, noEventSend)
    local spec = self.spec_manureSystemPumpMotor

    if pumpIsRunning ~= spec.pumpIsRunning then
        ManureSystemPumpIsRunningEvent.sendEvent(self, pumpIsRunning, noEventSend)

        spec.pumpIsRunning = pumpIsRunning

        local event = pumpIsRunning and "onPumpStarted" or "onPumpStopped"
        SpecializationUtil.raiseEvent(self, event)

        local actionEvent = spec.actionEvents[InputAction.MS_ACTIVATE_PUMP]
        if actionEvent ~= nil then
            local key = pumpIsRunning and "action_deactivatePump" or "action_activatePump"
            g_inputBinding:setActionEventText(actionEvent.actionEventId, g_i18n:getText(key):format(self.typeDesc))
        end
    end
end

---@return boolean
function ManureSystemPumpMotor:isPumpRunning()
    return self.spec_manureSystemPumpMotor.pumpIsRunning
end

---@return boolean
function ManureSystemPumpMotor:canTurnOnPump()
    if self.getIsMotorStarted ~= nil then
        return self:getIsMotorStarted()
    end

    local rootAttacherVehicle = self:getRootVehicle()
    if rootAttacherVehicle ~= self then
        if rootAttacherVehicle.getIsMotorStarted ~= nil then
            return rootAttacherVehicle:getIsMotorStarted()
        end
    end

    return true
end

---Checks if we allow pumping on server and we show the warning to the client.
---@return void
function ManureSystemPumpMotor:checkPumpNotAllowedWarning(warningId)
    if self.isServer then
        local warning = self:getTurnOnPumpNotAllowedWarning()
        if warning ~= nil then
            --Broadcast warning to other clients
            g_server:broadcastEvent(ManureSystemPumpIsAllowedEvent.new(self, warning), nil, nil, self)
        end
    else
        if warningId ~= nil then
            if self:getIsActiveForInput(true) then
                local spec = self.spec_manureSystemPumpMotor
                g_currentMission:showBlinkingWarning(spec.warningMessage.messages[warningId])
            end
        end
    end
end

---Prints debug information of the source/target object, if pumping is not allowed.
---@return void
local function debugPumpNotAllowedWarning(self, message, sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
    if g_currentMission.manureSystem.debug then
        Logging.warning("Pumping is not allowed. Reason: %s", message)

        local sourceObjectName = sourceObject ~= nil and sourceObject:getName() or nil
        local sourceFillTypeIndex = sourceObject ~= nil and sourceObject:getFillUnitFillType(sourceFillUnitIndex) or FillType.UNKNOWN
        local sourceFillLevel = sourceObject ~= nil and sourceObject:getFillUnitFillLevel(sourceFillUnitIndex) or 0
        local sourceCapacity = sourceObject ~= nil and sourceObject:getFillUnitCapacity(sourceFillUnitIndex) or 0
        local sourceSupportedFillTypes = sourceObject ~= nil and sourceObject:getFillUnitSupportedFillTypes(sourceFillUnitIndex)

        local targetObjectName = nil
        local targetFillTypeIndex = FillType.UNKNOWN
        local targetFillLevel = 0
        local targetCapacity = 0
        local targetSupportedFillTypes = nil
        local targetAllowsFillType = false

        if self.spec_manureSystemPumpMotor.sourceIsWater then
            targetObjectName = "Water plane"
            targetFillTypeIndex = FillType.WATER
            targetFillLevel = math.huge
            targetCapacity = math.huge
            targetSupportedFillTypes = {[FillType.WATER] = true}
            targetAllowsFillType = true
        elseif targetObject ~= nil then
            targetObjectName = targetObject:getName()
            targetFillTypeIndex = targetObject:getFillUnitFillType(targetFillUnitIndex)
            targetFillLevel = targetObject:getFillUnitFillLevel(targetFillUnitIndex)
            targetCapacity = targetObject:getFillUnitCapacity(targetFillUnitIndex)
            targetSupportedFillTypes = targetObject:getFillUnitSupportedFillTypes(targetFillUnitIndex)
            targetAllowsFillType = targetObject:getFillUnitAllowsFillType(targetFillUnitIndex, sourceFillTypeIndex)
        end

        local sourceAllowsFillType = sourceObject ~= nil and sourceObject:getFillUnitAllowsFillType(sourceFillUnitIndex, targetFillTypeIndex) or false

        local sourceSupportedFillTypesStr = ""
        if sourceSupportedFillTypes ~= nil then
            local i = 0

            for fillTypeIndex, _ in pairs(sourceSupportedFillTypes) do
                if i > 0 then
                    sourceSupportedFillTypesStr = sourceSupportedFillTypesStr .. ", "
                end

                sourceSupportedFillTypesStr = sourceSupportedFillTypesStr .. g_fillTypeManager:getFillTypeNameByIndex(fillTypeIndex)

                i = i + 1
            end
        end

        local targetSupportedFillTypesStr = ""
        if targetSupportedFillTypes ~= nil then
            local i = 0

            for fillTypeIndex, _ in pairs(targetSupportedFillTypes) do
                if i > 0 then
                    targetSupportedFillTypesStr = targetSupportedFillTypesStr .. ", "
                end

                targetSupportedFillTypesStr = targetSupportedFillTypesStr .. g_fillTypeManager:getFillTypeNameByIndex(fillTypeIndex)

                i = i + 1
            end
        end

        Logging.info(" sourceObject (sourceFillUnitIndex: %s)", tostring(sourceFillUnitIndex))
        log(("        name: %s"):format(tostring(sourceObjectName)))
        log(("        fillType: %s (allowed: %s)"):format(tostring(g_fillTypeManager:getFillTypeNameByIndex(sourceFillTypeIndex)), tostring(sourceAllowsFillType)))
        log(("            supportedFillTypes: %s"):format(sourceSupportedFillTypesStr))
        log(("        fillLevel: %s (capacity: %s)"):format(sourceFillLevel, sourceCapacity))

        Logging.info(" targetObject (targetFillUnitIndex: %s)", tostring(targetFillUnitIndex))
        log(("        name: %s"):format(tostring(targetObjectName)))
        log(("        fillType: %s (allowed: %s)"):format(tostring(g_fillTypeManager:getFillTypeNameByIndex(targetFillTypeIndex)), tostring(targetAllowsFillType)))
        log(("            supportedFillTypes: %s"):format(targetSupportedFillTypesStr))
        log(("        fillLevel: %s (capacity: %s)"):format(targetFillLevel, targetCapacity))
    end
end

---Checks if we allow pumping.
---@return number|nil
function ManureSystemPumpMotor:getTurnOnPumpNotAllowedWarning()
    local spec = self.spec_manureSystemPumpMotor
    local targetObject, targetFillUnitIndex = self:getPumpTargetObject()
    if targetObject ~= nil or spec.sourceIsWater then
        local sourceObject, sourceFillUnitIndex = self:getPumpSourceObjectOrSelf()

        if sourceObject ~= nil then
            if self:isPumpingIn() then
                local targetFillType = spec.sourceIsWater and FillType.WATER or targetObject:getFillUnitFillType(targetFillUnitIndex)
                if targetFillType ~= FillType.UNKNOWN and not sourceObject:getFillUnitAllowsFillType(sourceFillUnitIndex, targetFillType) then
                    debugPumpNotAllowedWarning(self, "Source object does not allow the target object fill type.", sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
                    return ManureSystemPumpMotor.WARNING_INVALID_FILL_TYPE -- source does not allow the target fill type
                end
                if not spec.sourceIsWater then
                    local targetFillLevel = targetObject:getFillUnitFillLevel(targetFillUnitIndex)
                    if not (targetFillLevel > 0) then
                        debugPumpNotAllowedWarning(self, "Target object is empty.", sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
                        return ManureSystemPumpMotor.WARNING_EMPTY -- empty target
                    end
                end
            elseif self:isPumpingOut() then
                local sourceFillLevel = sourceObject:getFillUnitFillLevel(sourceFillUnitIndex)
                if not (sourceFillLevel > 0) then
                    debugPumpNotAllowedWarning(self, "Source object is empty.", sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
                    return ManureSystemPumpMotor.WARNING_EMPTY -- empty source
                end

                if not spec.sourceIsWater then
                    local sourceFillType = sourceObject:getFillUnitFillType(sourceFillUnitIndex)
                    if sourceFillType ~= FillType.UNKNOWN and not targetObject:getFillUnitAllowsFillType(targetFillUnitIndex, sourceFillType) then
                        debugPumpNotAllowedWarning(self, "Target object does not allow the source object fill type.", sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
                        return ManureSystemPumpMotor.WARNING_INVALID_FILL_TYPE -- invalid source fill type
                    end

                    local targetObjectFillLevel = targetObject:getFillUnitFillLevel(targetFillUnitIndex)
                    if targetObjectFillLevel >= (targetObject:getFillUnitCapacity(targetFillUnitIndex)) then
                        debugPumpNotAllowedWarning(self, "Target object is full.", sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex)
                        return ManureSystemPumpMotor.WARNING_FULL -- full target
                    end
                end
            end
        end
    end

    return nil
end

---@return number
function ManureSystemPumpMotor:getPumpLoadPercentage()
    if self:isPumpRunning() then
        return self.spec_manureSystemPumpMotor.pumpEfficiency.currentLoad
    end

    return 0
end

---Sets the current pump mode to use
---@return void
function ManureSystemPumpMotor:setPumpMode(mode, noEventSend)
    local spec = self.spec_manureSystemPumpMotor

    if mode ~= spec.pumpMode then
        ManureSystemPumpModeEvent.sendEvent(self, mode, noEventSend)
        spec.pumpMode = mode
    end
end

---Returns the current pump mode.
---@return number
function ManureSystemPumpMotor:getPumpMode()
    return self.spec_manureSystemPumpMotor.pumpMode
end

---Allows for overwriting pump limitations.
---@return boolean
function ManureSystemPumpMotor:canChangePumpDirection()
    return true
end

---@return void
function ManureSystemPumpMotor:setPumpDirection(pumpDirection, noEventSend)
    local spec = self.spec_manureSystemPumpMotor

    if pumpDirection ~= spec.pumpDirection then
        ManureSystemPumpDirectionEvent.sendEvent(self, pumpDirection, noEventSend)

        spec.pumpDirection = pumpDirection

        local actionEvent = spec.actionEvents[InputAction.MS_TOGGLE_PUMP_DIRECTION]
        if actionEvent ~= nil then
            local key = self:isPumpingIn() and "action_directionOut" or "action_directionIn"
            if self:isStandalonePump() and spec.useStandalonePumpText then
                key = self:isPumpingIn() and "action_directionLeftRight" or "action_directionRightLeft"
            end

            g_inputBinding:setActionEventText(actionEvent.actionEventId, g_i18n:getText(key))
        end
    end
end

---@return number
function ManureSystemPumpMotor:getPumpDirection()
    return self.spec_manureSystemPumpMotor.pumpDirection
end

---@return boolean
function ManureSystemPumpMotor:isPumpingIn()
    return self.spec_manureSystemPumpMotor.pumpDirection == ManureSystemPumpMotor.PUMP_DIRECTION_IN
end

---@return boolean
function ManureSystemPumpMotor:isPumpingOut()
    return self.spec_manureSystemPumpMotor.pumpDirection == ManureSystemPumpMotor.PUMP_DIRECTION_OUT
end

---@return void
function ManureSystemPumpMotor:handlePump(dt)
    if not self.isServer then
        return
    end

    if not self:isPumpRunning() then
        return
    end

    local spec = self.spec_manureSystemPumpMotor
    local targetObject, targetFillUnitIndex = self:getPumpTargetObject()
    if targetObject ~= nil then
        local sourceObject, sourceFillUnitIndex = self:getPumpSourceObjectOrSelf()

        if sourceObject ~= nil then
            if self:isPumpingIn() then
                if sourceObject:getFillUnitFreeCapacity(sourceFillUnitIndex) > 0 then
                    local targetFillType = targetObject:getFillUnitFillType(targetFillUnitIndex)

                    if sourceObject:getFillUnitAllowsFillType(sourceFillUnitIndex, targetFillType) then
                        local targetFillLevel = targetObject:getFillUnitFillLevel(targetFillUnitIndex)

                        if targetFillLevel > 0 then
                            if spec.pumpEfficiency.currentLoad > 0 then
                                local deltaFillLevel = math.min((spec.pumpEfficiency.litersPerSecond * spec.pumpEfficiency.currentLoad) * 0.001 * dt, targetFillLevel)
                                self:runPump(sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex, targetFillType, deltaFillLevel)
                            end
                        else
                            self:setIsPumpRunning(false) -- empty target
                        end
                    else
                        self:setIsPumpRunning(false) -- invalid
                    end
                else
                    self:setIsPumpRunning(false) -- full self
                end
            elseif self:isPumpingOut() then
                local sourceFillLevel = sourceObject:getFillUnitFillLevel(sourceFillUnitIndex)
                if sourceFillLevel > 0 then
                    local sourceFillType = sourceObject:getFillUnitFillType(sourceFillUnitIndex)

                    if targetObject:getFillUnitAllowsFillType(targetFillUnitIndex, sourceFillType) then
                        if spec.pumpEfficiency.currentLoad > 0 then
                            local deltaFillLevel = math.min((spec.pumpEfficiency.litersPerSecond * spec.pumpEfficiency.currentLoad) * 0.001 * dt, sourceFillLevel)
                            self:runPump(sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex, sourceFillType, deltaFillLevel)
                        end
                    else
                        self:setIsPumpRunning(false) -- invalid
                    end
                else
                    self:setIsPumpRunning(false) -- empty self
                end
            end
        end
    elseif spec.sourceIsWater then
        local sourceObject, sourceFillUnitIndex = self:getPumpSourceObjectOrSelf()

        if sourceObject ~= nil then
            if sourceObject:getFillUnitAllowsFillType(sourceFillUnitIndex, FillType.WATER) then
                if sourceObject:getFillUnitFreeCapacity(sourceFillUnitIndex) > 0 then
                    if spec.pumpEfficiency.currentLoad > 0 then
                        local delta = (spec.pumpEfficiency.litersPerSecond * spec.pumpEfficiency.currentLoad) * 0.001 * dt
                        sourceObject:addFillUnitFillLevel(sourceObject:getOwnerFarmId(), sourceFillUnitIndex, delta * self:getPumpDirection(), FillType.WATER, ToolType.UNDEFINED, nil)
                    end
                else
                    self:setIsPumpRunning(false) -- full self
                end
            else
                self:setIsPumpRunning(false) -- invalid
            end
        end
    end
end

---@return void
function ManureSystemPumpMotor:runPump(sourceObject, sourceFillUnitIndex, targetObject, targetFillUnitIndex, fillType, deltaFill)
    if deltaFill <= 0 then
        return
    end

    deltaFill = deltaFill * self:getPumpDirection()

    local movedFill = targetObject:addFillUnitFillLevel(sourceObject:getOwnerFarmId(), targetFillUnitIndex, -deltaFill, fillType, ToolType.UNDEFINED, nil)

    local difference = math.abs(-deltaFill - movedFill)
    if difference > 0.01 then
        local orgMaxTime = self:getOriginalPumpMaxTime()
        local impactTime = orgMaxTime + orgMaxTime * 0.25 * difference
        self:setPumpMaxTime(impactTime)
    end

    if movedFill ~= 0 then
        sourceObject:addFillUnitFillLevel(sourceObject:getOwnerFarmId(), sourceFillUnitIndex, -movedFill, fillType, ToolType.UNDEFINED, nil)
    else
        local spec = self.spec_manureSystemPumpMotor
        spec.pumpHasContact = false
    end

    if self:isPumpingOut() then
        local targetObjectFillLevel = targetObject:getFillUnitFillLevel(targetFillUnitIndex)

        if targetObjectFillLevel >= (targetObject:getFillUnitCapacity(targetFillUnitIndex)) then
            self:setIsPumpRunning(false) -- full target
        end
    end
end

---@return boolean
function ManureSystemPumpMotor:isStandalonePump()
    return self.spec_manureSystemPumpMotor.isStandalone
end

---Returns true when the target object is valid, false otherwise.
---@return boolean
function ManureSystemPumpMotor:isPumpTargetObjectValid()
    local spec = self.spec_manureSystemPumpMotor

    if spec.sourceIsWater then
        return true
    end

    local object = spec.targetObject
    if object ~= nil then
        -- When the target is a standalone pump we don't allow.
        if object.isStandalonePump ~= nil and object:isStandalonePump() then
            return false
        end

        return true
    end

    return false
end

---@return void
function ManureSystemPumpMotor:setPumpTargetObject(object, fillUnitIndex)
    self.spec_manureSystemPumpMotor.targetObject = object
    self.spec_manureSystemPumpMotor.targetFillUnitIndex = fillUnitIndex
end

---@return table, number
function ManureSystemPumpMotor:getPumpTargetObject()
    return self.spec_manureSystemPumpMotor.targetObject, self.spec_manureSystemPumpMotor.targetFillUnitIndex
end

---@return void
function ManureSystemPumpMotor:setPumpSourceObject(object, fillUnitIndex)
    self.spec_manureSystemPumpMotor.sourceObject = object
    self.spec_manureSystemPumpMotor.sourceFillUnitIndex = fillUnitIndex
end

---@return table, number
function ManureSystemPumpMotor:getPumpSourceObject()
    return self.spec_manureSystemPumpMotor.sourceObject, self.spec_manureSystemPumpMotor.sourceFillUnitIndex
end

---Get the source object, else default on ourselves when we have the FillUnit spec.
---@return table, number
function ManureSystemPumpMotor:getPumpSourceObjectOrSelf()
    local object, fillUnitIndex = self:getPumpSourceObject()

    --When the current source object isn't set, we use ourselves as source when we have the FillUnit specialization.
    if object == nil and SpecializationUtil.hasSpecialization(FillUnit, self.specializations) then
        return self, self.spec_manureSystemPumpMotor.fillUnitIndex
    end

    return object, fillUnitIndex
end

---@return void
function ManureSystemPumpMotor:setIsPumpSourceWater(isWater)
    self.spec_manureSystemPumpMotor.sourceIsWater = isWater
end

---@return boolean
function ManureSystemPumpMotor:getIsPumpSourceWater()
    return self.spec_manureSystemPumpMotor.sourceIsWater
end

---@return table, number
function ManureSystemPumpMotor.getAttachedPumpSourceObject(object, fillType, rootObject)
    if fillType == nil or object == nil then
        return nil
    end

    if rootObject == nil then
        rootObject = object
    end

    if object ~= rootObject and SpecializationUtil.hasSpecialization(FillUnit, object.specializations) then
        local fillUnits = object:getFillUnits()

        if fillType == FillType.UNKNOWN then
            if rootObject.getPumpTargetObject ~= nil then
                local targetObject, targetFillUnitIndex = rootObject:getPumpTargetObject()
                if targetObject ~= nil then
                    for fillUnitIndex, _ in ipairs(fillUnits) do
                        if object:getFillUnitFillLevel(fillUnitIndex) > 0 then
                            local fillTypeIndex = object:getFillUnitFillType(fillUnitIndex)
                            if targetObject:getFillUnitAllowsFillType(targetFillUnitIndex, fillTypeIndex) then
                                return object, fillUnitIndex
                            end
                        end
                    end
                end
            end
        else
            for fillUnitIndex, _ in ipairs(fillUnits) do
                if object:getFillUnitAllowsFillType(fillUnitIndex, fillType) then
                    return object, fillUnitIndex
                end
            end
        end
    end

    local attachedImplements = object:getAttachedImplements()
    if attachedImplements ~= nil then
        for _, implement in ipairs(attachedImplements) do
            if implement.object ~= nil and implement.object ~= object then
                local implementFound, fillUnitIndexFound = ManureSystemPumpMotor.getAttachedPumpSourceObject(implement.object, fillType, rootObject)

                if implementFound ~= nil then
                    return implementFound, fillUnitIndexFound
                end
            end
        end
    end

    return nil, nil
end

---@return number
function ManureSystemPumpMotor:getOriginalPumpMaxTime()
    return self.spec_manureSystemPumpMotor.pumpEfficiency.orgMaxTime
end

---@return void
function ManureSystemPumpMotor:setPumpMaxTime(maxTime)
    self.spec_manureSystemPumpMotor.pumpEfficiency.maxTime = maxTime
end

---@return number
function ManureSystemPumpMotor:getPumpMaxTime()
    return self.spec_manureSystemPumpMotor.pumpEfficiency.maxTime
end

---@return boolean
function ManureSystemPumpMotor:getCanDisableVanillaUnloading(sourceObject, trigger)
    if self:getIsAIActive() then
        return false
    end

    return true
end

---@return boolean
function ManureSystemPumpMotor:getCanDisableVanillaLoading(targetObject, trigger)
    if self:getIsAIActive() then
        return false
    end

    return true
end

----------------
-- Overwrites --
----------------

---@return boolean
function ManureSystemPumpMotor:getDoConsumePtoPower(superFunc)
    return self:isPumpRunning() or superFunc(self)
end

---@return boolean
function ManureSystemPumpMotor:getRequiresPower(superFunc)
    return self:isPumpRunning() or superFunc(self)
end

---@return boolean
function ManureSystemPumpMotor:getIsPowerTakeOffActive(superFunc)
    return self:isPumpRunning() or superFunc(self)
end

---@return boolean
function ManureSystemPumpMotor:getIsOperating(superFunc)
    return self:isPumpRunning() or superFunc(self)
end

---@return boolean
function ManureSystemPumpMotor:getUseTurnedOnSchema(superFunc)
    return self:isPumpRunning() or superFunc(self)
end

--Todo: check for remove
---@return boolean
function ManureSystemPumpMotor:getCanBeTurnedOn(superFunc)
    if self:isPumpRunning() then
        return false
    end

    return superFunc(self)
end

--Todo: check for remove
---@return boolean
function ManureSystemPumpMotor:getCanToggleTurnedOn(superFunc)
    if self:isPumpRunning() then
        return false
    end

    if self:isStandalonePump() then
        return false
    end

    return superFunc(self)
end

---@return boolean
function ManureSystemPumpMotor:getIsWorkAreaActive(superFunc, workArea)
    if self:isPumpRunning() then
        return false
    end

    return superFunc(self, workArea)
end

---@return boolean
function ManureSystemPumpMotor:getIsFillUnitActive(superFunc, fillUnitIndex)
    -- We don't allow spraying water as fertilizer.
    if self:getFillUnitFillType(fillUnitIndex) == FillType.WATER then
        return false
    end

    return superFunc(self, fillUnitIndex)
end

---@return number, number
function ManureSystemPumpMotor:getConsumingLoad(superFunc)
    local value, count = superFunc(self)

    local spec = self.spec_manureSystemPumpMotor
    if not spec.isActive then
        return value, count
    end
    local load = spec.pumpEfficiency.currentLoad
    return value + load, count + 1
end

---@return void
function ManureSystemPumpMotor:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection)
    if self.isClient then
        local spec = self.spec_manureSystemPumpMotor

        self:clearActionEventsTable(spec.actionEvents)

        if isActiveForInput then
            local _, actionEventIdTogglePump = self:addActionEvent(spec.actionEvents, InputAction.MS_ACTIVATE_PUMP, self, ManureSystemPumpMotor.actionEventTogglePump, false, true, false, true, nil, nil, true)
            local _, actionEventIdTogglePumpDirection = self:addActionEvent(spec.actionEvents, InputAction.MS_TOGGLE_PUMP_DIRECTION, self, ManureSystemPumpMotor.actionEventTogglePumpDirection, false, true, false, true, nil, nil, true)

            local pumpKey = self:isPumpRunning() and "action_deactivatePump" or "action_activatePump"
            g_inputBinding:setActionEventText(actionEventIdTogglePump, g_i18n:getText(pumpKey):format(self.typeDesc))
            g_inputBinding:setActionEventTextVisibility(actionEventIdTogglePump, true)
            g_inputBinding:setActionEventTextPriority(actionEventIdTogglePump, GS_PRIO_HIGH)

            local directionKey = self:isPumpingIn() and "action_directionOut" or "action_directionIn"
            if self:isStandalonePump() and spec.useStandalonePumpText then
                directionKey = self:isPumpingIn() and "action_directionLeftRight" or "action_directionRightLeft"
            end

            g_inputBinding:setActionEventText(actionEventIdTogglePumpDirection, g_i18n:getText(directionKey))
            g_inputBinding:setActionEventTextVisibility(actionEventIdTogglePumpDirection, true)
            g_inputBinding:setActionEventTextPriority(actionEventIdTogglePumpDirection, GS_PRIO_NORMAL)
        end
    end
end

---@return void
function ManureSystemPumpMotor.actionEventTogglePump(self, actionName, inputValue, callbackState, isAnalog)
    local spec = self.spec_manureSystemPumpMotor
    local canTurnOnPump = self:canTurnOnPump()
    local allowAction = canTurnOnPump
    if not spec.pumpIsRunning then
        allowAction = allowAction and spec.hasTargetObject
    else
        allowAction = allowAction and spec.pumpIsRunning
    end

    if allowAction then
        if self.isServer then
            local warning = self:getTurnOnPumpNotAllowedWarning()
            if warning ~= nil then
                g_currentMission:showBlinkingWarning(spec.warningMessage.messages[warning])
            end
        else
            g_client:getServerConnection():sendEvent(ManureSystemPumpIsAllowedEvent.new(self))
        end

        self:setIsPumpRunning(not spec.pumpIsRunning)
    else
        --When motor is started but we miss target we raise event to show possible warning messages.
        if canTurnOnPump then
            SpecializationUtil.raiseEvent(self, "onPumpInvalid")
        end
    end
end

---@return void
function ManureSystemPumpMotor.actionEventTogglePumpDirection(self, actionName, inputValue, callbackState, isAnalog)
    if not self:isPumpRunning() then
        if self:canChangePumpDirection() then
            local spec = self.spec_manureSystemPumpMotor
            self:setPumpDirection(-spec.pumpDirection)
        else
            local limitedText = self:isPumpingIn() and g_i18n:getText("info_directionIn") or g_i18n:getText("info_directionOut")
            g_currentMission:showBlinkingWarning(g_i18n:getText("warning_pumpDirectionLimited"):format(limitedText), 2000)
        end
    end
end

g_soundManager:registerModifierType("PUMP_LOAD", ManureSystemPumpMotor.getPumpLoadPercentage)
