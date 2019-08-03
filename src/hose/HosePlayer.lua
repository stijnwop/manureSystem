HosePlayer = {}

local HosePlayer_mt = Class(HosePlayer)

function HosePlayer:new(isClient, isServer)
    local self = setmetatable({}, HosePlayer_mt)

    self.isClient = isClient
    self.isServer = isServer

    Player.pickUpObjectRaycastCallback = Utils.overwrittenFunction(Player.pickUpObjectRaycastCallback, HosePlayer.inj_pickUpObjectRaycastCallback)
    Player.checkObjectInRange = Utils.overwrittenFunction(Player.checkObjectInRange, HosePlayer.inj_checkObjectInRange)
    Player.pickUpObject = Utils.overwrittenFunction(Player.pickUpObject, HosePlayer.inj_pickUpObject)

    return self
end

function HosePlayer:delete()
end

function HosePlayer:update(dt)
    if self.isServer then
        --

    end
end

local function isDynamicRigid(nodeId)
    return getRigidBodyType(nodeId):lower() == "dynamic"
end

function HosePlayer.inj_pickUpObject(player, superFunc, grab, noEventSend)
    -- do own stuff
    log("Hose grab: " .. tostring(grab))
    log(player.lastFoundHoseId)
    --
    local hose = player.lastFoundHose
    if grab and hose ~= nil and not player.isCarryingObject then
        hose:grab(player.lastFoundHoseId, player, noEventSend)
    elseif player.lastFoundHoseId ~= nil then
        hose:drop(player.lastFoundHoseId, player, noEventSend)
    end

    superFunc(player, grab, noEventSend)
end

function HosePlayer.inj_checkObjectInRange(player, superFunc)
    local doCheck = player.isControlled and player.isServer and not player.isCarryingObject

    if doCheck then
        -- reset hose search
        player.lastFoundHose = nil
    end

    superFunc(player)

    if doCheck then
        player.isObjectInRange = player.lastFoundHose ~= nil
    end
end

function HosePlayer.inj_pickUpObjectRaycastCallback(player, superFunc, hitObjectId, x, y, z, distance)
    if hitObjectId ~= g_currentMission.terrainDetailId then
        if isDynamicRigid(hitObjectId) then
            local object = g_currentMission:getNodeObject(hitObjectId)
            if object ~= nil
                    and object.isaHose ~= nil
                    and object:isaHose() then
                local mass = object:getTotalMass()
                local grabNode = object:getClosestGrabNode(x, y, z)

                if object:isDetached(grabNode) then
                    player.lastFoundHoseId = grabNode.id
                    player.lastFoundHose = object
                    player.lastFoundObjectMass = mass

                    return false -- dismiss further checks
                end
            end
        end
    end

    return superFunc(player, hitObjectId, x, y, z, distance)
end

function HosePlayer.inj_onEnter(player, isControlling)
    if isControlling then
        g_manualAttach:registerPlayerActionEvents(player)
        g_manualAttach.detectionHandler:addTrigger(player)
    end
end

---Injects in the player onLeave function
---@param player table
function HosePlayer.inj_onLeave(player)
    g_manualAttach:unregisterPlayerActionEvents(player)
    g_manualAttach.detectionHandler:removeTrigger(player)
end
