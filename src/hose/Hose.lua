---
-- Hose
--
-- Base class for the Hose.
--
-- Copyright (c) Wopster, 2019

Hose = {}

Hose.STATE_ATTACHED = 0
Hose.STATE_DETACHED = 1
Hose.STATE_CONNECTED = 2
Hose.STATE_PARKED = 3

Hose.GRAB_NODES_SEND_NUM_BITS = 2 -- 2 ^ 2

Hose.RAYCAST_DISTANCE = 3
Hose.RAYCAST_MASK = 32 + 64 + 128 + 256 + 4096

Hose.CONNECTOR_SEQUENCE = 0.6 * 0.6
Hose.VEHICLE_CONNECTOR_SEQUENCE = 6 * 6

function Hose.prerequisitesPresent(specializations)
    return true
end

function Hose.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "computeCatmullSpline", Hose.computeCatmullSpline)
    SpecializationUtil.registerFunction(vehicleType, "isaHose", Hose.isaHose)
    SpecializationUtil.registerFunction(vehicleType, "getGrabNodes", Hose.getGrabNodes)
    SpecializationUtil.registerFunction(vehicleType, "getGrabNodeById", Hose.getGrabNodeById)
    SpecializationUtil.registerFunction(vehicleType, "getClosestGrabNode", Hose.getClosestGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "grab", Hose.grab)
    SpecializationUtil.registerFunction(vehicleType, "drop", Hose.drop)
    SpecializationUtil.registerFunction(vehicleType, "attach", Hose.attach)
    SpecializationUtil.registerFunction(vehicleType, "detach", Hose.detach)
    SpecializationUtil.registerFunction(vehicleType, "connectGrabNode", Hose.connectGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "disconnectGrabNode", Hose.disconnectGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "parkHose", Hose.parkHose)
    SpecializationUtil.registerFunction(vehicleType, "unparkHose", Hose.unparkHose)
    SpecializationUtil.registerFunction(vehicleType, "raiseHoseActive", Hose.raiseHoseActive)
    SpecializationUtil.registerFunction(vehicleType, "isAttached", Hose.isAttached)
    SpecializationUtil.registerFunction(vehicleType, "isDetached", Hose.isDetached)
    SpecializationUtil.registerFunction(vehicleType, "isConnected", Hose.isConnected)
    SpecializationUtil.registerFunction(vehicleType, "findConnector", Hose.findConnector)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorObjectDesc", Hose.getConnectorObjectDesc)
    SpecializationUtil.registerFunction(vehicleType, "constructConnectorJoint", Hose.constructConnectorJoint)
end

function Hose.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onPreDelete", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateInterpolation", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onReadUpdateStream", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteUpdateStream", Hose)
end

function Hose:onLoad(savegame)
    self.spec_hose = ManureSystemUtil.getSpecTable(self, "hose")

    local spec = self.spec_hose

    spec.connectorType = g_manureSystem.connectorManager:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)

    spec.grabNodes = {}
    spec.grabNodesToVehicles = {}

    Hose.loadGrabNodes(self)

    if self.isClient then
        spec.mesh = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#mesh"), self.i3dMappings)
        spec.targetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#targetNode"), self.i3dMappings)
        spec.centerNode1 = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#centerNode1"), self.i3dMappings)
        spec.centerNode2 = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#centerNode2"), self.i3dMappings)

        local offset = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#offset"), 0.25)
        local startTrans = { getWorldTranslation(spec.mesh) }
        local endTrans = { getWorldTranslation(spec.targetNode) }
        local length = MathUtil.vector3Length(endTrans[1] - startTrans[1], endTrans[2] - startTrans[2], endTrans[3] - startTrans[3])

        spec.length = (Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#length"), length)) - offset * 2

        setShaderParameter(spec.mesh, "cv0", 0, 0, -spec.length, 0, false)
        setShaderParameter(spec.mesh, "cv1", 0, 0, 0, 0, false)
        local x, y, z = localToLocal(spec.targetNode, spec.mesh, 0, 0, spec.length)
        setShaderParameter(spec.mesh, "cv3", x, y, z, 0, false)
    end

    spec.foundVehicleId = 0
    spec.foundConnectorId = 0
    spec.foundGrabNodeId = 0

    if self.isServer then
        spec.foundVehicleIdSend = 0
        spec.foundConnectorIdSend = 0
        spec.foundGrabNodeIdSend = 0
    end

    spec.dirtyFlag = self:getNextDirtyFlag()
end

function Hose:onLoadFinished(savegame)
    if self.isClient then
        self:computeCatmullSpline()
    end

    if self.isServer then
        for _, joint in ipairs(self.componentJoints) do
            joint.orgRotLimit = ListUtil.copyTable(joint.rotLimit)
            joint.orgRotMinLimit = ListUtil.copyTable(joint.rotMinLimit)
        end
    end
end

function Hose:onPreDelete()
    local spec = self.spec_hose

    for id, grabNode in ipairs(spec.grabNodes) do
        if self:isAttached(grabNode) then
            self:drop(id, grabNode.player, true)
        elseif self:isConnected(grabNode) then
            local desc = spec.grabNodesToVehicles[id]
            if desc ~= nil then
                self:detach(id, desc.connectorId, desc.vehicle, true)
            end
        end
    end
end

function Hose:onReadUpdateStream(streamId, timestamp, connection)
    if connection:getIsServer() then
        if streamReadBool(streamId) then
            local spec = self.spec_hose
            spec.foundVehicleId = NetworkUtil.readNodeObjectId(streamId)
            spec.foundConnectorId = streamReadUIntN(streamId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)
            spec.foundGrabNodeId = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS)
        end
    end
end

function Hose:onWriteUpdateStream(streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        local spec = self.spec_hose
        if streamWriteBool(streamId, bitAND(dirtyMask, spec.dirtyFlag) ~= 0) then
            NetworkUtil.writeNodeObjectId(streamId, spec.foundVehicleId)
            streamWriteUIntN(streamId, spec.foundConnectorId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)
            streamWriteUIntN(streamId, spec.foundGrabNodeId, Hose.GRAB_NODES_SEND_NUM_BITS)
        end
    end
end

function Hose:onUpdateInterpolation(dt)
    if self.isClient then
        self:computeCatmullSpline()
    end
end

function Hose:onUpdate(dt)
    if self.isClient then
        local spec = self.spec_hose
    end
end

function Hose:onUpdateTick(dt)
    local spec = self.spec_hose
end

function Hose:findConnector(id)
    if not self.isServer then
        return
    end

    local spec = self.spec_hose

    spec.foundVehicleId = 0
    spec.foundConnectorId = 0
    spec.foundGrabNodeId = 0

    local grabNode = self:getGrabNodeById(id)
    if grabNode ~= nil then
        if self:isAttached(grabNode) or self:isConnected(grabNode) then
            local x, y, z = getWorldTranslation(grabNode.node)

            local vehicles = g_manureSystem:getConnectorVehicles()
            for _, vehicle in pairs(vehicles) do
                local vx, _, vz = getWorldTranslation(vehicle.components[1].node)
                local distanceToVehicle = MathUtil.vector2LengthSq(x - vx, z - vz)

                if distanceToVehicle < Hose.VEHICLE_CONNECTOR_SEQUENCE then
                    for connectorId, connector in ipairs(vehicle:getConnectorsByType(spec.connectorType)) do
                        if not connector.hasOpenManureFlow or connector.isConnected then
                            local rx, ry, rz = getWorldTranslation(connector.node)
                            local distance = MathUtil.vector2LengthSq(x - rx, z - rz)

                            if distance < Hose.CONNECTOR_SEQUENCE and math.abs(y - ry) < connector.inRangeDistance then
                                spec.foundVehicleId = NetworkUtil.getObjectId(vehicle)
                                spec.foundConnectorId = connectorId
                                spec.foundGrabNodeId = id
                            end
                        end
                    end
                end
            end
        end
    end

    if spec.foundVehicleId ~= spec.foundVehicleIdSend
        or spec.foundConnectorId ~= spec.foundConnectorIdSend
        or spec.foundGrabNodeId ~= spec.foundGrabNodeIdSend then
        spec.foundVehicleIdSend = spec.foundVehicleId
        spec.foundConnectorIdSend = spec.foundConnectorId
        spec.foundGrabNodeIdSend = spec.foundGrabNodeId
        self:raiseDirtyFlags(spec.dirtyFlag)
    end
end

function Hose:getConnectorObjectDesc(id)
    local spec = self.spec_hose

    for grabNodeId, desc in pairs(spec.grabNodesToVehicles) do
        if grabNodeId ~= id then
            local connector = desc.vehicle:getConnectorById(desc.connectorId)
            if connector.isConnected then
                return desc
            end
        end
    end

    return nil
end

function Hose.debugRenderRaycastNode(raycastNode, x, y, z, hasContact)
    local lx, ly, lz = worldToLocal(raycastNode, x, y, z)
    local r, g, b = 1, 0, 0

    if hasContact then
        r, g = 0, 1
    end

    lz = lz + Hose.RAYCAST_DISTANCE
    lx, ly, lz = localToWorld(raycastNode, lx, ly, lz)

    drawDebugLine(x, y, z, r, g, b, lx, ly, lz, r, g, b)
end

--- Allows easy check on raycast
function Hose:isaHose()
    return true
end

function Hose:getGrabNodes()
    return self.spec_hose.grabNodes
end

function Hose:getGrabNodeById(id)
    return self.spec_hose.grabNodes[id]
end

function Hose:getClosestGrabNode(x, y, z)
    local closestGrabNode
    local closestDistance = math.huge

    for id, grabNode in ipairs(self:getGrabNodes()) do
        local xg, yg, zg = getWorldTranslation(grabNode.node)
        local distance = math.sqrt((xg - x) * (xg - x) + (yg - y) * (yg - y) + (zg - z) * (zg - z))

        if distance < closestDistance then
            closestDistance = distance
            closestGrabNode = grabNode
        end
    end

    return closestGrabNode
end

---Sets the shader catmull point
---@param node number
---@param point string
---@param x number
---@param y number
---@param z number
---@param w number
function Hose.setCatmullPoint(node, point, x, y, z, w)
    setShaderParameter(node, point, x, y, z, w, false)
end

---Computes a catmull rom spline over shader
function Hose:computeCatmullSpline()
    local spec = self.spec_hose

    local p0x, p0y, p0z = 0, 0, -spec.length -- calculate base offset
    local p1x, p1y, p1z = 0, 0, 0
    local p2x, p2y, p2z = localToLocal(spec.targetNode, spec.mesh, 0, 0, 0)
    local p3x, p3y, p3z = 0, 0, spec.length -- calculate target offset

    p0x, p0y, p0z = p0x, p0y, p0z
    p3x, p3y, p3z = localToLocal(spec.targetNode, spec.mesh, p3x, p3y, p3z)

    local w1x, w1y, w1z = getWorldTranslation(spec.centerNode1)
    local w2x, w2y, w2z = getWorldTranslation(spec.centerNode2)

    p1x, p1y, p1z = worldToLocal(spec.mesh, (w1x + w2x) * 0.5, (w1y + w2y) * 0.5, (w1z + w2z) * 0.5)

    Hose.setCatmullPoint(spec.mesh, "cv0", p0x, p0y, p0z, 1)
    Hose.setCatmullPoint(spec.mesh, "cv2", p1x, p1y, p1z, 0)
    Hose.setCatmullPoint(spec.mesh, "cv3", p2x, p2y, p2z, 0)
    Hose.setCatmullPoint(spec.mesh, "cv4", p3x, p3y, p3z, 1)
end

local function constructPlayerJoint(jointDesc, mass)
    local constructor = JointConstructor:new()
    constructor:setActors(jointDesc.actor1, jointDesc.actor2)
    --constructor:setJointTransforms(jointDesc.anchor1, jointDesc.actor2)
    constructor:setEnableCollision(false)

    local mx, my, mz = getCenterOfMass(jointDesc.actor2)
    local wx, wy, wz = localToWorld(jointDesc.actor2, mx, my, mz)
    constructor:setJointWorldPositions(wx, wy, wz, wx, wy, wz)
    local nx, ny, nz = localDirectionToWorld(jointDesc.actor2, 1, 0, 0)
    constructor:setJointWorldAxes(nx, ny, nz, nx, ny, nz)

    local yx, yy, yz = localDirectionToWorld(jointDesc.actor2, 0, 1, 0)
    constructor:setJointWorldNormals(yx, yy, yz, yx, yy, yz)

    setTranslation(jointDesc.transform, -2, -0.4, 0.35)
    setRotation(jointDesc.transform, 0, math.rad(180), 0)

    local rotLimitSpring = {}
    local rotLimitDamping = {}
    local transLimitSpring = {}
    local translimitDamping = {}
    local springMass = mass * 60

    for i = 1, 3 do
        rotLimitSpring[i] = springMass
        rotLimitDamping[i] = math.sqrt(mass * rotLimitSpring[i]) * 2
        transLimitSpring[i] = springMass
        translimitDamping[i] = math.sqrt(mass * transLimitSpring[i]) * 2
    end

    constructor:setRotationLimitSpring(rotLimitSpring[1], rotLimitDamping[1], rotLimitSpring[2], rotLimitDamping[2], rotLimitSpring[3], rotLimitDamping[3])
    constructor:setTranslationLimitSpring(transLimitSpring[1], translimitDamping[1], transLimitSpring[2], translimitDamping[1], transLimitSpring[3], translimitDamping[3])

    for i = 0, 2 do
        constructor:setRotationLimit(i, 0, 0)
        constructor:setTranslationLimit(i, true, 0, 0)
    end

    -- if not g_hoseSystem.debugRendering then
    --    local forceLimit = mass * 25 -- only when stucked behind object
    --    constructor:setBreakable(forceLimit, forceLimit)
    --end

    local jointIndex = constructor:finalize()

    --if not g_hoseSystem.debugRendering then
    -- addJointBreakReport(jointIndex, "onGrabJointBreak", self)
    --end

    return jointIndex
end

function Hose:grab(id, player, noEventSend)
    HoseGrabDropEvent.sendEvent(self, id, player, true, noEventSend)

    log("Grab hose id: " .. id)

    local grabNode = self:getGrabNodeById(id)

    grabNode.state = Hose.STATE_ATTACHED
    grabNode.player = player

    if self.isServer then
        local componentNode = self.components[grabNode.componentIndex].node
        local newCollisionFlag = bitXOR(bitAND(grabNode.componentCollisionMask, Player.movementCollisionMask), grabNode.componentCollisionMask)
        setCollisionMask(componentNode, newCollisionFlag)

        local desc = {}

        desc.actor1 = player.pickUpKinematicHelperNode
        desc.actor2 = componentNode
        desc.transform = player.pickUpKinematicHelperNodeChild
        desc.anchor1 = player.pickUpKinematicHelperNode
        desc.anchor2 = grabNode.node

        grabNode.jointIndex = constructPlayerJoint(desc, self:getTotalMass())
    end

    player.isCarryingObject = true
    player.hoseGrabNodeId = id
end

function Hose:drop(id, player, noEventSend)
    HoseGrabDropEvent.sendEvent(self, id, player, false, noEventSend)

    log("Drop hose id: " .. id)
    local grabNode = self:getGrabNodeById(id)

    grabNode.state = Hose.STATE_DETACHED
    grabNode.player = nil

    if self.isServer then
        if grabNode.jointIndex ~= 0 then
            removeJoint(grabNode.jointIndex)
        end

        local componentNode = self.components[grabNode.componentIndex].node
        setCollisionMask(componentNode, grabNode.componentCollisionMask)
    end

    grabNode.jointIndex = 0

    player.isCarryingObject = false
    player.hoseGrabNodeId = nil
end

function Hose:attach(id, connectorId, vehicle, noEventSend)
    HoseAttachDetachEvent.sendEvent(self, id, connectorId, vehicle, true, noEventSend)

    log("attaching to " .. vehicle:getName() .. " gp: " .. id .. " connector: " .. connectorId)

    local grabNode = self:getGrabNodeById(id)

    if self:isAttached(grabNode) then
        self:drop(id, grabNode.player, true)
    end

    local connector = vehicle:getConnectorById(connectorId)

    if not connector.isParkPlace then
        self:connectGrabNode(grabNode, connector, vehicle)
    else
        self:parkHose(connector, vehicle)
    end
end

function Hose:detach(id, connectorId, vehicle, noEventSend)
    HoseAttachDetachEvent.sendEvent(self, id, connectorId, vehicle, false, noEventSend)

    log("detaching from " .. vehicle:getName() .. " gp: " .. id .. " connector: " .. connectorId)

    local grabNode = self:getGrabNodeById(id)
    grabNode.state = Hose.STATE_DETACHED

    local connector = vehicle:getConnectorById(connectorId)

    if not connector.isParkPlace then
        self:disconnectGrabNode(grabNode, connector, vehicle)
    else
        self:unparkHose(connector, vehicle)
    end
end

function Hose:connectGrabNode(grabNode, connector, vehicle)
    local spec = self.spec_hose

    grabNode.state = Hose.STATE_CONNECTED

    if self.isServer then
        local componentNode = self.components[grabNode.componentIndex].node

        local desc = {}
        desc.actor1 = vehicle.rootNode
        desc.actor2 = componentNode
        desc.transform = connector.node

        local x, y, z = localToLocal(connector.node, componentNode, 0, 0, 0)
        local wx, wy, wz = localToWorld(componentNode, x, y, z)
        local wqx, wqy, wqz, wqw = mathEulerToQuaternion(localRotationToWorld(componentNode, 0, 0, 0))

        self:setWorldPositionQuaternion(wx, wy, wz, wqx, wqy, wqz, wqw, grabNode.componentIndex, true)

        grabNode.jointIndex = self:constructConnectorJoint(desc)

        -- Restore joint transform position
        setTranslation(desc.transform, unpack(connector.jointOrigTrans))

        local limit = math.rad(10)
        for i = 1, 3 do
            self:setComponentJointRotLimit(self.componentJoints[grabNode.componentJointIndex], i, -limit, limit)
        end
    else
        -- Set joint index to '1' on client side, so we can check if something is attached
        grabNode.jointIndex = 1
    end

    if self.isClient then
        link(connector.node, grabNode.visualNode)
        setRotation(grabNode.visualNode, 0, 0, 0)

        link(grabNode.visualNode, grabNode.hoseTargetNode)
        if grabNode.updateHoseTargetRotation then
            setRotation(grabNode.hoseTargetNode, 0, 0, 0)
        end

        local x, y, z = unpack(grabNode.hoseTargetNodeOrigTrans)
        setTranslation(grabNode.hoseTargetNode, math.abs(x), math.abs(y), math.abs(z))

        self:computeCatmullSpline()
    end

    vehicle:setIsConnected(connector.id, true, grabNode.id, self, true)
    spec.grabNodesToVehicles[grabNode.id] = { vehicle = vehicle, connectorId = connector.id }
end

function Hose:disconnectGrabNode(grabNode, connector, vehicle)
    local spec = self.spec_hose

    if self.isServer then
        if grabNode.jointIndex ~= 0 then
            removeJoint(grabNode.jointIndex)
        end

        local jointDesc = self.componentJoints[grabNode.componentJointIndex]
        for i = 1, 3 do
            self:setComponentJointRotLimit(jointDesc, i, jointDesc.orgRotMinLimit[i], jointDesc.orgRotLimit[i])
        end
    end

    if self.isClient then
        local componentNode = self.components[grabNode.componentIndex].node
        link(componentNode, grabNode.visualNode)
        link(componentNode, grabNode.hoseTargetNode)
        setRotation(grabNode.visualNode, unpack(grabNode.visualOrigRot))
        setRotation(grabNode.hoseTargetNode, unpack(grabNode.hoseTargetNodeOrigRot))
        setTranslation(grabNode.hoseTargetNode, unpack(grabNode.hoseTargetNodeOrigTrans))

        self:computeCatmullSpline()
    end

    grabNode.jointIndex = 0

    vehicle:setIsConnected(connector.id, false, nil, nil, true)
    spec.grabNodesToVehicles[grabNode.id] = nil
end

function Hose:parkHose(connector, vehicle)
    local spec = self.spec_hose

    local length = math.min(connector.parkPlaceLength, self.sizeLength) * connector.parkDirection
    local grabNodesDivision = #self:getGrabNodes() - 1

    local division = #self.components - 1

    -- First we remove the hose from physics
    self:removeFromPhysics()

    local xPos, yPos, zPos = getWorldTranslation(connector.node)
    local xRot, yRot, zRot = getWorldRotation(connector.node)

    -- We place the components correctly.
    for i = 1, #self.components do
        local parkNode = createTransformGroup("parkNode")
        setTranslation(parkNode, xPos, yPos, zPos)
        setRotation(parkNode, xRot, yRot, zRot)

        local x, y, z = localToWorld(parkNode, 0, 0, length / division * (i - 1))

        local ox, oy, oz = 0, 0, 0
        if connector.parkDirection == ManureSystemCouplingStrategy.PARK_DIRECTION_RIGHT then
            oy = math.rad(180)
        end

        local rx, ry, rz = localRotationToWorld(parkNode, ox, oy, oz)

        self:setWorldPosition(x, y, z, rx, ry, rz, i, true)

        delete(parkNode)
    end

    self:addToPhysics()

    local excludedComponentIds = {}
    for id, grabNode in ipairs(self:getGrabNodes()) do
        if self.isServer then
            local component = self.components[grabNode.componentIndex]
            local jointTransform = createTransformGroup("jointTransform")

            link(connector.node, jointTransform)
            setRotation(jointTransform, 0, 0, 0)
            setTranslation(jointTransform, 0, 0, length / grabNodesDivision * (id - 1))

            local desc = {}
            desc.actor1 = vehicle.rootNode
            desc.actor2 = component.node
            desc.transform = jointTransform
            grabNode.jointTransform = jointTransform
            grabNode.jointIndex = self:constructConnectorJoint(desc)
            excludedComponentIds[grabNode.componentIndex] = true
        end

        grabNode.state = Hose.STATE_CONNECTED
        vehicle:setIsConnected(connector.id, true, id, self, true)
        spec.grabNodesToVehicles[id] = { vehicle = vehicle, connectorId = connector.id }
    end

    if self.isServer then
        for _, joint in ipairs(self.componentJoints) do
            for i = 1, 3 do
                self:setComponentJointRotLimit(joint, i, 0, 0)
            end
        end

        for i, component in ipairs(self.components) do
            if not excludedComponentIds[i] then
                setPairCollision(component.node, vehicle.rootNode, false)
            end
        end
    end
end

function Hose:unparkHose(connector, vehicle)
    local spec = self.spec_hose

    local excludedComponentIds = {}
    for id, grabNode in ipairs(self:getGrabNodes()) do
        if self.isServer then
            if grabNode.jointIndex ~= 0 then
                removeJoint(grabNode.jointIndex)
            end

            if grabNode.jointTransform ~= nil then
                delete(grabNode.jointTransform)
            end
            excludedComponentIds[grabNode.componentIndex] = true
        end

        grabNode.state = Hose.STATE_DETACHED
        vehicle:setIsConnected(connector.id, false, nil, nil, true)
        spec.grabNodesToVehicles[id] = nil
    end

    if self.isServer then
        for _, joint in ipairs(self.componentJoints) do
            for i = 1, 3 do
                self:setComponentJointRotLimit(joint, i, joint.orgRotMinLimit[i], joint.orgRotLimit[i])
            end
        end

        for i, component in ipairs(self.components) do
            if not excludedComponentIds[i] then
                setPairCollision(component.node, vehicle.rootNode, true)
            end
        end
    end
end

function Hose:constructConnectorJoint(jointDesc)
    if getRigidBodyType(jointDesc.actor2) ~= "Dynamic" then
        return
    end

    local constr = JointConstructor:new()

    constr:setActors(jointDesc.actor1, jointDesc.actor2)
    constr:setJointTransforms(jointDesc.transform, jointDesc.transform)

    local springForce = 7500
    local springDamping = 1500
    constr:setEnableCollision(false)
    constr:setRotationLimitSpring(springForce, springDamping, springForce, springDamping, springForce, springDamping)
    constr:setTranslationLimitSpring(springForce, springDamping, springForce, springDamping, springForce, springDamping)

    for axis = 0, 2 do
        constr:setRotationLimit(axis, 0, 0)
        constr:setTranslationLimit(axis, true, 0, 0)
    end

    return constr:finalize()
end

function Hose:raiseHoseActive()
    local spec = self.spec_hose

    self:raiseActive()

    for _, vehicle in pairs(spec.grabNodesToVehicles) do
        --vehicle:raiseActive()
    end
end

function Hose:isAttached(grabNode)
    return grabNode.state == Hose.STATE_ATTACHED
end

function Hose:isDetached(grabNode)
    return grabNode.state == Hose.STATE_DETACHED
end

function Hose:isConnected(grabNode)
    return grabNode.state == Hose.STATE_CONNECTED
end

function Hose.loadGrabNodes(self)
    local spec = self.spec_hose

    local i = 0
    while i <= 2 ^ Hose.GRAB_NODES_SEND_NUM_BITS do
        local key = ("vehicle.hose.grabNodes.grabNode(%d)"):format(i)

        if not hasXMLProperty(self.xmlFile, key) then
            break
        end

        if #spec.grabNodes == 2 ^ Hose.GRAB_NODES_SEND_NUM_BITS then
            Logger.error("Max amount of grabNodes reached!") -- Todo: logger
            break
        end

        local node = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. "#node"), self.i3dMappings)

        if node ~= nil then
            local grabNode = {}

            grabNode.id = i + 1
            grabNode.node = node

            if self.isClient then
                grabNode.visualNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. ".visuals#visualNode"), self.i3dMappings)
                grabNode.hoseTargetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. ".visuals#hoseTargetNode"), self.i3dMappings)
                grabNode.visualOrigRot = { getRotation(grabNode.visualNode) }
                grabNode.hoseTargetNodeOrigRot = { getRotation(grabNode.hoseTargetNode) }
                grabNode.hoseTargetNodeOrigTrans = { getTranslation(grabNode.hoseTargetNode) }
                grabNode.updateHoseTargetRotation = Utils.getNoNil(getXMLBool(self.xmlFile, key .. ".visuals#updateHoseTargetRotation"), false)
            end

            grabNode.jointOrigRot = { getRotation(node) }
            grabNode.jointOrigTrans = { getTranslation(node) }
            grabNode.componentIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. "#componentIndex"), 1)
            grabNode.componentJointIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. "#componentJointIndex"), 1)

            local componentNode = self.components[grabNode.componentIndex].node
            grabNode.componentCollisionMask = getCollisionMask(componentNode)
            grabNode.state = Hose.STATE_DETACHED
            grabNode.player = nil

            if self.isServer then
                grabNode.jointIndex = 0
                grabNode.jointTransform = nil
            end

            table.insert(spec.grabNodes, grabNode)
        end

        i = i + 1
    end
end
