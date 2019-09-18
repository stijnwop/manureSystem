----------------------------------------------------------------------------------------------------
-- ManureSystemConnectorManager
----------------------------------------------------------------------------------------------------
-- Purpose: Manager to handle the connectors.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnectorManager
ManureSystemConnectorManager = {}
ManureSystemConnectorManager.COLLISION_MASK = 1088430080

ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK = "dock"
ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING = "coupling"
ManureSystemConnectorManager.CONNECTOR_TYPE_TRANSFER_HOSE = "transfer"

local ManureSystemConnectorManager_mt = Class(ManureSystemConnectorManager, AbstractManager)

function ManureSystemConnectorManager:new(customMt)
    local self = AbstractManager:new(customMt or ManureSystemConnectorManager_mt)

    self:initDataStructures()

    return self
end

function ManureSystemConnectorManager:initDataStructures()
    self.typeByName = {}
    self.numTypes = 0
end

function ManureSystemConnectorManager:loadMapData()
    ManureSystemConnectorManager:superClass().loadMapData(self)
    self:loadDefaultConnectorTypes()

    local collisionRoot = g_i3DManager:loadSharedI3DFile("resources/collisions/connectorCollision.i3d", g_manureSystem.modDirectory, false, true, false)
    self.collision = getChildAt(collisionRoot, 0)
    setCollisionMask(self.collision, ManureSystemConnectorManager.COLLISION_MASK)
    setRigidBodyType(self.collision, "Kinematic")
end

function ManureSystemConnectorManager:unloadMapData()
    ManureSystemConnectorManager:superClass().unloadMapData(self)
    delete(self.collision)
end

function ManureSystemConnectorManager:loadDefaultConnectorTypes()
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_TRANSFER_HOSE)
end

function ManureSystemConnectorManager:formatTypeKey(name)
    return ("CONNECTOR_TYPE_%s"):format(name:upper())
end

function ManureSystemConnectorManager:getConnectorType(name)
    local key = self:formatTypeKey(name)

    if self.typeByName[key] ~= nil then
        return self.typeByName[key]
    end

    return nil
end

function ManureSystemConnectorManager:addConnectorType(name)
    local key = self:formatTypeKey(name)

    if self.typeByName[key] == nil then
        self.numTypes = self.numTypes + 1
        self.typeByName[key] = self.numTypes
    else
        print(string.format("Warning: connector type '%s' already exits!", name))
    end
end

function ManureSystemConnectorManager:getConnectorStrategy(type, object)
    if type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING) then
        return ManureSystemCouplingStrategy:new(object)
    elseif type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK) then
        return ManureSystemDockStrategy:new(object)
    end

    return nil
end
