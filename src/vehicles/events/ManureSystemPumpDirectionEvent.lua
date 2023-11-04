--
-- ManureSystemPumpDirectionEvent
--
-- Author: Stijn Wopereis
-- Description: Event to sync the pump is direction state.
-- Name: ManureSystemPumpDirectionEvent
-- Hide: yes
--
-- Copyright (c) Wopster, 2019 - 2023

---@class ManureSystemPumpDirectionEvent
ManureSystemPumpDirectionEvent = {}
local ManureSystemPumpDirectionEvent_mt = Class(ManureSystemPumpDirectionEvent, Event)

InitEventClass(ManureSystemPumpDirectionEvent, "ManureSystemPumpDirectionEvent")

function ManureSystemPumpDirectionEvent.emptyNew()
    return Event.new(ManureSystemPumpDirectionEvent_mt)
end

function ManureSystemPumpDirectionEvent.new(vehicle, direction)
    local self = ManureSystemPumpDirectionEvent.emptyNew()

    self.vehicle = vehicle
    self.direction = direction

    return self
end

function ManureSystemPumpDirectionEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    local direction = (self.direction + 1) / 2 * 1023
    streamWriteUIntN(streamId, direction, 10)
end

function ManureSystemPumpDirectionEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.direction = streamReadUIntN(streamId, 10) / 1023 * 2 - 1
    if math.abs(self.direction) < 0.00099 then
        self.direction = 0 -- set to 0 to avoid noise caused by compression
    end

    self:run(connection)
end

function ManureSystemPumpDirectionEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.vehicle)
    end

    self.vehicle:setPumpDirection(self.direction, true)
end

function ManureSystemPumpDirectionEvent.sendEvent(vehicle, direction, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemPumpDirectionEvent.new(vehicle, direction), nil, nil, vehicle)
        else
            g_client:getServerConnection():sendEvent(ManureSystemPumpDirectionEvent.new(vehicle, direction))
        end
    end
end
