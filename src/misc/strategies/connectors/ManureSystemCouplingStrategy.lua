----------------------------------------------------------------------------------------------------
-- ManureSystemCouplingStrategy
----------------------------------------------------------------------------------------------------
-- Purpose: Normal connector strategy, to allow pumping with a hose.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemCouplingStrategy
ManureSystemCouplingStrategy = {}

ManureSystemCouplingStrategy.EMPTY_LITER_PER_SECOND = 25

ManureSystemCouplingStrategy.PARK_DIRECTION_RIGHT = 1
ManureSystemCouplingStrategy.PARK_DIRECTION_LEFT = -1

local ManureSystemCouplingStrategy_mt = Class(ManureSystemCouplingStrategy)

function ManureSystemCouplingStrategy:new(object, customMt)
    local instance = {}

    instance.object = object
    instance.couplingType = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)

    setmetatable(instance, customMt or ManureSystemCouplingStrategy_mt)

    return instance
end

function ManureSystemCouplingStrategy:onReadStream(connector, streamId, connection)
    local isConnected = streamReadBool(streamId)
    if streamReadBool(streamId) then
        connector.connectedNodeId = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS) + 1
        connector.connectedObject = NetworkUtil.readNodeObject(streamId)
    end

    self.object:setIsConnected(connector.id, isConnected, connector.connectedNodeId, connector.connectedObject, true)
    local hasOpenManureFlow = streamReadBool(streamId)
    self.object:setIsManureFlowOpen(connector.id, hasOpenManureFlow, true, true)
end

function ManureSystemCouplingStrategy:onWriteStream(connector, streamId, connection)
    streamWriteBool(streamId, connector.isConnected)
    streamWriteBool(streamId, connector.connectedNodeId ~= nil)

    if connector.connectedNodeId ~= nil then
        streamWriteUIntN(streamId, connector.connectedNodeId - 1, Hose.GRAB_NODES_SEND_NUM_BITS)
        NetworkUtil.writeNodeObject(streamId, connector.connectedObject)
    end

    streamWriteBool(streamId, connector.hasOpenManureFlow)
end

function ManureSystemCouplingStrategy:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local object = self.object

    if object.isServer then
        local connectors = object:getConnectorsByType(self.couplingType)

        for _, connector in ipairs(connectors) do
            if connector.isConnected and not connector.isParkPlace then
                local desc = connector.connectedObject:getConnectorObjectDesc(connector.connectedNodeId)

                if desc ~= nil and desc.vehicle ~= object and object.spec_manureSystemPumpMotor ~= nil then
                    local descConnector = desc.vehicle:getConnectorById(desc.connectorId)

                    if connector.hasOpenManureFlow and descConnector.hasOpenManureFlow then
                        object:setPumpTargetObject(desc.vehicle, descConnector.fillUnitIndex)
                        object:setPumpSourceObject(object, connector.fillUnitIndex)
                    elseif object:getPumpTargetObject() ~= nil then
                        object:setPumpTargetObject(nil, nil)
                    end
                else
                    if connector.hasOpenManureFlow and connector.manureFlowAnimationName ~= nil then
                        local fillType = object:getFillUnitFillType(connector.fillUnitIndex)
                        local fillLevel = object:getFillUnitFillLevel(connector.fillUnitIndex)

                        if fillLevel > 0 then
                            local deltaFillLevel = math.min(ManureSystemCouplingStrategy.EMPTY_LITER_PER_SECOND * dt * 0.001, fillLevel)
                            object:addFillUnitFillLevel(object:getOwnerFarmId(), connector.fillUnitIndex, -deltaFillLevel, fillType, ToolType.UNDEFINED, nil)
                        end
                    end
                end
            end
        end
    end
end

function ManureSystemCouplingStrategy:load(connector, xmlFile, key)
    connector.hasOpenManureFlow = false
    connector.lockAnimationName = getXMLString(xmlFile, key .. "#lockAnimationName")
    connector.manureFlowAnimationName = getXMLString(xmlFile, key .. "#manureFlowAnimationName")

    connector.jointOrigRot = { getRotation(connector.node) }
    connector.jointOrigTrans = { getTranslation(connector.node) }

    if connector.isParkPlace then
        connector.parkPlaceAnimationName = getXMLString(xmlFile, key .. "#parkPlaceAnimationName")
        connector.parkPlaceLength = Utils.getNoNil(getXMLFloat(xmlFile, key .. "#parkPlaceAnimationNameLength"), 5) -- Default length of 5m

        connector.parkOffsetThreshold = Utils.getNoNil(getXMLFloat(xmlFile, key .. "#parkOffsetThreshold"), 0)
        local parkDirection = Utils.getNoNil(getXMLString(xmlFile, key .. "#parkDirection"), "right")
        connector.parkDirection = parkDirection:lower() ~= "right" and ManureSystemCouplingStrategy.PARK_DIRECTION_LEFT or ManureSystemCouplingStrategy.PARK_DIRECTION_RIGHT
        connector.parkStartTransOffset = Utils.getNoNil(StringUtil.getVectorNFromString(getXMLString(xmlFile, key .. "#parkStartTransOffset"), 3), { 0, 0, 0 })
        connector.parkStartRotOffset = Utils.getNoNil(StringUtil.getRadiansFromString(getXMLString(xmlFile, key .. "#parkStartRotOffset"), 3), { 0, 0, 0 })
        connector.parkEndTransOffset = Utils.getNoNil(StringUtil.getVectorNFromString(getXMLString(xmlFile, key .. "#parkEndTransOffset"), 3), { 0, 0, 0 })
        connector.parkEndRotOffset = Utils.getNoNil(StringUtil.getRadiansFromString(getXMLString(xmlFile, key .. "#parkEndRotOffset"), 3), { 0, 0, 0 })

        local lengthNode = createTransformGroup(("connector_length_node_%d"):format(connector.id))
        local x, y, z = 0, 0, connector.parkPlaceLength * connector.parkDirection

        link(connector.node, lengthNode)
        setTranslation(lengthNode, x, y, z)
        connector.parkPlaceLengthNode = lengthNode
    end

    return true
end

function ManureSystemCouplingStrategy:delete(connector)
    if connector.isConnected and connector.connectedObject ~= nil then
        connector.connectedObject:detach(connector.connectedNodeId, connector.id, self.object, true)
    end

    if connector.isParkPlace then
        delete(connector.parkPlaceLengthNode)
    end
end
