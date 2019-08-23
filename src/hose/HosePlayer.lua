HosePlayer = {}

local HosePlayer_mt = Class(HosePlayer)

function HosePlayer:new(isClient, isServer, mission, input)
    local self = setmetatable({}, HosePlayer_mt)

    self.isClient = isClient
    self.isServer = isServer
    self.mission = mission
    self.input = input

    Player.onEnter = Utils.appendedFunction(Player.onEnter, HosePlayer.inj_onEnter)
    Player.onLeave = Utils.appendedFunction(Player.onLeave, HosePlayer.inj_onLeave)
    Player.readUpdateStream = Utils.appendedFunction(Player.readUpdateStream, HosePlayer.readUpdateStream)
    Player.writeUpdateStream = Utils.appendedFunction(Player.writeUpdateStream, HosePlayer.writeUpdateStream)
    Player.pickUpObjectRaycastCallback = Utils.overwrittenFunction(Player.pickUpObjectRaycastCallback, HosePlayer.inj_pickUpObjectRaycastCallback)
    Player.checkObjectInRange = Utils.overwrittenFunction(Player.checkObjectInRange, HosePlayer.inj_checkObjectInRange)
    Player.pickUpObject = Utils.overwrittenFunction(Player.pickUpObject, HosePlayer.inj_pickUpObject)
    PlayerStateThrow.isAvailable = Utils.overwrittenFunction(PlayerStateThrow.isAvailable, HosePlayer.inj_isAvailable)

    return self
end

function HosePlayer:delete()
end

function HosePlayer:readUpdateStream(streamId, timestamp, connection)
    if connection:getIsServer() then

    end

end
function HosePlayer:writeUpdateStream(streamId, connection, dirtyMask)
    if not connection:getIsServer() then

    end

end

function HosePlayer:update(dt)
    if self.isClient then
        local player = self.mission.player
        local hose = player.lastFoundHose

        local showActionAttach = false
        local showActionDetach = false

        if hose ~= nil then
            local spec = hose.spec_hose
            local grabNode = spec.grabNodes[player.lastFoundHoseGrabNodeId]

            if grabNode ~= nil then
                showActionAttach = hose:isAttached(grabNode) and spec.foundConnectorId ~= nil
                if showActionAttach then
                    self.input:setActionEventText(self.actionEventIdAttachHose, "attach")
                    self.input:setActionEventTextPriority(self.actionEventIdAttachHose, GS_PRIO_HIGH)

                    local vehicle = spec.foundVehicle
                    local connector = vehicle.spec_manureSystemConnector.manureSystemConnectors[spec.foundConnectorId]

                    ManureSystemUtil:renderHelpTextOnNode(connector.node, "attach", "")
                end

                showActionDetach = hose:isConnected(grabNode) and spec.foundConnectorId ~= nil

                if showActionDetach then
                    self.input:setActionEventText(self.actionEventIdDetachHose, "detach")
                    self.input:setActionEventTextPriority(self.actionEventIdDetachHose, GS_PRIO_HIGH)

                    local vehicle = spec.foundVehicle
                    local connector = vehicle.spec_manureSystemConnector.manureSystemConnectors[spec.foundConnectorId]

                    ManureSystemUtil:renderHelpTextOnNode(connector.node, "detach", "")
                end
            end
        end

        self.input:setActionEventTextVisibility(self.actionEventIdAttachHose, showActionAttach)
        self.input:setActionEventTextVisibility(self.actionEventIdDetachHose, showActionDetach)
    end
end

function HosePlayer.isDynamicRigid(nodeId)
    return getRigidBodyType(nodeId):lower() == "dynamic"
end

function HosePlayer.inj_pickUpObject(player, superFunc, grab, noEventSend)
    -- do own stuff
    log("Hose grab: " .. tostring(grab))
    log(player.lastFoundHoseGrabNodeId)
    --
    local hose = player.lastFoundHose
    local grabNode = hose:getGrabNodeById(player.lastFoundHoseGrabNodeId)
    if not hose:isConnected(grabNode) then
        if grab and hose ~= nil and not player.isCarryingObject then
            hose:grab(player.lastFoundHoseGrabNodeId, player, noEventSend)
        elseif player.lastFoundHoseGrabNodeId ~= nil then
            hose:drop(player.lastFoundHoseGrabNodeId, player, noEventSend)
        end
    end

    superFunc(player, grab, noEventSend)
end

function HosePlayer.inj_checkObjectInRange(player, superFunc)
    local doCheck = player.isControlled and player.isServer and not player.isCarryingObject

    if doCheck then
        -- reset hose search
        player.lastFoundHose = nil
        player.lastFoundHoseIsDetached = false
    end

    superFunc(player)

    if doCheck then
        if not player.isObjectInRange then
            player.isObjectInRange = player.lastFoundHose ~= nil and player.lastFoundHoseIsDetached
        end
    end
end

function HosePlayer.inj_pickUpObjectRaycastCallback(player, superFunc, hitObjectId, x, y, z, distance)
    if hitObjectId ~= g_currentMission.terrainDetailId then
        if HosePlayer.isDynamicRigid(hitObjectId) then
            local object = g_currentMission:getNodeObject(hitObjectId)
            if object ~= nil
                and object.isaHose ~= nil
                and object:isaHose() then
                local mass = object:getTotalMass()
                local grabNode = object:getClosestGrabNode(x, y, z)

                local detached = object:isDetached(grabNode)
                if detached or object:isConnected(grabNode) then
                    player.lastFoundHoseGrabNodeId = grabNode.id

                    -- only allow pickup on detached hoses.
                    player.lastFoundHose = object
                    player.lastFoundObjectMass = mass

                    if detached then
                        player.lastFoundHoseIsDetached = true
                    end

                    -- we raise active in order to trigger functions on the hose.
                    object:raiseHoseActive()

                    return false -- dismiss further checks
                end
            end
        end
    end

    return superFunc(player, hitObjectId, x, y, z, distance)
end

function HosePlayer:registerPlayerActionEvents(player)
    if self.isClient and player == self.mission.player then
        local _, actionEventIdAttachHose = self.input:registerActionEvent(InputAction.MS_ATTACH_HOSE, self, self.actionEventOnAttachHose, false, true, true, true)
        self.input:setActionEventTextVisibility(actionEventIdAttachHose, false)

        local _, actionEventIdDetachHose = self.input:registerActionEvent(InputAction.MS_DETACH_HOSE, self, self.actionEventOnDetachHose, false, true, true, true)
        self.input:setActionEventTextVisibility(actionEventIdDetachHose, false)

        self.actionEventIdAttachHose = actionEventIdAttachHose
        self.actionEventIdDetachHose = actionEventIdDetachHose
    end
end

function HosePlayer:unregisterPlayerActionEvents(player)
    if player == self.mission.player then
        self.input:removeActionEvent(self.actionEventIdAttachHose)
        self.input:removeActionEvent(self.actionEventIdDetachHose)
    end
end

function HosePlayer.actionEventOnAttachHose(self, actionName, inputValue, callbackState, isAnalog)
    local player = self.mission.player
    local hose = player.lastFoundHose

    if hose ~= nil then
        local spec = hose.spec_hose
        local grabNode = hose:getGrabNodeById(player.lastFoundHoseGrabNodeId)

        if hose:isAttached(grabNode) then
            if spec.foundConnectorId ~= 0 and spec.foundVehicle ~= nil then
                hose:attach(spec.foundGrabNodeId, spec.foundConnectorId, spec.foundVehicle)
            end
        end
    end
end

function HosePlayer.actionEventOnDetachHose(self, actionName, inputValue, callbackState, isAnalog)
    local player = self.mission.player
    local hose = player.lastFoundHose

    if hose ~= nil then
        local spec = hose.spec_hose
        local grabNode = hose:getGrabNodeById(player.lastFoundHoseGrabNodeId)

        if hose:isConnected(grabNode) then
            if spec.foundConnectorId ~= 0 and spec.foundVehicle ~= nil then
                hose:detach(spec.foundGrabNodeId, spec.foundConnectorId, spec.foundVehicle)
            end
        end
    end
end

function HosePlayer.inj_onEnter(player, isControlling)
    if isControlling then
        g_manureSystem.player:registerPlayerActionEvents(player)
    end
end

---Injects in the player onLeave function
---@param player table
function HosePlayer.inj_onLeave(player)
    g_manureSystem.player:unregisterPlayerActionEvents(player)
end

function HosePlayer.inj_isAvailable(state, superFunc)
    if g_currentMission.player.lastFoundHose ~= nil then
        return false
    end

    return superFunc(state)
end
