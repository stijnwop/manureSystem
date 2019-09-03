----------------------------------------------------------------------------------------------------
-- ManureSystemCouplingStrategy
----------------------------------------------------------------------------------------------------
-- Purpose: Normal connector strategy, to allow pumping with a hose.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemCouplingStrategy
ManureSystemCouplingStrategy = {}

local ManureSystemCouplingStrategy_mt = Class(ManureSystemCouplingStrategy)

function ManureSystemCouplingStrategy:new(object, customMt)
    local instance = {}

    instance.object = object

    setmetatable(instance, customMt or ManureSystemCouplingStrategy_mt)

    return instance
end

function ManureSystemCouplingStrategy:delete()
end

function ManureSystemCouplingStrategy:load(connector, xmlFile, key)
    connector.connectedHose = nil
    connector.hasOpenManureFlow = false
    connector.lockAnimationName = getXMLString(xmlFile, key .. "#lockAnimationName")
    connector.manureFlowAnimationName = getXMLString(xmlFile, key .. "#manureFlowAnimationName")

    connector.jointOrigRot = { getRotation(connector.node) }
    connector.jointOrigTrans = { getTranslation(connector.node) }

    return true
end

function ManureSystemCouplingStrategy:delete(connector)
end
