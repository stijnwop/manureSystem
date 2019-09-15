----------------------------------------------------------------------------------------------------
-- ManureSystemConnectorIsConnectedEvent
----------------------------------------------------------------------------------------------------
-- Purpose: Event to sync the is the connected state.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

ManureSystemConnectorIsConnectedEvent = {}
local ManureSystemConnectorIsConnectedEvent_mt = Class(ManureSystemConnectorIsConnectedEvent, Event)

InitEventClass(ManureSystemConnectorIsConnectedEvent, "ManureSystemConnectorIsConnectedEvent")

function ManureSystemConnectorIsConnectedEvent:emptyNew()
    local self = Event:new(ManureSystemConnectorIsConnectedEvent_mt)

    return self
end

function ManureSystemConnectorIsConnectedEvent:new(vehicle, connectorId, isConnected, grabNodeId, hose)
    local self = ManureSystemConnectorIsConnectedEvent:emptyNew()

    self.vehicle = vehicle
    self.isConnected = isConnected
    self.connectorId = connectorId
    self.grabNodeId = grabNodeId
    self.hose = hose

    return self
end

function ManureSystemConnectorIsConnectedEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.vehicle)
    streamWriteBool(streamId, self.isConnected)
    streamWriteUIntN(streamId, self.connectorId - 1, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)

    if self.isConnected then
        streamWriteUIntN(streamId, self.grabNodeId - 1, Hose.GRAB_NODES_SEND_NUM_BITS)
        NetworkUtil.writeNodeObject(streamId, self.hose)
    end
end

function ManureSystemConnectorIsConnectedEvent:readStream(streamId, connection)
    self.vehicle = NetworkUtil.readNodeObject(streamId)
    self.isConnected = streamReadBool(streamId)
    self.connectorId = streamReadUIntN(streamId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS) + 1

    if self.isConnected then
        self.grabNodeId = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS) + 1
        self.hose = NetworkUtil.readNodeObject(streamId)
    end

    self:run(connection)
end

function ManureSystemConnectorIsConnectedEvent:run(connection)
    -- Send from server to all clients
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.vehicle)
    end

    self.vehicle:setIsConnected(self.connectorId, self.isConnected, self.grabNodeId, self.hose, true)
end

function ManureSystemConnectorIsConnectedEvent.sendEvent(vehicle, connectorId, isConnected, grabNodeId, hose, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemConnectorIsConnectedEvent:new(vehicle, connectorId, isConnected, grabNodeId, hose), nil, nil, vehicle)
        else
            g_client:getServerConnection():sendEvent(ManureSystemConnectorIsConnectedEvent:new(vehicle, connectorId, isConnected, grabNodeId, hose))
        end
    end
end
