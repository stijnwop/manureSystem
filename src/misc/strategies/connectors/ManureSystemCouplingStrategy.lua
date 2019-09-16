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

local ManureSystemCouplingStrategy_mt = Class(ManureSystemCouplingStrategy)

function ManureSystemCouplingStrategy:new(object, customMt)
    local instance = {}

    instance.object = object
    instance.couplingType = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)

    setmetatable(instance, customMt or ManureSystemCouplingStrategy_mt)

    return instance
end

function ManureSystemCouplingStrategy:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local object = self.object

    if object.isServer then
        local connectors = object:getConnectorsByType(self.couplingType)

        for _, connector in ipairs(connectors) do
            if connector.isConnected then
                local desc = connector.connectedObject:getConnectorObjectDesc(connector.connectedGrabNodeId)

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
    connector.connectedObject = nil
    connector.connectedGrabNodeId = nil
    connector.hasOpenManureFlow = false
    connector.lockAnimationName = getXMLString(xmlFile, key .. "#lockAnimationName")
    connector.manureFlowAnimationName = getXMLString(xmlFile, key .. "#manureFlowAnimationName")

    connector.jointOrigRot = { getRotation(connector.node) }
    connector.jointOrigTrans = { getTranslation(connector.node) }

    return true
end

function ManureSystemCouplingStrategy:delete(connector)
end
