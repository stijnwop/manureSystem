--
-- ManureSystemThicknessEvent
--
-- Author: Stijn Wopereis
-- Description: Event to sync the thickness for placeables
-- Name: ManureSystemThicknessEvent
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemThicknessEvent
ManureSystemThicknessEvent = {}
local ManureSystemThicknessEvent_mt = Class(ManureSystemThicknessEvent, Event)

InitEventClass(ManureSystemThicknessEvent, "ManureSystemThicknessEvent")

---@return table
function ManureSystemThicknessEvent.emptyNew()
    return Event.new(ManureSystemThicknessEvent_mt)
end

---@return table
function ManureSystemThicknessEvent.new(placeable, fillUnitIndex, fillTypeIndex, thickness)
    local self = ManureSystemThicknessEvent.emptyNew()

    self.placeable = placeable
    self.fillUnitIndex = fillUnitIndex
    self.fillTypeIndex = fillTypeIndex
    self.thickness = thickness

    return self
end

---@return void
function ManureSystemThicknessEvent:readStream(streamId, connection)
    self.placeable = NetworkUtil.readNodeObject(streamId)
    self.fillUnitIndex = streamReadUInt8(streamId)
    self.fillTypeIndex = streamReadUIntN(streamId, FillTypeManager.SEND_NUM_BITS)
    self.thickness = streamReadFloat32(streamId)

    self:run(connection)
end

---@return void
function ManureSystemThicknessEvent:writeStream(streamId, connection)
    NetworkUtil.writeNodeObject(streamId, self.placeable)
    streamWriteUInt8(streamId, self.fillUnitIndex)
    streamWriteUIntN(streamId, self.fillTypeIndex, FillTypeManager.SEND_NUM_BITS)
    streamWriteFloat32(streamId, self.thickness)
end

---@return void
function ManureSystemThicknessEvent:run(connection)
    if not connection:getIsServer() then
        g_server:broadcastEvent(self, false, connection, self.placeable)
    end

    if self.placeable ~= nil and self.placeable:getIsSynchronized() then
        self.placeable:setThickness(self.fillUnitIndex, self.fillTypeIndex, self.thickness, true)
    end
end

---@return void
function ManureSystemThicknessEvent.sendEvent(placeable, fillUnitIndex, fillTypeIndex, thickness, noEventSend)
    if noEventSend == nil or noEventSend == false then
        if g_server ~= nil then
            g_server:broadcastEvent(ManureSystemThicknessEvent.new(placeable, fillUnitIndex, fillTypeIndex, thickness), nil, nil, placeable)
        else
            g_client:getServerConnection():sendEvent(ManureSystemThicknessEvent.new(placeable, fillUnitIndex, fillTypeIndex, thickness))
        end
    end
end
