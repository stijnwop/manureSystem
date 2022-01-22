----------------------------------------------------------------------------------------------------
-- ManureSystemPumpIsRunningEvent
----------------------------------------------------------------------------------------------------
-- Purpose: Event to sync the pump is running state.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemPumpIsRunningEvent
ManureSystemPumpIsRunningEvent = {}
local ManureSystemPumpIsRunningEvent_mt = Class(ManureSystemPumpIsRunningEvent, Event)

InitEventClass(ManureSystemPumpIsRunningEvent, "ManureSystemPumpIsRunningEvent")

function ManureSystemPumpIsRunningEvent:emptyNew()
    local self = Event.new(ManureSystemPumpIsRunningEvent_mt)

    return self
end

function ManureSystemPumpIsRunningEvent:new(vehicle, pumpIsRunning)
    local self = ManureSystemPumpIsRunningEvent:emptyNew()

    self.vehicle = vehicle
    self.pumpIsRunning = pumpIsRunning

    return self
end

function ManureSystemPumpIsRunningEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteBool(streamId, self.pumpIsRunning)
end

function ManureSystemPumpIsRunningEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.pumpIsRunning = streamReadBool(streamId)

    self:run(connection)
end

function ManureSystemPumpIsRunningEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.vehicle)
    end

    self.vehicle:setIsPumpRunning(self.pumpIsRunning, true)
end

function ManureSystemPumpIsRunningEvent.sendEvent(vehicle, pumpIsRunning, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemPumpIsRunningEvent:new(vehicle, pumpIsRunning), nil, nil, vehicle)
        else
            g_client:getServerConnection():sendEvent(ManureSystemPumpIsRunningEvent:new(vehicle, pumpIsRunning))
        end
    end
end
