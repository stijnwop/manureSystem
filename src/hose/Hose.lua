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
    SpecializationUtil.registerFunction(vehicleType, "raiseHoseActive", Hose.raiseHoseActive)
    SpecializationUtil.registerFunction(vehicleType, "isAttached", Hose.isAttached)
    SpecializationUtil.registerFunction(vehicleType, "isDetached", Hose.isDetached)
    SpecializationUtil.registerFunction(vehicleType, "isConnected", Hose.isConnected)
    SpecializationUtil.registerFunction(vehicleType, "findConnectorRaycastCallback", Hose.findConnectorRaycastCallback)
    SpecializationUtil.registerFunction(vehicleType, "constructConnectorJoint", Hose.constructConnectorJoint)
end

function Hose.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateInterpolation", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", Hose)
end

function Hose:onLoad(savegame)
    self.spec_hose = ManureSystemUtil.getSpecTable(self, "hose")

    local spec = self.spec_hose

    spec.foundVehicle = nil
    spec.foundConnectorId = nil
    spec.foundGrabNodeId = nil
    spec.grabNodes = {}
    spec.grabNodesToVehicles = {}

    Hose.loadGrabNodes(self)

    if self.isClient then
        spec.mesh = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#mesh"), self.i3dMappings)
        spec.baseNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#baseNode"), self.i3dMappings)
        spec.targetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#targetNode"), self.i3dMappings)
        local offset = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#offset"), 0.25)

        local startTrans = { getWorldTranslation(spec.baseNode) }
        local endTrans = { getWorldTranslation(spec.targetNode) }

        local length = MathUtil.vector3Length(endTrans[1] - startTrans[1], endTrans[2] - startTrans[2], endTrans[3] - startTrans[3])
        spec.length = (Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#length"), length) - offset) * 2

        setShaderParameter(spec.mesh, "cv0", 0, 0, -spec.length, 0, false)
        setShaderParameter(spec.mesh, "cv1", 0, 0, 0, 0, false)
        local x, y, z = localToLocal(spec.targetNode, spec.baseNode, 0, 0, spec.length)
        setShaderParameter(spec.mesh, "cv3", x, y, z, 0, false)
    end

    spec.dirtyFlag = self:getNextDirtyFlag()
end

function Hose:onLoadFinished(savegame)
    if self.isClient then
        self:computeCatmullSpline()
    end
end

function Hose:readStream(streamId, connection)
end

function Hose:writeStream(streamId, connection)
end

function Hose:readUpdateStream(streamId, timestamp, connection)
end

function Hose:writeUpdateStream(streamId, connection, dirtyMask)
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

    if self.isClient then
        local player = g_currentMission.player
        local grabNode = spec.grabNodes[player.lastFoundHoseGrabNodeId]

        if grabNode ~= nil then
            spec.foundVehicle = nil
            spec.foundConnectorId = nil
            spec.foundGrabNodeId = nil

            if self:isAttached(grabNode) or self:isConnected(grabNode) then
                local x, y, z = getWorldTranslation(grabNode.node)
                local dx, dy, dz = localDirectionToWorld(grabNode.node, 0, 0, 1)

                spec.lastRaycastDistance = 0
                raycastClosest(x, y, z, dx, dy, dz, "findConnectorRaycastCallback", Hose.RAYCAST_DISTANCE, self, Hose.RAYCAST_MASK)
                Hose.debugRenderRaycastNode(grabNode.node, x, y, z, spec.lastRaycastDistance ~= 0)

                if spec.foundVehicle ~= nil then
                    for id, connector in ipairs(spec.foundVehicle:getConnectors()) do
                        if not connector.hasOpenManureFlow then
                            local rx, ry, rz = getWorldTranslation(connector.node)
                            local distance = MathUtil.vector2LengthSq(x - rx, z - rz)

                            if distance < Hose.CONNECTOR_SEQUENCE
                                and math.abs(y - ry) < connector.inRangeDistance then
                                spec.foundConnectorId = id
                                spec.foundGrabNodeId = player.lastFoundHoseGrabNodeId
                            end
                        end
                    end
                end
            end
        end
    end
end

function Hose.debugRenderRaycastNode(raycastNode, x, y, z, foundVehicle)
    local lx, ly, lz = worldToLocal(raycastNode, x, y, z)
    local r, g, b = 1, 0, 0

    if foundVehicle then
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
function Hose.setCatmullPoint(node, point, x, y, z)
    setShaderParameter(node, point, x, y, z, 0, false)
end

---Computes a catmull rom spline over shader
function Hose:computeCatmullSpline()
    local spec = self.spec_hose

    local p0x, p0y, p0z = 0, 0, 0 -- calculate base offset
    local p1x, p1y, p1z = 0, 0, 0
    local p2x, p2y, p2z = localToLocal(spec.targetNode, spec.baseNode, 0, 0, 0)
    local p3x, p3y, p3z = 0, 0, 0 -- calculate target offset

    p0x, p0y, p0z = p0x, p0y, -spec.length + p0z
    p3x, p3y, p3z = localToLocal(spec.targetNode, spec.baseNode, p3x, p3y, spec.length + p3z)

    Hose.setCatmullPoint(spec.mesh, "cv0", p0x, p0y, p0z)
    Hose.setCatmullPoint(spec.mesh, "cv2", p1x, p1y, p1z)
    Hose.setCatmullPoint(spec.mesh, "cv3", p2x, p2y, p2z)
    Hose.setCatmullPoint(spec.mesh, "cv4", p3x, p3y, p3z)
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

    local grabNodes = self:getGrabNodes()
    local grabNode = grabNodes[id]

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
end

function Hose:drop(id, player, noEventSend)
    HoseGrabDropEvent.sendEvent(self, id, player, false, noEventSend)

    local grabNodes = self:getGrabNodes()
    local grabNode = grabNodes[id]

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
end

function Hose:attach(grabPointId, connectorId, vehicle, noEventSend)
    HoseAttachDetachEvent.sendEvent(self, grabPointId, connectorId, vehicle, true, noEventSend)

    log("attaching to " .. vehicle:getName() .. " gp: " .. grabPointId .. " connector: " .. connectorId)

    local spec = self.spec_hose
    local grabNode = spec.grabNodes[grabPointId]

    if self:isAttached(grabNode) then
        self:drop(grabPointId, grabNode.player, true)
    end

    grabNode.state = Hose.STATE_CONNECTED

    local connector = vehicle:getConnectorById(connectorId)
    if self.isServer then
        local componentNode = self.components[grabNode.componentIndex].node

        grabNode.jointTransform = createTransformGroup("connectorJoint")
        link(connector.node, grabNode.jointTransform)

        local desc = {}
        desc.actor1 = vehicle.rootNode
        desc.actor2 = componentNode
        desc.transform = connector.node

        local rx, ry, rz = getWorldRotation(connector.node)
        if grabNode.invertZOnAttach then
            rx, ry, rz = -rx, -ry, -rz

            if math.abs(math.deg(ry)) <= 0.01 then
                ry = ry + math.rad(180)
            end
        end

        setWorldTranslation(componentNode, getWorldTranslation(connector.node))
        setWorldRotation(componentNode, rx, ry, rz)

        grabNode.jointIndex = self:constructConnectorJoint(desc)

        -- restore joint transform position
        setTranslation(desc.transform, unpack(connector.jointOrigTrans))

        for i = 1, 3 do
            --self:setComponentJointRotLimit(self.componentJoints[grabNode.componentJointIndex], i, 0, 0)
        end

    else
        -- set joint index to '1' on client side, so we can check if something is attached
        grabNode.jointIndex = 1
    end

    if connector.isParkPlace then
        local otherNodeId = grabPointId > 1 or 1 and 2
        local otherGrabNode = spec.grabNodes[otherNodeId]
        local componentNode = self.components[otherNodeId].node
        local x, y, z = localToWorld(connector.node, 0, 0, spec.length)
        local rx, ry, rz = getWorldRotation(connector.node)
        if grabNode.invertZOnAttach then
            rx, ry, rz = -rx, -ry, -rz

            if math.abs(math.deg(ry)) <= 0.01 then
                ry = ry + math.rad(180)
            end
        end
        local desc = {}
        desc.actor1 = vehicle.rootNode
        desc.actor2 = componentNode
        desc.transform = connector.node

        setWorldTranslation(componentNode, x, y, z)
        setWorldRotation(componentNode, rx, ry, rz)

        otherGrabNode.jointIndex = self:constructConnectorJoint(desc)
        setTranslation(desc.transform, unpack(connector.jointOrigTrans))

        for _, component in pairs(self.components) do
            if component.node ~= componentNode then
                setPairCollision(component.node, vehicle.rootNode, false)
            end
        end
    end

    vehicle:setIsConnected(connectorId, true, self, true)
    spec.grabNodesToVehicles[grabPointId] = vehicle
end

function Hose:detach(grabPointId, connectorId, vehicle, noEventSend)
    HoseAttachDetachEvent.sendEvent(self, grabPointId, connectorId, vehicle, false, noEventSend)
    log("detaching from " .. vehicle:getName() .. " gp: " .. grabPointId .. " connector: " .. connectorId)

    local spec = self.spec_hose
    local grabNode = spec.grabNodes[grabPointId]
    grabNode.state = Hose.STATE_DETACHED

    local connector = vehicle:getConnectorById(connectorId)
    if self.isServer then
        if grabNode.jointIndex ~= 0 then
            removeJoint(grabNode.jointIndex)
        end

        delete(grabNode.jointTransform)

        for i = 1, 3 do
            --self:setComponentJointRotLimit(self.componentJoints[grabNode.componentJointIndex], i, -grabNode.componentJointRotLimit[i], grabNode.componentJointRotLimit[i])
        end

        local componentNode = self.components[grabNode.componentIndex].node
        for _, component in pairs(self.components) do
            if component.node ~= componentNode then
                setPairCollision(component.node, vehicle.rootNode, true)
            end
        end
    end

    grabNode.jointIndex = 0
    grabNode.jointTransform = nil

    vehicle:setIsConnected(connectorId, false, nil, true)
    spec.grabNodesToVehicles[grabPointId] = nil
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
        vehicle:raiseActive()
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
            print("Max amount of grabNodes reached!") -- Todo: logger
            break
        end

        local node = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. "#node"), self.i3dMappings)

        if node ~= nil then
            local grabNode = {}

            grabNode.id = i + 1
            grabNode.node = node
            grabNode.jointOrigRot = { getRotation(node) }
            grabNode.jointOrigTrans = { getTranslation(node) }
            grabNode.invertZOnAttach = Utils.getNoNil(getXMLBool(self.xmlFile, key .. '#invertZOnAttach'), false)
            grabNode.componentIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. '#componentIndex'), 1)
            grabNode.componentJointIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. '#componentJointIndex'), 1)

            local rotLimit = StringUtil.getRadiansFromString(getXMLString(self.xmlFile, key .. "#rotLimit"), 3)
            grabNode.componentJointRotLimit = rotLimit

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

function Hose:findConnectorRaycastCallback(hitActorId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId)
    local vehicle = g_currentMission.nodeToObject[hitActorId]
    if hitActorId ~= hitShapeId then
        -- object is a compoundChild. Try to find the compound
        local parentId = hitShapeId
        while parentId ~= 0 do
            if g_currentMission.nodeToObject[parentId] ~= nil then
                -- found valid compound
                vehicle = g_currentMission.nodeToObject[parentId]
                break
            end
            parentId = getParent(parentId)
        end
    end

    if vehicle ~= nil and vehicle.isa ~= nil
        and vehicle:isa(Vehicle)
        and SpecializationUtil.hasSpecialization(ManureSystemConnector, vehicle.specializations) then
        local spec = self.spec_hose
        spec.foundVehicle = vehicle
        spec.lastRaycastDistance = distance
        return false
    end

    return true
end
