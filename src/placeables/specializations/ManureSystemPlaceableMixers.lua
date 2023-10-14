-- ManureSystemPlaceableMixers
--
-- Author: Stijn Wopereis
-- Description: Mixer implementation for placeables
-- Name: ManureSystemPlaceableMixers
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableMixers
ManureSystemPlaceableMixers = {}
ManureSystemPlaceableMixers.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableMixers.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(ManureSystemPlaceableFillArmReceiver, specializations)
end

---@return void
function ManureSystemPlaceableMixers.registerFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "loadMixer", ManureSystemPlaceableMixers.loadMixer)
    SpecializationUtil.registerFunction(placeableType, "unloadMixer", ManureSystemPlaceableMixers.unloadMixer)
    SpecializationUtil.registerFunction(placeableType, "setIsMixerTurnedOn", ManureSystemPlaceableMixers.setIsMixerTurnedOn)
    SpecializationUtil.registerFunction(placeableType, "getIsMixerTurnedOn", ManureSystemPlaceableMixers.getIsMixerTurnedOn)
    SpecializationUtil.registerFunction(placeableType, "getCanToggleMixerTurnedOn", ManureSystemPlaceableMixers.getCanToggleMixerTurnedOn)
    SpecializationUtil.registerFunction(placeableType, "mixerInteractionTriggerCallback", ManureSystemPlaceableMixers.mixerInteractionTriggerCallback)
end

---@return void
function ManureSystemPlaceableMixers.registerOverwrittenFunctions(placeableType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "getIsThicknessEnabled", ManureSystemPlaceableMixers.getIsThicknessEnabled)
end

---@return void
function ManureSystemPlaceableMixers.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onLoadFinished", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onReadStream", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onWriteStream", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onFinalizePlacement", ManureSystemPlaceableMixers)
    SpecializationUtil.registerEventListener(placeableType, "onUpdateTick", ManureSystemPlaceableMixers)
end

---@return void
function ManureSystemPlaceableMixers.registerXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableMixers")
    ManureSystemPlaceableMixers.registerMixerXMLPaths(schema, basePath .. ".manureSystemMixers.mixer(?)")
    schema:setXMLSpecializationType()
end

---@return void
function ManureSystemPlaceableMixers.registerMixerXMLPaths(schema, basePath)
    schema:register(XMLValueType.INT, basePath .. "#manureSystemStorageIndex", "Index of manure system storage where the mixer belongs to", 1)
    schema:register(XMLValueType.STRING, basePath .. "#fillTypeCategories", "Supported fill type categories", "SLURRYTANK")
    schema:register(XMLValueType.STRING, basePath .. "#fillTypes", "Supported fill types")
    schema:register(XMLValueType.FLOAT, basePath .. "#mixPerSecond", "Mixed amount per second", 500)
    schema:register(XMLValueType.BOOL, basePath .. "#isDefaultTurnedOn", "Mixer is turned on by default", "True, if there is no valid interaction trigger, false otherwise")
    schema:register(XMLValueType.NODE_INDEX, basePath .. "#interactionTriggerNode", "Interaction trigger node")
    EffectManager.registerEffectXMLPaths(schema, basePath .. ".effects")
    AnimationManager.registerAnimationNodesXMLPaths(schema, basePath .. ".animationNodes")
    schema:register(XMLValueType.NODE_INDEX, basePath .. ".animations.animation(?)#rootNode", "Node which has the animation clip assigned")
    schema:register(XMLValueType.STRING, basePath .. ".animations.animation(?)#clipName", "Animation clip name")
    schema:register(XMLValueType.BOOL, basePath .. ".animations.animation(?)#loopState", "Animation clip loop state", true)
    schema:register(XMLValueType.FLOAT, basePath .. ".animations.animation(?)#speedScale", "Animation clip speed scale", 1)
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "start(?)")
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "stop(?)")
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "work(?)")
end

---@return void
function ManureSystemPlaceableMixers.registerSavegameXMLPaths(schema, basePath)
    schema:register(XMLValueType.INT, basePath .. ".mixer(?)#index", "Mixer index")
    schema:register(XMLValueType.BOOL, basePath .. ".mixer(?)#isTurnedOn", "Mixer is turned on")
end

---@return void
function ManureSystemPlaceableMixers:onPreLoad(savegame)
    self.spec_manureSystemPlaceableMixers = self[("spec_%s.manureSystemPlaceableMixers"):format(ManureSystemPlaceableMixers.MOD_NAME)]
end

---@return void
function ManureSystemPlaceableMixers:onLoad(savegame)
    local spec = self.spec_manureSystemPlaceableMixers

    spec.isActive = self.xmlFile:getBool("placeable.manureSystem#hasMixers", false)

    spec.mixers = {}
    spec.activatableByTriggerId = {}

    if spec.isActive then
        local maxNumMixers = 2 ^ ManureSystemMixerTurnedOnEvent.SEND_NUM_BITS - 1

        self.xmlFile:iterate("placeable.manureSystemMixers.mixer", function(_, mixerKey)
            if #spec.mixers >= maxNumMixers then
                Logging.xmlError(self.xmlFile, "Too many mixers defined. Max. amount is '%d'!", maxNumMixers)
                return false
            end

            local mixer = {}
            mixer.xmlKey = mixerKey

            if self:loadMixer(self.xmlFile, mixerKey, mixer) then
                table.insert(spec.mixers, mixer)
            end
        end)
    end
end

---@return void
function ManureSystemPlaceableMixers:onLoadFinished(savegame)
    local spec = self.spec_manureSystemPlaceableMixers

    for i = #spec.mixers, 1, -1 do
        local mixer = spec.mixers[i]

        local isValid = true

        local storage = self:getManureSystemStorageByIndex(mixer.manureSystemStorageIndex)
        if storage ~= nil then
            local hasValidFillType = false

            for _, fillTypeIndex in ipairs(mixer.fillTypes) do
                if storage:getIsFillTypeSupported(fillTypeIndex) then
                    hasValidFillType = true
                    break
                end
            end

            if not hasValidFillType then
                Logging.xmlWarning(self.xmlFile, "Manure system storage with index '%d' does not support fill types for mixer '%s'. Ignoring mixer!", mixer.manureSystemStorageIndex, mixer.xmlKey)
                isValid = false
            end
        else
            Logging.xmlWarning(self.xmlFile, "Manure system storage with index '%d' does not exist for mixer '%s'. Ignoring mixer!", mixer.manureSystemStorageIndex, mixer.xmlKey)
            isValid = false
        end

        if not isValid then
            self:unloadMixer(mixer)
            table.remove(spec.mixers, i)
        end
    end

    if #spec.mixers > 0 then
        for i, mixer in ipairs(spec.mixers) do
            if mixer.interactionTriggerNode ~= nil then
                mixer.activatable = ManureSystemMixerActivatable.new(self, i)

                if mixer.activatable ~= nil then
                    spec.activatableByTriggerId[mixer.interactionTriggerNode] = mixer.activatable
                else
                    mixer.isDefaultTurnedOn = true
                end
            else
                mixer.isDefaultTurnedOn = true
            end
        end
    else
        spec.isActive = false
    end

    if next(spec.activatableByTriggerId) == nil then
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemPlaceableMixers)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemPlaceableMixers)
    end

    if not spec.isActive then
        SpecializationUtil.removeEventListener(self, "onFinalizePlacement", ManureSystemPlaceableMixers)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemPlaceableMixers)
    end
end

---@return void
function ManureSystemPlaceableMixers:onDelete()
    for _, mixer in ipairs(self.spec_manureSystemPlaceableMixers.mixers) do
        self:unloadMixer(mixer)
    end
end

---@return void
function ManureSystemPlaceableMixers:loadFromXMLFile(xmlFile, key)
    xmlFile:iterate(key .. ".mixer", function(_, mixerKey)
        local index = xmlFile:getValue(mixerKey .. "#index")
        local isTurnedOn = xmlFile:getValue(mixerKey .. "#isTurnedOn")

        if index ~= nil and isTurnedOn ~= nil then
            local mixer = self.spec_manureSystemPlaceableMixers.mixers[index]
            if mixer ~= nil then
                mixer.isDefaultTurnedOn = isTurnedOn
            end
        end
    end)
end

---@return void
function ManureSystemPlaceableMixers:saveToXMLFile(xmlFile, key, usedModNames)
    local spec = self.spec_manureSystemPlaceableMixers

    if next(spec.activatableByTriggerId) ~= nil then
        local i = 0

        for j, mixer in ipairs(spec.mixers) do
            if spec.activatableByTriggerId[mixer.interactionTriggerNode] ~= nil then
                local mixerKey = ("%s.mixer(%d)"):format(key, i)

                xmlFile:setValue(mixerKey .. "#index", j)

                local isTurnedOn = self:getIsMixerTurnedOn(j)
                xmlFile:setValue(mixerKey .. "#isTurnedOn", isTurnedOn)

                i = i + 1
            end
        end
    end
end

---@return void
function ManureSystemPlaceableMixers:onReadStream(streamId, connection)
    local spec = self.spec_manureSystemPlaceableMixers

    for i, mixer in ipairs(spec.mixers) do
        if spec.activatableByTriggerId[mixer.interactionTriggerNode] ~= nil then
            local isTurnedOn = streamReadBool(streamId)
            self:setIsMixerTurnedOn(i, isTurnedOn, true)
        end
    end
end

---@return void
function ManureSystemPlaceableMixers:onWriteStream(streamId, connection)
    local spec = self.spec_manureSystemPlaceableMixers

    for i, mixer in ipairs(spec.mixers) do
        if spec.activatableByTriggerId[mixer.interactionTriggerNode] ~= nil then
            local isTurnedOn = self:getIsMixerTurnedOn(i)
            streamWriteBool(streamId, isTurnedOn)
        end
    end
end

---@return void
function ManureSystemPlaceableMixers:onFinalizePlacement()
    for i, mixer in ipairs(self.spec_manureSystemPlaceableMixers.mixers) do
        if mixer.isDefaultTurnedOn then
            self:setIsMixerTurnedOn(i, true, true)
        end
    end
end

---@return void
function ManureSystemPlaceableMixers:onUpdateTick(dt)
    if self.isServer then
        for i, mixer in ipairs(self.spec_manureSystemPlaceableMixers.mixers) do
            local isTurnedOn = self:getIsMixerTurnedOn(i)
            if isTurnedOn then
                local storage = self:getManureSystemStorageByIndex(mixer.manureSystemStorageIndex)

                local effectFillTypeIndex = FillType.UNKNOWN

                for _, fillTypeIndex in ipairs(mixer.fillTypes) do
                    local fillLevel = storage:getFillLevel(fillTypeIndex)
                    if fillLevel > 0 then
                        self:decreaseThickness(storage.index, fillTypeIndex, mixer.mixPerSecond)
                        effectFillTypeIndex = fillTypeIndex
                        break
                    end
                end

                if self.isClient then
                    if effectFillTypeIndex ~= FillType.UNKNOWN then
                        g_effectManager:setFillType(mixer.effects, effectFillTypeIndex)
                        g_effectManager:startEffects(mixer.effects)
                    else
                        g_effectManager:stopEffects(mixer.effects)
                    end
                end

                self:raiseActive()
            end
        end
    end
end

---@return boolean
function ManureSystemPlaceableMixers:loadMixer(xmlFile, baseKey, mixer)
    mixer.manureSystemStorageIndex = xmlFile:getValue(baseKey .. "#manureSystemStorageIndex", 1)

    mixer.fillTypes = g_fillTypeManager:getFillTypesFromXML(xmlFile, baseKey .. "#fillTypeCategories", baseKey .. "#fillTypes", false)
    if #mixer.fillTypes == 0 then
        mixer.fillTypes = g_fillTypeManager:getFillTypesByCategoryNames("SLURRYTANK")
    end

    mixer.mixPerSecond = xmlFile:getValue(baseKey .. "#mixPerSecond", 500)

    mixer.isTurnedOn = false
    mixer.isDefaultTurnedOn = xmlFile:getValue(baseKey .. "#isDefaultTurnedOn", false)

    local interactionTriggerNode = xmlFile:getValue(baseKey .. "#interactionTriggerNode", nil, self.components, self.i3dMappings)
    if interactionTriggerNode ~= nil then
        if CollisionFlag.getHasFlagSet(interactionTriggerNode, CollisionFlag.TRIGGER_PLAYER) then
            mixer.interactionTriggerNode = interactionTriggerNode
            addTrigger(mixer.interactionTriggerNode, "mixerInteractionTriggerCallback", self)
        else
            Logging.xmlWarning(xmlFile, "Mixer trigger '%s' does not have the 'TRIGGER_PLAYER' bit (%s) set.", baseKey .. "#interactionTriggerNode", CollisionFlag.getBit(CollisionFlag.TRIGGER_PLAYER))
        end
    end

    if self.isClient then
        mixer.effects = g_effectManager:loadEffect(xmlFile, baseKey .. ".effects", self.components, self, self.i3dMappings)

        mixer.animationNodes = g_animationManager:loadAnimations(xmlFile, baseKey .. ".animationNodes", self.components, self, self.i3dMappings)

        mixer.animations = {}

        xmlFile:iterate(baseKey .. ".animations.animation", function(_, animationKey)
            local rootNode = xmlFile:getValue(animationKey .. "#rootNode", nil, self.components, self.i3dMappings)
            local clipName = xmlFile:getValue(animationKey .. "#clipName")

            if rootNode ~= nil and clipName ~= nil and clipName ~= "" then
                local animation = {}

                animation.characterSetId = getAnimCharacterSet(rootNode)
                animation.trackId = 0
                animation.clipIndex = getAnimClipIndex(animation.characterSetId, clipName)

                animation.loopState = xmlFile:getValue(animationKey .. "#loopState", true)
                animation.speedScale = xmlFile:getValue(animationKey .. "#speedScale", 1)

                if animation.clipIndex >= 0 then
                    local clipIndex = getAnimTrackAssignedClip(animation.characterSetId, animation.trackId)
                    if animation.clipIndex ~= clipIndex then
                        clearAnimTrackClip(animation.characterSetId, animation.trackId)
                    end

                    assignAnimTrackClip(animation.characterSetId, animation.trackId, animation.clipIndex)

                    enableAnimTrack(animation.characterSetId, animation.trackId)
                    setAnimTrackTime(animation.characterSetId, animation.trackId, 0, true)
                    disableAnimTrack(animation.characterSetId, animation.trackId)

                    table.insert(mixer.animations, animation)
                else
                    Logging.xmlWarning(xmlFile, "Unable to find animation clip '%s' on node '%s' in '%s'.", clipName, getName(rootNode), animationKey)
                end
            end
        end)

        mixer.samples = {}
        mixer.samples.start = g_soundManager:loadSamplesFromXML(xmlFile, baseKey .. ".sounds", "start", self.baseDirectory, self.components, 1, AudioGroup.ENVIRONMENT, self.i3dMappings)
        mixer.samples.stop = g_soundManager:loadSamplesFromXML(xmlFile, baseKey .. ".sounds", "stop", self.baseDirectory, self.components, 1, AudioGroup.ENVIRONMENT, self.i3dMappings)
        mixer.samples.work = g_soundManager:loadSamplesFromXML(xmlFile, baseKey .. ".sounds", "work", self.baseDirectory, self.components, 0, AudioGroup.ENVIRONMENT, self.i3dMappings)
    end

    return true
end

---@return boolean
function ManureSystemPlaceableMixers:unloadMixer(mixer)
    if mixer.interactionTriggerNode ~= nil then
        self.spec_manureSystemPlaceableMixers.activatableByTriggerId[mixer.interactionTriggerNode] = nil
        removeTrigger(mixer.interactionTriggerNode)
    end

    g_currentMission.activatableObjectsSystem:removeActivatable(mixer.activatable)

    if self.isClient then
        g_effectManager:deleteEffects(mixer.effects)

        g_animationManager:deleteAnimations(mixer.animationNodes)

        g_soundManager:deleteSamples(mixer.samples.start)
        g_soundManager:deleteSamples(mixer.samples.stop)
        g_soundManager:deleteSamples(mixer.samples.work)
    end

    return true
end

---@return void
function ManureSystemPlaceableMixers:setIsMixerTurnedOn(index, isTurnedOn, ...)
    local mixer = self.spec_manureSystemPlaceableMixers.mixers[index]
    if mixer ~= nil and isTurnedOn ~= nil and mixer.isTurnedOn ~= isTurnedOn then
        ManureSystemMixerTurnedOnEvent.sendEvent(self, index, isTurnedOn, ...)
        mixer.isTurnedOn = isTurnedOn

        if self.isClient then
            if mixer.isTurnedOn then
                g_animationManager:startAnimations(mixer.animationNodes)

                for _, animation in ipairs(mixer.animations) do
                    local clipIndex = getAnimTrackAssignedClip(animation.characterSetId, animation.trackId)
                    if animation.clipIndex ~= clipIndex then
                        clearAnimTrackClip(animation.characterSetId, animation.trackId)
                        assignAnimTrackClip(animation.characterSetId, animation.trackId, animation.clipIndex)
                    end

                    setAnimTrackLoopState(animation.characterSetId, animation.trackId, animation.loopState)
                    setAnimTrackSpeedScale(animation.characterSetId, animation.trackId, animation.speedScale)

                    enableAnimTrack(animation.characterSetId, animation.trackId)
                end

                g_soundManager:stopSamples(mixer.samples.stop)
                g_soundManager:playSamples(mixer.samples.start)

                for i, sample in ipairs(mixer.samples.work) do
                    g_soundManager:playSample(sample, 0, mixer.samples.start[i])
                end
            else
                g_animationManager:stopAnimations(mixer.animationNodes)

                for _, animation in ipairs(mixer.animations) do
                    local clipIndex = getAnimTrackAssignedClip(animation.characterSetId, animation.trackId)
                    if animation.clipIndex ~= clipIndex then
                        clearAnimTrackClip(animation.characterSetId, animation.trackId)
                        assignAnimTrackClip(animation.characterSetId, animation.trackId, animation.clipIndex)
                    end

                    if not animation.loopState then
                        enableAnimTrack(animation.characterSetId, animation.trackId)
                        setAnimTrackTime(animation.characterSetId, animation.trackId, 0, true)
                    end

                    disableAnimTrack(animation.characterSetId, animation.trackId)
                end

                g_soundManager:stopSamples(mixer.samples.start)
                g_soundManager:stopSamples(mixer.samples.work)
                g_soundManager:playSamples(mixer.samples.stop)
            end
        end

        if mixer.isTurnedOn then
            self:raiseActive()
        end
    end
end

---@return boolean
function ManureSystemPlaceableMixers:getIsMixerTurnedOn(index)
    local mixer = self.spec_manureSystemPlaceableMixers.mixers[index]
    if mixer ~= nil and mixer.isTurnedOn then
        return true
    end

    return false
end

---@return boolean
function ManureSystemPlaceableMixers:getCanToggleMixerTurnedOn(index)
    return self.spec_manureSystemPlaceableMixers.mixers[index] ~= nil
end

---@return void
function ManureSystemPlaceableMixers:mixerInteractionTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId)
    if g_currentMission.player ~= nil and otherActorId == g_currentMission.player.rootNode then
        local activatable = self.spec_manureSystemPlaceableMixers.activatableByTriggerId[triggerId]
        if activatable ~= nil then
            if onEnter then
                g_currentMission.activatableObjectsSystem:addActivatable(activatable)
            elseif onLeave then
                g_currentMission.activatableObjectsSystem:removeActivatable(activatable)
            end
        end
    end
end

----------------
-- Overwrites --
----------------

---@return boolean
function ManureSystemPlaceableMixers:getIsThicknessEnabled(superFunc, ...)
    if self.spec_manureSystemPlaceableMixers.isActive then
        return true
    end

    return superFunc(self, ...)
end



-- ManureSystemMixerActivatable
--
-- Author: Stijn Wopereis
-- Description: Activatable for placeable mixers
-- Name: ManureSystemMixerActivatable
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemMixerActivatable
ManureSystemMixerActivatable = {}

local ManureSystemMixerActivatable_mt = Class(ManureSystemMixerActivatable)

---@return table
function ManureSystemMixerActivatable.new(placeable, mixerIndex)
    local self = setmetatable({}, ManureSystemMixerActivatable_mt)

    self.placeable = placeable
    self.mixerIndex = mixerIndex
    self.activateText = ""

    return self
end

---@return boolean
function ManureSystemMixerActivatable:getIsActivatable()
    if not g_currentMission.controlPlayer then
        return false
    end

    return self.placeable ~= nil and self.placeable:getCanToggleMixerTurnedOn(self.mixerIndex)
end

---@return boolean
function ManureSystemMixerActivatable:getHasAccess(farmId)
    local ownerFarmId = self.placeable:getOwnerFarmId()
    return g_currentMission.accessHandler:canFarmAccessOtherId(farmId, ownerFarmId)
end

---@return void
function ManureSystemMixerActivatable:activate()
    self:updateActivateText()
end

---@return void
function ManureSystemMixerActivatable:run()
    local isTurnedOn = self.placeable:getIsMixerTurnedOn(self.mixerIndex)
    self.placeable:setIsMixerTurnedOn(self.mixerIndex, not isTurnedOn)

    self:updateActivateText()
end

---@return void
function ManureSystemMixerActivatable:updateActivateText()
    local isTurnedOn = self.placeable:getIsMixerTurnedOn(self.mixerIndex)
    self.activateText = isTurnedOn and g_i18n:getText("action_disableMixer") or g_i18n:getText("action_enableMixer")
end
