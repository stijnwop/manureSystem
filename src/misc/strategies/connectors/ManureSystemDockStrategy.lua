----------------------------------------------------------------------------------------------------
-- ManureSystemDockStrategy
----------------------------------------------------------------------------------------------------
-- Purpose: Dock connector strategy, to allow pumping with a docking arm.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemDockStrategy
ManureSystemDockStrategy = {}

ManureSystemDockStrategy.DEFORMATION_ROTATION_LIMIT = math.rad(35) -- we have 35° limit on the deformation
ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET = 0.001
ManureSystemDockStrategy.DEFORMATION_TRANSLATION_MULTIPLIER = 0.01
ManureSystemDockStrategy.DEFORMATION_RESET_TIME = 2500 -- ms
ManureSystemDockStrategy.DOCK_IN_RANGE_DISTANCE = 0.25
ManureSystemDockStrategy.DOCK_IN_RANGE_Y_OFFSET = 0.5
ManureSystemDockStrategy.DOCK_DEFORM_Y_MAX = 0.1 -- maximum amount that the fillArm is allowed to push on the funnel
ManureSystemDockStrategy.MIN_REFERENCES = 1

local ManureSystemDockStrategy_mt = Class(ManureSystemDockStrategy)

function ManureSystemDockStrategy:new(object, customMt)
    local instance = {}

    instance.object = object
    instance.dockingArmObjects = {}
    instance.dockingArmObjectsDelayedDelete = {}

    if object.isClient then
        instance.lastInRangeConnectorIds = {}
    end

    setmetatable(instance, customMt or ManureSystemDockStrategy_mt)

    return instance
end

function ManureSystemDockStrategy:onUpdate(dt)
    local object = self.object

    if #self.dockingArmObjects ~= 0 then
        object:raiseActive()
    end

    for _, dockingArmObject in pairs(self.dockingArmObjects) do
        local inRange, connectorId = self:getDockArmInRange(dockingArmObject)

        if object.isClient and inRange then
            self:deformDockFunnel(connectorId, true, dt, dockingArmObject)
        end

        if object.isServer and dockingArmObject ~= nil and dockingArmObject ~= object then
            if inRange then
                local connector = object:getConnectorById(connectorId)
                if not connector.isParkPlace then
                    local fillArm = dockingArmObject:getFillArm()
                    dockingArmObject:setPumpTargetObject(object, connector.fillUnitIndex)
                    dockingArmObject:setPumpSourceObject(dockingArmObject, fillArm.fillUnitIndex)
                    --object:setIsDockUsed(referenceId, inrange, dockingArmObject)

                    fillArm.isRaycastAllowed = false
                end
            elseif dockingArmObject:getPumpTargetObject() ~= nil then
                dockingArmObject:setPumpTargetObject(nil, nil)
            end
        end

        if not inRange and self.dockingArmObjectsDelayedDelete[dockingArmObject] ~= nil and self.dockingArmObjectsDelayedDelete[dockingArmObject] < g_currentMission.time then
            self.dockingArmObjectsDelayedDelete[dockingArmObject] = nil
            ListUtil.removeElementFromList(self.dockingArmObjects, dockingArmObject)
        end
    end

    if object.isClient then
        -- Reset dock funnels
        for connectorId, inRange in pairs(self.lastInRangeConnectorIds) do
            if not inRange then
                self:deformDockFunnel(connectorId, false, dt)
            end
        end
    end
end

function ManureSystemDockStrategy:getDockArmInRange(object)
    if object ~= nil then
        local fillArm = object:getFillArm()

        if fillArm.node ~= nil and entityExists(fillArm.node) then
            local x, y, z = getWorldTranslation(fillArm.node)
            local distanceSequence = ManureSystemDockStrategy.DOCK_IN_RANGE_DISTANCE

            for _, connector in pairs(self.object:getConnectorsByType(fillArm.type)) do
                local connectorId = connector.id -- Use the actual index
                if (not connector.isConnected or connector.dockingArmObject ~= nil and connector.dockingArmObject == object) and connector.deformationNode ~= nil then
                    local dx, dy, dz = getWorldTranslation(connector.deformationNode)
                    local distance = MathUtil.vector2Length(x - dx, z - dz)

                    distanceSequence = Utils.getNoNil(connector.inRangeDistance, distanceSequence)

                    if distance < distanceSequence
                        and y < dy + connector.deformationYOffset
                        and y > dy - (connector.deformationYOffset * 0.5) then

                        distanceSequence = distance
                        return true, connectorId
                    else
                        -- When connector was in range we force reset.
                        if self.lastInRangeConnectorIds[connectorId] then
                            self.lastInRangeConnectorIds[connectorId] = false
                        end
                    end
                end
            end
        end
    end

    return false, nil
end

function ManureSystemDockStrategy:deformDockFunnel(connectorId, doDeform, dt, dockingArmObject)
    local connector = self.object:getConnectorById(connectorId)

    if doDeform then
        local fillArm = dockingArmObject:getFillArm()
        local x, y, z = worldToLocal(connector.deformationNode, getWorldTranslation(fillArm.node))
        local rx, _, rz = getRotation(connector.deformationNode)
        local pushImpact = connector.deformationYOffset * 0.5 -- Start halfway the offset with pushing
        local speedFactor = (y - pushImpact) * ManureSystemDockStrategy.DEFORMATION_TRANSLATION_MULTIPLIER * dt

        connector.deformationNodeLastTrans[2] = MathUtil.clamp(connector.deformationNodeLastTrans[2] + speedFactor, connector.deformationNodeOrgTrans[2] - connector.deformationYMaxPush, connector.deformationNodeOrgTrans[2])
        connector.deformationNodeLastTrans = { connector.deformationNodeOrgTrans[1], connector.deformationNodeLastTrans[2], connector.deformationNodeOrgTrans[3] }

        setTranslation(connector.deformationNode, unpack(connector.deformationNodeLastTrans))

        rx = MathUtil.clamp(rx + z * 0.5 - ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET, -ManureSystemDockStrategy.DEFORMATION_ROTATION_LIMIT, ManureSystemDockStrategy.DEFORMATION_ROTATION_LIMIT)
        rz = MathUtil.clamp(rz - x * 0.5 - ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET, -ManureSystemDockStrategy.DEFORMATION_ROTATION_LIMIT, ManureSystemDockStrategy.DEFORMATION_ROTATION_LIMIT)
        connector.deformationNodeLastRot = { rx, connector.deformationNodeOrgRot[2], rz }

        setRotation(connector.deformationNode, unpack(connector.deformationNodeLastRot))

        if self.lastInRangeConnectorIds[connectorId] == nil then
            self.lastInRangeConnectorIds[connectorId] = true
        end
    else
        if connector.deformationNodeLastTrans[2] ~= connector.deformationNodeOrgTrans[2] then
            setTranslation(connector.deformationNode, unpack(connector.deformationNodeOrgTrans))
        end

        if connector.deformationNodeLastRot[1] ~= connector.deformationNodeOrgRot[1] or connector.deformationNodeLastRot[3] ~= connector.deformationNodeOrgRot[3] then
            if math.abs(connector.deformationNodeLastRot[1]) < ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET and math.abs(connector.deformationNodeLastRot[3]) < ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET then
                connector.deformationNodeLastRot[1] = connector.deformationNodeOrgRot[1]
                connector.deformationNodeLastRot[3] = connector.deformationNodeOrgRot[3]

                self.lastInRangeConnectorIds[connectorId] = nil
            else
                local speedFactor = (ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET * 1000) - (dt * ManureSystemDockStrategy.DEFORMATION_ROTATION_OFFSET) * (2 * math.pi)

                if connector.deformationNodeLastRot[1] < connector.deformationNodeOrgRot[1] then
                    connector.deformationNodeLastRot[1] = math.min(connector.deformationNodeLastRot[1] * speedFactor, connector.deformationNodeOrgRot[1])
                else
                    connector.deformationNodeLastRot[1] = math.max(connector.deformationNodeLastRot[1] * speedFactor, connector.deformationNodeOrgRot[1])
                end

                if connector.deformationNodeLastRot[3] < connector.deformationNodeOrgRot[3] then
                    connector.deformationNodeLastRot[3] = math.min(connector.deformationNodeLastRot[3] * speedFactor, connector.deformationNodeOrgRot[3])
                else
                    connector.deformationNodeLastRot[3] = math.max(connector.deformationNodeLastRot[3] * speedFactor, connector.deformationNodeOrgRot[3])
                end
            end

            setRotation(connector.deformationNode, unpack(connector.deformationNodeLastRot))
        end
    end
end

function ManureSystemDockStrategy:load(connector, xmlFile, key)
    local deformationNode = ManureSystemXMLUtil.getOrCreateNode(self.object, xmlFile, key .. ".funnel")

    if deformationNode ~= nil then
        connector.deformationNode = deformationNode
        connector.deformationNodeOrgTrans = { getTranslation(deformationNode) }
        connector.deformationNodeOrgRot = { getRotation(deformationNode) }
        connector.deformationNodeLastTrans = connector.deformationNodeOrgTrans
        connector.deformationNodeLastRot = connector.deformationNodeOrgRot
        connector.deformationYOffset = Utils.getNoNil(getXMLFloat(xmlFile, key .. ".funnel#deformationYOffset"), ManureSystemDockStrategy.DOCK_IN_RANGE_Y_OFFSET)
        connector.deformationYMaxPush = Utils.getNoNil(getXMLFloat(xmlFile, key .. ".funnel#deformationYMaxPush"), ManureSystemDockStrategy.DOCK_DEFORM_Y_MAX)
        connector.dockingArmObject = nil
    else
        g_logManager:xmlError(self.object.configFileName, "DeformationNode not found!")
        return false
    end

    if hasXMLProperty(xmlFile, key .. ".trigger") then
        local funnelTrigger = clone(g_manureSystem.connectorManager.collision, false, false, true)
        local funnelLinkNode = I3DUtil.indexToObject(self.object.components, getXMLString(xmlFile, key .. ".trigger#linkNode"), self.object.i3dMappings)

        if funnelLinkNode ~= nil then
            local translation = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. ".trigger#position")) }
            if translation[1] ~= nil and translation[2] ~= nil and translation[3] ~= nil then
                setTranslation(funnelTrigger, unpack(translation))
            end

            local rotation = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. ".trigger#rotation")) }
            if rotation[1] ~= nil and rotation[2] ~= nil and rotation[3] ~= nil then
                setRotation(funnelTrigger, MathUtil.degToRad(rotation[1]), MathUtil.degToRad(rotation[2]), MathUtil.degToRad(rotation[3]))
            end

            link(funnelLinkNode, funnelTrigger)
            connector.trigger = funnelTrigger
            addTrigger(connector.trigger, "dockingArmEnteredTriggerCallback", self)
        end
    else
        addTrigger(connector.node, "dockingArmEnteredTriggerCallback", self)
    end

    return true
end

function ManureSystemDockStrategy:delete(connector)
    if connector.trigger ~= nil then
        removeTrigger(connector.trigger)
    elseif connector.node ~= nil then
        removeTrigger(connector.node)
    end
end

function ManureSystemDockStrategy:dockingArmEnteredTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId)
    if otherActorId ~= 0 then
        local object = g_currentMission:getNodeObject(otherActorId)
        if object ~= nil and object.getFillArm ~= nil then
            if onEnter then
                if self.dockingArmObjectsDelayedDelete[object] ~= nil then
                    self.dockingArmObjectsDelayedDelete[object] = nil
                else
                    table.insert(self.dockingArmObjects, object)
                end
            else
                self.dockingArmObjectsDelayedDelete[object] = g_currentMission.time + ManureSystemDockStrategy.DEFORMATION_RESET_TIME
            end
        end
    end
end
