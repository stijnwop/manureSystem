--
-- ManureSystemPumpIsAllowedEvent
--
-- Author: Stijn Wopereis
-- Description: Event to check if we allow for pumping.
-- Name: ManureSystemPumpIsAllowedEvent
-- Hide: yes
--
-- Copyright (c) Wopster, 2019 - 2023

---@class ManureSystemPumpIsAllowedEvent
ManureSystemPumpIsAllowedEvent = {}
local ManureSystemPumpIsAllowedEvent_mt = Class(ManureSystemPumpIsAllowedEvent, Event)

InitEventClass(ManureSystemPumpIsAllowedEvent, "ManureSystemPumpIsAllowedEvent")

function ManureSystemPumpIsAllowedEvent.emptyNew()
    return Event.new(ManureSystemPumpIsAllowedEvent_mt)
end

function ManureSystemPumpIsAllowedEvent.new(vehicle, warning)
    local self = ManureSystemPumpIsAllowedEvent.emptyNew()

    self.vehicle = vehicle
    self.warning = warning

    return self
end

function ManureSystemPumpIsAllowedEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteBool(streamId, self.warning ~= nil)

    if self.warning ~= nil then
        streamWriteUInt8(streamId, self.warning)
    end
end

function ManureSystemPumpIsAllowedEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    if streamReadBool(streamId) then
        self.warning = streamReadUInt8(streamId)
    end
    self:run(connection)
end

function ManureSystemPumpIsAllowedEvent:run(connection)
    self.vehicle:checkPumpNotAllowedWarning(self.warning)
end
