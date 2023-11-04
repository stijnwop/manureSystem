--
-- ManureSystemIsMixingEvent
--
-- Author: Stijn Wopereis
-- Description: Event to sync the mixing state.
-- Name: ManureSystemIsMixingEvent
-- Hide: yes
--
-- Copyright (c) Wopster, 2019 - 2023

---@class ManureSystemIsMixingEvent
ManureSystemIsMixingEvent = {}
local ManureSystemIsMixingEvent_mt = Class(ManureSystemIsMixingEvent, Event)

InitEventClass(ManureSystemIsMixingEvent, "ManureSystemIsMixingEvent")

function ManureSystemIsMixingEvent.emptyNew()
    return Event.new(ManureSystemIsMixingEvent_mt)
end

function ManureSystemIsMixingEvent.new(object, isActive)
    local self = ManureSystemIsMixingEvent.emptyNew()

    self.object = object
    self.isActive = isActive

    return self
end

function ManureSystemIsMixingEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.object)
    streamWriteBool(streamId, self.isActive)
end

function ManureSystemIsMixingEvent:readStream(streamId, connection)
    self.object = NetworkUtil.readNodeObject(streamId)
    self.isActive = streamReadBool(streamId)

    self:run(connection)
end

function ManureSystemIsMixingEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.object)
    end

    self.object:setIsMixerActive(self.isActive, true)
end

function ManureSystemIsMixingEvent.sendEvent(object, isActive, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemIsMixingEvent.new(object, isActive), nil, nil, object)
        else
            g_client:getServerConnection():sendEvent(ManureSystemIsMixingEvent.new(object, isActive))
        end
    end
end
