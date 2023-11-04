--
-- ManureSystemMixerTurnedOnEvent
--
-- Author: Stijn Wopereis
-- Description: Event to sync the mixer turned on state for placeables
-- Name: ManureSystemMixerTurnedOnEvent
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemMixerTurnedOnEvent
ManureSystemMixerTurnedOnEvent = {}
ManureSystemMixerTurnedOnEvent.SEND_NUM_BITS = 2
local ManureSystemMixerTurnedOnEvent_mt = Class(ManureSystemMixerTurnedOnEvent, Event)

InitEventClass(ManureSystemMixerTurnedOnEvent, "ManureSystemMixerTurnedOnEvent")

---@return table
function ManureSystemMixerTurnedOnEvent.emptyNew()
    return Event.new(ManureSystemMixerTurnedOnEvent_mt)
end

---@return table
function ManureSystemMixerTurnedOnEvent.new(placeable, mixerIndex, isTurnedOn)
    local self = ManureSystemMixerTurnedOnEvent.emptyNew()

    self.placeable = placeable
    self.mixerIndex = mixerIndex
    self.isTurnedOn = isTurnedOn

    return self
end

---@return void
function ManureSystemMixerTurnedOnEvent:readStream(streamId, connection)
    self.placeable = NetworkUtil.readNodeObject(streamId)
    self.mixerIndex = streamReadUIntN(streamId, ManureSystemMixerTurnedOnEvent.SEND_NUM_BITS)
    self.isTurnedOn = streamReadBool(streamId)

    self:run(connection)
end

---@return void
function ManureSystemMixerTurnedOnEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.placeable)
    streamWriteUIntN(streamId, self.mixerIndex, ManureSystemMixerTurnedOnEvent.SEND_NUM_BITS)
    streamWriteBool(streamId, self.isTurnedOn)
end

---@return void
function ManureSystemMixerTurnedOnEvent:run(connection)
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.placeable)
    end

    if self.placeable ~= nil and self.placeable:getIsSynchronized() then
        self.placeable:setIsMixerTurnedOn(self.mixerIndex, self.isTurnedOn, true)
    end
end

---@return void
function ManureSystemMixerTurnedOnEvent.sendEvent(placeable, mixerIndex, isTurnedOn, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemMixerTurnedOnEvent.new(placeable, mixerIndex, isTurnedOn), nil, nil, placeable)
        else
            g_client:getServerConnection():sendEvent(ManureSystemMixerTurnedOnEvent.new(placeable, mixerIndex, isTurnedOn))
        end
    end
end
