----------------------------------------------------------------------------------------------------
-- ManureSystemPumpModeEvent
----------------------------------------------------------------------------------------------------
-- Purpose: Event to sync the pump mode.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

ManureSystemPumpModeEvent = {}
local ManureSystemPumpModeEvent_mt = Class(ManureSystemPumpModeEvent, Event)

InitEventClass(ManureSystemPumpModeEvent, "ManureSystemPumpModeEvent")

function ManureSystemPumpModeEvent.emptyNew()
    return Event.new(ManureSystemPumpModeEvent_mt)
end

function ManureSystemPumpModeEvent.new(vehicle, mode)
    local self = ManureSystemPumpModeEvent.emptyNew()

    self.vehicle = vehicle
    self.mode = mode

    return self
end

function ManureSystemPumpModeEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteUIntN(streamId, self.mode, 2)
end

function ManureSystemPumpModeEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.mode = streamReadUIntN(streamId, 2)
    self:run(connection)
end

function ManureSystemPumpModeEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.vehicle)
    end

    self.vehicle:setPumpMode(self.mode, true)
end

function ManureSystemPumpModeEvent.sendEvent(vehicle, mode, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemPumpModeEvent.new(vehicle, mode), nil, nil, vehicle)
        else
            g_client:getServerConnection():sendEvent(ManureSystemPumpModeEvent.new(vehicle, mode))
        end
    end
end
