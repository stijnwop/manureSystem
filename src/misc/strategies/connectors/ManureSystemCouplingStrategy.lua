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
ManureSystemCouplingStrategy.MAX_TIME_SCALE = 0.12

ManureSystemCouplingStrategy.PARK_DIRECTION_RIGHT = 1
ManureSystemCouplingStrategy.PARK_DIRECTION_LEFT = -1
ManureSystemCouplingStrategy.MIN_STANDALONE_CONNECTORS = 2

local ManureSystemCouplingStrategy_mt = Class(ManureSystemCouplingStrategy)

---Sort function on hasOpenManureFlow.
local sortConnectorsByManureFlowState = function(con1, con2)
    return con1.hasOpenManureFlow and not con2.hasOpenManureFlow
end

---Creates a new instance of ManureSystemCouplingStrategy.
---@return ManureSystemCouplingStrategy
function ManureSystemCouplingStrategy:new(object, type, customMt)
    local instance = {}
    setmetatable(instance, customMt or ManureSystemCouplingStrategy_mt)

    instance.object = object
    instance.connectorType = type

    return instance
end

function ManureSystemCouplingStrategy:onReadStream(connector, streamId, connection)
    local isConnected = streamReadBool(streamId)
    if streamReadBool(streamId) then
        connector.connectedNodeId = streamReadUIntN(streamId, ManureSystemEventBits.GRAB_NODES_SEND_NUM_BITS) + 1
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
        streamWriteUIntN(streamId, connector.connectedNodeId - 1, ManureSystemEventBits.GRAB_NODES_SEND_NUM_BITS)
        NetworkUtil.writeNodeObject(streamId, connector.connectedObject)
    end

    streamWriteBool(streamId, connector.hasOpenManureFlow)
end

---Called on update frame by the object that implements the connector strategy.
function ManureSystemCouplingStrategy:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local object = self.object

    --Only server sided.
    if not object.isServer then
        return
    end

    if g_manureSystem.debugShowConnectors then
        object:raiseActive()

        for _, connector in ipairs(object:getConnectorsByType(self.connectorType)) do
            DebugUtil.drawDebugNode(connector.node, "CONNECTOR NODE")
        end
    end

    --We don't have to search for possible source object on placeables.
    if object.getActiveConnectorsByType == nil then
        return
    end

    if object.isStandalonePump ~= nil and object:isStandalonePump() then
        self:findStandalonePumpObjects(object, dt)
    else
        self:findPumpObjects(object, dt)
    end
end

---Returns warning message when the manure flow is closed on connected hoses.
function ManureSystemCouplingStrategy:getPumpInvalidWarningMessage()
    local connectors = self.object:getActiveConnectorsByType(self.connectorType)

    for _, connector in ipairs(connectors) do
        if connector.isConnected and not connector.isParkPlace then
            --We have a closed manure flow.
            if not connector.hasOpenManureFlow then
                return g_i18n:getText("warning_checkManureFlow"):format(self.object:getName())
            end

            local desc = self:getConnectorObjectDesc(self.object, connector)
            --Target has closed manure flow.
            if desc ~= nil and desc.vehicle ~= nil and not desc.hasOpenManureFlow then
                return g_i18n:getText("warning_checkManureFlow"):format(desc.vehicle:getName())
            end
        end
    end

    return nil
end

---Set the pump efficiency time based on the given length.
function ManureSystemCouplingStrategy:getCalculatedMaxTime(length)
    local orgMaxTime = self.object:getOriginalPumpMaxTime()
    return orgMaxTime + orgMaxTime * ManureSystemCouplingStrategy.MAX_TIME_SCALE * length
end

---Resets the pump settings.
function ManureSystemCouplingStrategy:resetPumpTargetObject(object)
    if (object:getPumpTargetObject() ~= nil or object:getIsPumpSourceWater()) and object:getPumpSourceObject() ~= nil then
        object:setPumpTargetObject(nil, nil)
        object:setPumpSourceObject(nil, nil)
        object:setIsPumpSourceWater(false)
        object:setPumpMaxTime(object:getOriginalPumpMaxTime())
    end
end

---Sets standalone pump targets based on the given desc entries.
function ManureSystemCouplingStrategy:setStandalonePumpTargetObject(object, desc1, desc2)
    if desc2.isNearWater then
        object:setPumpSourceObject(desc1.vehicle, desc1.fillUnitIndex)
        object:setIsPumpSourceWater(true)
    else
        object:setPumpTargetObject(desc1.vehicle, desc1.fillUnitIndex)
        object:setPumpSourceObject(desc2.vehicle, desc2.fillUnitIndex)
    end
end

---Find pump objects for normal pumps.
function ManureSystemCouplingStrategy:findPumpObjects(object, dt)
    local connectors = object:getActiveConnectorsByType(self.connectorType)

    local didPumpTargetReset = false
    for _, connector in ipairs(connectors) do
        if g_manureSystem.debug then
            DebugUtil.drawDebugNode(connector.node, "ACTIVE CONNECTOR")
        end

        if connector.isConnected and not connector.isParkPlace then
            if not didPumpTargetReset then
                if object.spec_manureSystemPumpMotor ~= nil then
                    self:resetPumpTargetObject(object)
                    didPumpTargetReset = true
                end
            end

            local desc, length = self:getConnectorObjectDesc(object, connector)

            if object.spec_manureSystemPumpMotor ~= nil then
                if desc ~= nil and desc.hasOpenManureFlow and connector.hasOpenManureFlow then
                    object:setPumpMode(ManureSystemPumpMotor.MODE_CONNECTOR)

                    if desc.vehicle ~= nil then
                        object:setPumpTargetObject(desc.vehicle, desc.fillUnitIndex)
                        object:setPumpSourceObject(object, connector.fillUnitIndex)
                    elseif desc.isNearWater then
                        object:setPumpSourceObject(object, connector.fillUnitIndex)
                        object:setIsPumpSourceWater(true)
                    end

                    local impactTime = self:getCalculatedMaxTime(length)
                    object:setPumpMaxTime(impactTime)
                end
            end

            --When the desc is nil but our connector has open manure flow we slowly empty the object.
            if desc == nil then
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

---Find pump objects for standalone pumps.
function ManureSystemCouplingStrategy:findStandalonePumpObjects(object, dt)
    local connectors = ListUtil.copyTable(object:getActiveConnectorsByType(self.connectorType))

    if #connectors >= ManureSystemCouplingStrategy.MIN_STANDALONE_CONNECTORS then
        table.sort(connectors, sortConnectorsByManureFlowState)

        local connector1, connector2 = unpack(connectors, 1, 2)
        if connector1.isConnected and not connector1.isParkPlace
            and connector2.isConnected and not connector2.isParkPlace then
            local desc1, lengthHoses1 = self:getConnectorObjectDesc(object, connector1)
            local desc2, lengthHoses2 = self:getConnectorObjectDesc(object, connector2)

            if desc1 ~= nil and desc1.hasOpenManureFlow and desc2 ~= nil and desc2.hasOpenManureFlow then
                if desc1.vehicle ~= nil then
                    self:setStandalonePumpTargetObject(object, desc1, desc2)
                elseif desc2.vehicle ~= nil then
                    self:setStandalonePumpTargetObject(object, desc2, desc1)
                end

                local impactTime = self:getCalculatedMaxTime(lengthHoses1 + lengthHoses2)
                object:setPumpMaxTime(impactTime)
                object:setPumpMode(ManureSystemPumpMotor.MODE_CONNECTOR)
            else
                self:resetPumpTargetObject(object)
            end
        else
            self:resetPumpTargetObject(object)
        end
    elseif #connectors > 0 then
        local connector1 = unpack(connectors, 1)
        if connector1.isConnected and not connector1.isParkPlace then
            local desc1, lengthHoses1 = self:getConnectorObjectDesc(object, connector1)

            if desc1 ~= nil and desc1.hasOpenManureFlow then
                if desc1.vehicle ~= nil then
                    local fillType = desc1.vehicle:getFillUnitFillType(desc1.fillUnitIndex)
                    local sourceObject, sourceFillUnitIndex = ManureSystemPumpMotor.getAttachedPumpSourceObject(object, fillType)
                    if sourceObject ~= nil then
                        local desc2 = { vehicle = sourceObject, isNearWater = false, fillUnitIndex = sourceFillUnitIndex }
                        object:setPumpSourceObject(sourceObject, sourceFillUnitIndex)
                        self:setStandalonePumpTargetObject(object, desc1, desc2)

                        local impactTime = self:getCalculatedMaxTime(lengthHoses1)
                        object:setPumpMaxTime(impactTime)
                        object:setPumpMode(ManureSystemPumpMotor.MODE_CONNECTOR)
                    end
                end
            else
                self:resetPumpTargetObject(object)
            end
        else
            self:resetPumpTargetObject(object)
        end
    end
end

function ManureSystemCouplingStrategy:getConnectorObjectDesc(object, connector)
    local desc, length = connector.connectedObject:getConnectorObjectDesc(connector.connectedNodeId, 1, true) -- do raycast too.

    if desc ~= nil and desc.vehicle ~= object then
        if desc.connectorId ~= nil then
            local descConnector = desc.vehicle:getConnectorById(desc.connectorId)

            if connector.hasOpenManureFlow and descConnector.isConnected then
                return {
                    vehicle = desc.vehicle,
                    hasOpenManureFlow = descConnector.hasOpenManureFlow,
                    fillUnitIndex = descConnector.fillUnitIndex
                }, length
            end
        else
            local hasOpenManureFlow = true
            if desc.vehicle ~= nil then
                -- Raycasted object.
                return {
                    vehicle = desc.vehicle,
                    hasOpenManureFlow = hasOpenManureFlow,
                    fillUnitIndex = 1
                }, length
            else
                -- Pump from water.
                return {
                    isNearWater = desc.isNearWater,
                    hasOpenManureFlow = hasOpenManureFlow
                }, length
            end
        end
    end

    return nil, length
end

function ManureSystemCouplingStrategy:load(connector, xmlFile, key)
    connector.hasOpenManureFlow = false

    if not connector.hasSharedSet then
        connector.lockAnimationName = getXMLString(xmlFile, key .. "#lockAnimationName")
        connector.lockAnimationIndex = getXMLInt(xmlFile, key .. "#lockAnimationIndex")
        connector.manureFlowAnimationName = getXMLString(xmlFile, key .. "#manureFlowAnimationName")
        connector.manureFlowAnimationIndex = getXMLInt(xmlFile, key .. "#manureFlowAnimationIndex")
    end

    connector.jointOrigRot = { getRotation(connector.node) }
    connector.jointOrigTrans = { getTranslation(connector.node) }

    if connector.isParkPlace then
        connector.parkPlaceLength = Utils.getNoNil(getXMLFloat(xmlFile, key .. "#parkPlaceLength"), 5) -- Default length of 5m

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

function ManureSystemCouplingStrategy:loadSharedSetConnectorAttributes(xmlFile, key, connector, connectorNode, sharedConnector)
    local connectorNodeIndex = getUserAttribute(connectorNode, "connectorNode")
    if connectorNodeIndex ~= nil then
        connector.node = I3DUtil.indexToObject(connectorNode, connectorNodeIndex)
    else
        connector.node = connectorNode
    end

    ManureSystemUtil.setSharedSetNodeMaterialColor(xmlFile, key, connectorNode)
end

function ManureSystemCouplingStrategy:loadSharedSetConnectorAnimation(xmlFile, key, connector, connectorNode, connectorAnimationName, sharedConnector)
    if sharedConnector.hasAnimation then
        local spec_animatedVehicle = self.object.spec_animatedVehicle
        if spec_animatedVehicle ~= nil then
            local animation = {}
            if ManureSystemUtil.loadSharedAnimation(self.object, xmlFile, key, animation, connectorNode) then
                animation.name = connector.id .. animation.name -- make animation unique for the vehicle.
                spec_animatedVehicle.animations[animation.name] = animation
                -- Set the loaded animation as given connector animation name.
                connector[connectorAnimationName] = animation.name
            end
        else
            g_logManager:xmlError(self.object.configFileName, ("Shared %s animation can't be added as the vehicle does not have the AnimatedVehicle spec."):format(connectorAnimationName))
        end
    end
end

function ManureSystemCouplingStrategy:loadFromSavegame(connector, xmlFile, key)
    if connector.isConnected then
        self.object:setIsManureFlowOpen(connector.id, getXMLBool(xmlFile, key .. "#hasOpenManureFlow"), true)
    end
end

function ManureSystemCouplingStrategy:saveToSavegame(connector, xmlFile, key)
    setXMLBool(xmlFile, key .. "#hasOpenManureFlow", connector.isConnected and connector.hasOpenManureFlow)
end
