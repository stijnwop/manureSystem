----------------------------------------------------------------------------------------------------
-- ManureSystemConnectorManureFlowEvent
----------------------------------------------------------------------------------------------------
-- Purpose: Event to sync the is the manure flow is open or not.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnectorManureFlowEvent
ManureSystemConnectorManureFlowEvent = {}
local ManureSystemConnectorManureFlowEvent_mt = Class(ManureSystemConnectorManureFlowEvent, Event)

InitEventClass(ManureSystemConnectorManureFlowEvent, "ManureSystemConnectorManureFlowEvent")

function ManureSystemConnectorManureFlowEvent.emptyNew()
    return Event.new(ManureSystemConnectorManureFlowEvent_mt)
end

function ManureSystemConnectorManureFlowEvent.new(vehicle, connectorId, hasOpenManureFlow, isForced)
    local self = ManureSystemConnectorManureFlowEvent.emptyNew()

    self.vehicle = vehicle
    self.connectorId = connectorId
    self.hasOpenManureFlow = hasOpenManureFlow
    self.isForced = isForced

    return self
end

function ManureSystemConnectorManureFlowEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteUIntN(streamId, self.connectorId - 1, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)
    streamWriteBool(streamId, self.hasOpenManureFlow)
    streamWriteBool(streamId, self.isForced)
end

function ManureSystemConnectorManureFlowEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.connectorId = streamReadUIntN(streamId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS) + 1
    self.hasOpenManureFlow = streamReadBool(streamId)
    self.isForced = streamReadBool(streamId)

    self:run(connection)
end

function ManureSystemConnectorManureFlowEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.vehicle)
    end

    self.vehicle:setIsManureFlowOpen(self.connectorId, self.hasOpenManureFlow, self.isForced, true)
end

function ManureSystemConnectorManureFlowEvent.sendEvent(vehicle, connectorId, hasOpenManureFlow, isForced, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemConnectorManureFlowEvent.new(vehicle, connectorId, hasOpenManureFlow, isForced), nil, nil, vehicle)
        else
            g_client:getServerConnection():sendEvent(ManureSystemConnectorManureFlowEvent.new(vehicle, connectorId, hasOpenManureFlow, isForced))
        end
    end
end
