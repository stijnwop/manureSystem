----------------------------------------------------------------------------------------------------
-- HoseAttachDetachEvent
----------------------------------------------------------------------------------------------------
-- Purpose: Event to synchronize the vehicle attach state to clients.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class HoseAttachDetachEvent
HoseAttachDetachEvent = {}
local HoseAttachDetachEvent_mt = Class(HoseAttachDetachEvent, Event)

InitEventClass(HoseAttachDetachEvent, "HoseAttachDetachEvent")

function HoseAttachDetachEvent:emptyNew()
    local event = Event:new(HoseAttachDetachEvent_mt)
    return event
end

function HoseAttachDetachEvent:new(object, id, connectorId, vehicle, state)
    local event = HoseAttachDetachEvent:emptyNew()

    event.object = object
    event.id = id
    event.connectorId = connectorId
    event.vehicle = vehicle
    event.state = state

    return event
end

function HoseAttachDetachEvent:readStream(streamId, connection)
    self.object = NetworkUtil.readNodeObject(streamId)
    self.id = streamReadUIntN(streamId, ManureSystemEventBits.GRAB_NODES_SEND_NUM_BITS) + 1
    self.connectorId = streamReadUIntN(streamId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS) + 1
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.state = streamReadBool(streamId)

    self:run(connection)
end

function HoseAttachDetachEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.object)
    streamWriteUIntN(streamId, self.id - 1, ManureSystemEventBits.GRAB_NODES_SEND_NUM_BITS)
    streamWriteUIntN(streamId, self.connectorId - 1, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteBool(streamId, self.state)
end

function HoseAttachDetachEvent:run(connection)
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.object)
    end

    if self.state then
        self.object:attach(self.id, self.connectorId, self.vehicle, true)
    else
        self.object:detach(self.id, self.connectorId, self.vehicle, true)
    end
end

function HoseAttachDetachEvent.sendEvent(object, id, connectorId, vehicle, state, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(HoseAttachDetachEvent:new(object, id, connectorId, vehicle, state), nil, nil, object)
        else
            g_client:getServerConnection():sendEvent(HoseAttachDetachEvent:new(object, id, connectorId, vehicle, state))
        end
    end
end
