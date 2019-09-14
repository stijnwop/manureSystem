HoseGrabDropEvent = {}
local HoseGrabDropEvent_mt = Class(HoseGrabDropEvent, Event)

InitEventClass(HoseGrabDropEvent, "HoseGrabDropEvent")

function HoseGrabDropEvent:emptyNew()
    local event = Event:new(HoseGrabDropEvent_mt)
    return event
end

function HoseGrabDropEvent:new(object, id, player, state)
    local event = HoseGrabDropEvent:emptyNew()

    event.object = object
    event.id = id
    event.player = player
    event.state = state

    return event
end

function HoseGrabDropEvent:readStream(streamId, connection)
    self.object = NetworkUtil.readNodeObject(streamId)
    self.id = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS) + 1
    self.player = NetworkUtil.readNodeObject(streamId)
    self.state = streamReadBool(streamId)

    self:run(connection)
end

function HoseGrabDropEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.object)
    streamWriteUIntN(streamId, self.id - 1, Hose.GRAB_NODES_SEND_NUM_BITS)
    NetworkUtil.writeNodeObject(streamId, self.player)
    streamWriteBool(streamId, self.state)
end

function HoseGrabDropEvent:run(connection)
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.object)
    end

    if self.state then
        self.object:grab(self.id, self.player, true)
    else
        self.object:drop(self.id, self.player, true)
    end
end

function HoseGrabDropEvent.sendEvent(object, id, player, state, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(HoseGrabDropEvent:new(object, id, player, state), nil, nil, object)
        else
            g_client:getServerConnection():sendEvent(HoseGrabDropEvent:new(object, id, player, state))
        end
    end
end
