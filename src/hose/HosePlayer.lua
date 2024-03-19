--
-- HosePlayer
--
-- Author: Stijn Wopereis
-- Description: Injection class to handle all the hose interactions with the player.
-- Name: HosePlayer
-- Hide: yes
--
-- Copyright (c) Wopster, 2019 - 2023

---@class HosePlayer
HosePlayer = {}

local HosePlayer_mt = Class(HosePlayer)

function HosePlayer.new(isClient, isServer, mission, input)
    local self = setmetatable({}, HosePlayer_mt)

    self.isClient = isClient
    self.isServer = isServer
    self.mission = mission
    self.input = input

    Player.readUpdateStream = Utils.appendedFunction(Player.readUpdateStream, HosePlayer.inj_player_readUpdateStream)
    Player.writeUpdateStream = Utils.appendedFunction(Player.writeUpdateStream, HosePlayer.inj_player_writeUpdateStream)
    Player.onLeave = Utils.appendedFunction(Player.onLeave, HosePlayer.inj_player_onLeave)

    -- Workaround for mod conflicts caused by Precision Hands and 3rdPerson mods:
    -- Delay the method override so the other mods can't replace our code.
    Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, function(...)
        Player.update = Utils.appendedFunction(Player.update, HosePlayer.inj_player_update)
        Player.pickUpObject = Utils.overwrittenFunction(Player.pickUpObject, HosePlayer.inj_player_pickUpObject)
    end)

    Player.updateActionEvents = Utils.appendedFunction(Player.updateActionEvents, HosePlayer.inj_player_updateActionEvents)
    Player.registerActionEvents = Utils.prependedFunction(Player.registerActionEvents, HosePlayer.inj_player_registerActionEvents)



    Player.checkObjectInRange = Utils.overwrittenFunction(Player.checkObjectInRange, HosePlayer.inj_player_checkObjectInRange)
    PlayerStateThrow.isAvailable = Utils.overwrittenFunction(PlayerStateThrow.isAvailable, HosePlayer.inj_playerStateThrow_isAvailable)
    PlayerStatePickup.isAvailable = Utils.overwrittenFunction(PlayerStatePickup.isAvailable, HosePlayer.inj_playerStatePickup_isAvailable)

    PlayerStateWalk.isAvailable = Utils.overwrittenFunction(PlayerStateWalk.isAvailable, HosePlayer.inj_playerStateWalk_isAvailable)
    PlayerStateRun.isAvailable = Utils.overwrittenFunction(PlayerStateRun.isAvailable, HosePlayer.inj_playerStateWalk_isAvailable)

    return self
end

function HosePlayer:delete()
end

function HosePlayer.inj_player_readUpdateStream(player, streamId, timestamp, connection)
    if connection:getIsServer() then
        player.lastFoundObjectIsHose = streamReadBool(streamId)
        player.lastFoundHoseIsConnected = streamReadBool(streamId)

        if player.lastFoundObjectIsHose then
            player.lastFoundHose = NetworkUtil.readNodeObjectId(streamId)
            player.lastFoundGradNodeId = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS) + 1
        end
    end

end
function HosePlayer.inj_player_writeUpdateStream(player, streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        streamWriteBool(streamId, player.lastFoundObjectIsHose)
        streamWriteBool(streamId, player.lastFoundHoseIsConnected)

        if player.lastFoundObjectIsHose then
            NetworkUtil.writeNodeObjectId(streamId, player.lastFoundHose)
            streamWriteUIntN(streamId, player.lastFoundGradNodeId - 1, Hose.GRAB_NODES_SEND_NUM_BITS)
        end
    end
end

function HosePlayer.inj_player_update(player, dt)
    if player.isServer then
        if player.hoseGrabNodeId ~= nil then
            local hose = NetworkUtil.getObject(player.lastFoundHose)
            hose:findConnector(player.hoseGrabNodeId)
            player.hoseIsRestricting = hose:restrictPlayerMovement(player.hoseGrabNodeId, player)

            if player.hoseIsRestricting then
                player.playerStateMachine:deactivateState("walk")
                player.playerStateMachine:deactivateState("run")
                player.playerStateMachine:activateState("idle")
            end
        end
    end
end

function HosePlayer.inj_player_onLeave(player)
    if player.isServer and player.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(player.lastFoundHose)
        if player.hoseGrabNodeId ~= nil then
            hose:drop(player.hoseGrabNodeId, player)
        end
    end
end

function HosePlayer.inj_player_updateActionEvents(player)
    local eventList = player.inputInformation.registrationList
    local function disableInput(inputAction)
        -- Check if the input exists in order to prevent callstacks with mods that load dummy players (e.g. ContractorMod).
        if eventList[inputAction] ~= nil then
            local event = eventList[inputAction]
            local id = event.eventId
            g_inputBinding:setActionEventActive(id, false)
            g_inputBinding:setActionEventTextVisibility(id, false)
        end
    end

    local function enableInput(inputAction, forcePriority)
        local event = eventList[inputAction]
        local id = event.eventId
        g_inputBinding:setActionEventActive(id, true)
        g_inputBinding:setActionEventTextVisibility(id, event.textVisibility)

        if forcePriority then
            g_inputBinding:setActionEventTextPriority(id, GS_PRIO_HIGH)
        end
    end

    disableInput(InputAction.MS_ATTACH_HOSE)
    disableInput(InputAction.MS_DETACH_HOSE)
    disableInput(InputAction.MS_TOGGLE_FLOW)

    if player.hoseIsRestricting then
        disableInput(InputAction.AXIS_MOVE_FORWARD_PLAYER)
        disableInput(InputAction.AXIS_RUN)
    else
        enableInput(InputAction.AXIS_MOVE_FORWARD_PLAYER)
        enableInput(InputAction.AXIS_RUN)
    end

    if player.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(player.lastFoundHose)

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = hose:getGrabNodeById(player.lastFoundGradNodeId)

            if hose:isAttached(grabNode) and spec.foundConnectorId ~= 0 and not spec.foundConnectorIsConnected then
                enableInput(InputAction.MS_ATTACH_HOSE, true)
                local event = eventList[InputAction.MS_ATTACH_HOSE]
                local text = spec.foundConnectorIsParkPlace and g_i18n:getText("action_storeHose") or event.text
                g_inputBinding:setActionEventText(event.eventId, text)
            elseif hose:isConnected(grabNode) then
                local desc = spec.grabNodesToObjects[grabNode.id]
                if desc ~= nil then
                    local object = desc.vehicle
                    local connector = object:getConnectorById(desc.connectorId)
                    local hasManureFlowControl = connector.manureFlowAnimationName ~= nil or connector.manureFlowAnimationIndex ~= nil
                    local animationName = connector.manureFlowAnimationName ~= nil and connector.manureFlowAnimationName or connector.manureFlowAnimationIndex

                    if hasManureFlowControl then
                        enableInput(InputAction.MS_TOGGLE_FLOW, true)
                        local state = object:getAnimationTime(animationName) == 0
                        local text = state and g_i18n:getText("action_toggleManureFlowStateOpen") or g_i18n:getText("action_toggleManureFlowStateClose")
                        local id = eventList[InputAction.MS_TOGGLE_FLOW].eventId

                        g_inputBinding:setActionEventText(id, g_i18n:getText("action_toggleManureFlow"):format(text))
                    end

                    if not hasManureFlowControl or not connector.hasOpenManureFlow then
                        enableInput(InputAction.MS_DETACH_HOSE, true)
                    end
                end
            end
        end
    end
end

function HosePlayer.inj_player_registerActionEvents(player)
    player.inputInformation.registrationList[InputAction.MS_ATTACH_HOSE] = { eventId = "", callback = Player.actionEventOnAttachHose, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_ATTACH_HOSE"), textVisibility = true }
    player.inputInformation.registrationList[InputAction.MS_DETACH_HOSE] = { eventId = "", callback = Player.actionEventOnDetachHose, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_DETACH_HOSE"), textVisibility = true }
    player.inputInformation.registrationList[InputAction.MS_TOGGLE_FLOW] = { eventId = "", callback = Player.actionEventOnToggleFlow, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_TOGGLE_FLOW"), textVisibility = true }
end

function HosePlayer.inj_player_pickUpObject(player, superFunc, grab, noEventSend)
    if player.isServer and player.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(player.lastFoundHose)
        local grabNode = hose:getGrabNodeById(player.lastFoundGradNodeId)

        if grab and not hose:isConnected(grabNode) then
            hose:grab(grabNode.id, player)
        elseif player.hoseGrabNodeId ~= nil then
            hose:drop(player.hoseGrabNodeId, player)
        end
    else
        superFunc(player, grab, noEventSend)
    end
end

function HosePlayer.inj_player_checkObjectInRange(player, superFunc)
    local canHandleCheck = player.isControlled and player.isServer and not player.isCarryingObject

    if canHandleCheck then
        player.lastFoundHose = nil
        player.lastFoundGradNodeId = 0
        player.lastFoundObjectIsHose = false
        player.lastFoundHoseIsConnected = false
    end

    superFunc(player)

    if canHandleCheck then
        if player.lastFoundObject ~= nil then
            local object = g_currentMission:getNodeObject(player.lastFoundObject)
            if object ~= nil
                and object.isaHose ~= nil
                and object:isaHose() then

                local grabNode = object:getClosestGrabNode(unpack(player.lastFoundObjectHitPoint))
                local isConnected = object:isConnected(grabNode)
                if object:isDetached(grabNode) or isConnected then
                    player.lastFoundHose = NetworkUtil.getObjectId(object)
                    player.lastFoundGradNodeId = grabNode.id
                    player.lastFoundObjectIsHose = true
                    player.lastFoundHoseIsConnected = isConnected
                else
                    player.lastFoundHose = nil
                    player.lastFoundGradNodeId = 0
                    player.lastFoundObject = nil
                    player.lastFoundObjectHitPoint = nil
                    player.isObjectInRange = false
                end

                -- we raise active in order to trigger functions on the hose.
                --object:raiseHoseActive()
            end
        end
    end
end

function HosePlayer.inj_playerStateThrow_isAvailable(state, superFunc)
    if state.player.lastFoundObjectIsHose then
        return false
    end

    return superFunc(state)
end

function HosePlayer.inj_playerStatePickup_isAvailable(state, superFunc)
    local player = state.player
    if player.lastFoundObjectIsHose and player.lastFoundHoseIsConnected then
        return false
    end

    return superFunc(state)
end

function HosePlayer.inj_playerStateWalk_isAvailable(state, superFunc)
    local player = state.player
    local hose = NetworkUtil.getObject(player.lastFoundHose)

    if hose ~= nil and player.hoseGrabNodeId ~= nil then
        if player.hoseIsRestricting then
            return false
        end
    end

    return superFunc(state)
end

---- Add action event functions to the player class.
function Player.actionEventOnAttachHose(self, actionName, inputValue, callbackState, isAnalog)
    if self.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(self.lastFoundHose)

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = hose:getGrabNodeById(self.lastFoundGradNodeId)

            if hose:isAttached(grabNode) then
                if spec.foundConnectorId ~= 0 and spec.foundVehicleId ~= 0 and not spec.foundConnectorIsConnected then
                    hose:attach(grabNode.id, spec.foundConnectorId, NetworkUtil.getObject(spec.foundVehicleId))
                end
            end
        end
    end
end

function Player.actionEventOnDetachHose(self, actionName, inputValue, callbackState, isAnalog)
    if self.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(self.lastFoundHose)

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = hose:getGrabNodeById(self.lastFoundGradNodeId)

            if hose:isConnected(grabNode) then
                local desc = spec.grabNodesToObjects[grabNode.id]
                if desc ~= nil then
                    hose:detach(grabNode.id, desc.connectorId, desc.vehicle)
                end
            end
        end
    end
end

function Player.actionEventOnToggleFlow(self, actionName, inputValue, callbackState, isAnalog)
    if self.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(self.lastFoundHose)

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = hose:getGrabNodeById(self.lastFoundGradNodeId)

            if hose:isConnected(grabNode) then
                local desc = spec.grabNodesToObjects[grabNode.id]
                if desc ~= nil then
                    local vehicle = desc.vehicle
                    local connector = vehicle:getConnectorById(desc.connectorId)
                    local hasManureFlowControl = connector.manureFlowAnimationName ~= nil or connector.manureFlowAnimationIndex ~= nil
                    local animationName = connector.manureFlowAnimationName ~= nil and connector.manureFlowAnimationName or connector.manureFlowAnimationIndex

                    if hasManureFlowControl and not vehicle:getIsAnimationPlaying(animationName) then
                        vehicle:setIsManureFlowOpen(desc.connectorId, not connector.hasOpenManureFlow, false)
                    end
                end
            end
        end
    end
end
