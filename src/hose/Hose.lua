---
-- Hose
--
-- Base class for the Hose.
--
-- Copyright (c) Wopster, 2019

Hose = {}

local Hose_mt = Class(Hose, Object)

function Hose:new(isServer, isClient, mt)
    local hose = Object:new(isServer, isClient, mt or Hose_mt)

    return hose
end

function Hose:load(savegame)
    self.networkTimeInterpolator = InterpolationTime:new(1.2)
    self.physicsObjectDirtyFlag = self:getNextDirtyFlag()
end

function Hose:readStream(streamId, connection)
end

function Hose:writeStream(streamId, connection)
end

function Hose:readUpdateStream(streamId, timestamp, connection)
end

function Hose:writeUpdateStream(streamId, connection, dirtyMask)
end

function Hose:addToPhysics()
    if not self.isAddedToPhysics then
        local lastMotorizedNode = nil
        for _, component in pairs(self.components) do
            addToPhysics(component.node)
            if component.motorized then
                if lastMotorizedNode ~= nil then
                    if self.isServer then
                        addVehicleLink(lastMotorizedNode, component.node)
                    end
                end
                lastMotorizedNode = component.node
            end
        end
        self.isAddedToPhysics = true
        if self.isServer then
            for _, jointDesc in pairs(self.componentJoints) do
                self:createComponentJoint(self.components[jointDesc.componentIndices[1]], self.components[jointDesc.componentIndices[2]], jointDesc)
            end
            -- if rootnode is sleeping all other components are sleeping as well
            addWakeUpReport(self.rootNode, "onVehicleWakeUpCallback", self)
        end
        for _, collisionPair in pairs(self.collisionPairs) do
            setPairCollision(collisionPair.component1.node, collisionPair.component2.node, collisionPair.enabled)
        end
        self:setMassDirty()
    end
end

function Hose:removeFromPhysics()
end
