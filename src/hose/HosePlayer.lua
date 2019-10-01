----------------------------------------------------------------------------------------------------
-- HosePlayer
----------------------------------------------------------------------------------------------------
-- Purpose: Injection class to handle all the hose interactions with the player.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class HosePlayer
HosePlayer = {}

local HosePlayer_mt = Class(HosePlayer)

function HosePlayer:new(isClient, isServer, mission, input)
    local self = setmetatable({}, HosePlayer_mt)

    self.isClient = isClient
    self.isServer = isServer
    self.mission = mission
    self.input = input

    Player.readUpdateStream = Utils.appendedFunction(Player.readUpdateStream, HosePlayer.inj_player_readUpdateStream)
    Player.writeUpdateStream = Utils.appendedFunction(Player.writeUpdateStream, HosePlayer.inj_player_writeUpdateStream)
    Player.update = Utils.appendedFunction(Player.update, HosePlayer.inj_player_update)

    Player.updateActionEvents = Utils.appendedFunction(Player.updateActionEvents, HosePlayer.inj_player_updateActionEvents)
    Player.registerActionEvents = Utils.prependedFunction(Player.registerActionEvents, HosePlayer.inj_player_registerActionEvents)

    Player.pickUpObject = Utils.overwrittenFunction(Player.pickUpObject, HosePlayer.inj_player_pickUpObject)
    Player.pickUpObjectRaycastCallback = Utils.overwrittenFunction(Player.pickUpObjectRaycastCallback, HosePlayer.inj_player_pickUpObjectRaycastCallback)

    Player.checkObjectInRange = Utils.overwrittenFunction(Player.checkObjectInRange, HosePlayer.inj_player_checkObjectInRange)
    PlayerStateThrow.isAvailable = Utils.overwrittenFunction(PlayerStateThrow.isAvailable, HosePlayer.inj_playerStateThrow_isAvailable)
    PlayerStatePickup.isAvailable = Utils.overwrittenFunction(PlayerStatePickup.isAvailable, HosePlayer.inj_playerStatePickup_isAvailable)

    return self
end

function HosePlayer:delete()
end

function HosePlayer:update(dt)
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
        end
    end
end

function HosePlayer.inj_player_updateActionEvents(player)
    local eventList = player.inputInformation.registrationList
    local function disableInput(inputAction)
        local id = eventList[inputAction].eventId
        g_inputBinding:setActionEventActive(id, false)
        g_inputBinding:setActionEventTextVisibility(id, false)
    end

    local function enableInput(inputAction)
        local id = eventList[inputAction].eventId
        g_inputBinding:setActionEventActive(id, true)
        g_inputBinding:setActionEventTextVisibility(id, true)
    end

    disableInput(InputAction.MS_ATTACH_HOSE)
    disableInput(InputAction.MS_DETACH_HOSE)
    disableInput(InputAction.MS_TOGGLE_FLOW)

    if player.lastFoundObjectIsHose then
        local hose = NetworkUtil.getObject(player.lastFoundHose)

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = hose:getGrabNodeById(player.lastFoundGradNodeId)

            if hose:isAttached(grabNode) and spec.foundConnectorId ~= 0 and not spec.foundConnectorIsConnected then
                enableInput(InputAction.MS_ATTACH_HOSE)
            elseif hose:isConnected(grabNode) then
                local desc = spec.grabNodesToObjects[grabNode.id]
                if desc ~= nil then
                    local vehicle = desc.vehicle
                    local connector = vehicle:getConnectorById(desc.connectorId)
                    local hasManureFlowControl = connector.manureFlowAnimationName ~= nil or connector.manureFlowAnimationIndex ~= nil
                    local animationName = connector.manureFlowAnimationName ~= nil and connector.manureFlowAnimationName or connector.manureFlowAnimationIndex

                    if hasManureFlowControl then
                        enableInput(InputAction.MS_TOGGLE_FLOW)
                        local state = vehicle:getAnimationTime(animationName) == 0
                        local text = state and g_i18n:getText("action_toggleManureFlowStateOpen") or g_i18n:getText("action_toggleManureFlowStateClose")
                        local id = eventList[InputAction.MS_TOGGLE_FLOW].eventId

                        g_inputBinding:setActionEventText(id, g_i18n:getText("action_toggleManureFlow"):format(text))
                    end

                    if not hasManureFlowControl or not connector.hasOpenManureFlow then
                        enableInput(InputAction.MS_DETACH_HOSE)
                    end
                end
            end
        end
    end
end

function HosePlayer.inj_player_registerActionEvents(player)
    player.inputInformation.registrationList[InputAction.MS_ATTACH_HOSE] = { eventId = "", callback = player.actionEventOnAttachHose, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_ATTACH_HOSE"), textVisibility = true }
    player.inputInformation.registrationList[InputAction.MS_DETACH_HOSE] = { eventId = "", callback = player.actionEventOnDetachHose, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_DETACH_HOSE"), textVisibility = true }
    player.inputInformation.registrationList[InputAction.MS_TOGGLE_FLOW] = { eventId = "", callback = player.actionEventOnToggleFlow, triggerUp = false, triggerDown = true, triggerAlways = false, activeType = Player.INPUT_ACTIVE_TYPE.STARTS_DISABLED, callbackState = nil, text = g_i18n:getText("input_MS_TOGGLE_FLOW"), textVisibility = true }
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

function HosePlayer.inj_player_pickUpObjectRaycastCallback(player, superFunc, hitObjectId, x, y, z, distance)
    if hitObjectId ~= g_currentMission.terrainDetailId and Player.PICKED_UP_OBJECTS[hitObjectId] ~= true then
        if getRigidBodyType(hitObjectId) == "Dynamic" then

            local mass = getMass(hitObjectId)
            -- check if mounted:
            local canBePickedUp = true
            local object = g_currentMission:getNodeObject(hitObjectId)
            if object ~= nil then
                if object.dynamicMountObject ~= nil then
                    canBePickedUp = false
                end
                if object.getTotalMass ~= nil then
                    mass = object:getTotalMass()
                end
                if object.getCanBePickedUp ~= nil then
                    if not object:getCanBePickedUp(player) then
                        canBePickedUp = false
                    end
                end
            end

            if canBePickedUp then
                player.lastFoundObject = hitObjectId
                player.lastFoundObjectMass = mass
                player.lastFoundObjectHitPoint = { x, y, z }
            end

            -- only consider first potentially valid object
            return not canBePickedUp -- fix
        end
    end

    return true
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
