----------------------------------------------------------------------------------------------------
-- Hose
----------------------------------------------------------------------------------------------------
-- Purpose: Hose functionality to pump from source to target.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class Hose
Hose = {}

Hose.MOD_NAME = g_currentModName

Hose.STATE_ATTACHED = 0
Hose.STATE_DETACHED = 1
Hose.STATE_CONNECTED = 2
Hose.STATE_PARKED = 3
Hose.STATE_EXTENDED = 4

Hose.GRAB_NODES_SEND_NUM_BITS = 2 -- 2 ^ 2

Hose.CONNECTOR_SEQUENCE = 0.6 * 0.6
Hose.VEHICLE_CONNECTOR_SEQUENCE = 6 * 6

Hose.RESPAWN_OFFSET = 0.00001
Hose.RESPAWN_LENGTH_OFFSET = 0.5
Hose.RESPAWN_MAX_LENGTH = 10 -- m

Hose.RAYCAST_MASK = 32 + 64 + 128 + 256 + 4096 + 8194
Hose.RAYCAST_DISTANCE = 2

Hose.JOINT_BREAK_FORCE = 20
Hose.JOINT_BREAK_TORQUE = 15

function Hose.prerequisitesPresent(specializations)
    return true
end

function Hose.initSpecialization()
    g_configurationManager:addConfigurationType("hose", g_i18n:getText("configuration_hose"), "hose", nil, nil, nil, ConfigurationUtil.SELECTOR_MULTIOPTION)
end

function Hose.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "onMissionSaveToSavegame", Hose.onMissionSaveToSavegame)
    SpecializationUtil.registerFunction(vehicleType, "onMissionLoadFromSavegame", Hose.onMissionLoadFromSavegame)
    SpecializationUtil.registerFunction(vehicleType, "computeCatmullSpline", Hose.computeCatmullSpline)
    SpecializationUtil.registerFunction(vehicleType, "isaHose", Hose.isaHose)
    SpecializationUtil.registerFunction(vehicleType, "getLength", Hose.getLength)
    SpecializationUtil.registerFunction(vehicleType, "getGrabNodes", Hose.getGrabNodes)
    SpecializationUtil.registerFunction(vehicleType, "getGrabNodeById", Hose.getGrabNodeById)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorById", Hose.getConnectorById)
    SpecializationUtil.registerFunction(vehicleType, "getClosestGrabNode", Hose.getClosestGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "setIsConnected", Hose.setIsConnected)
    SpecializationUtil.registerFunction(vehicleType, "grab", Hose.grab)
    SpecializationUtil.registerFunction(vehicleType, "drop", Hose.drop)
    SpecializationUtil.registerFunction(vehicleType, "attach", Hose.attach)
    SpecializationUtil.registerFunction(vehicleType, "detach", Hose.detach)
    SpecializationUtil.registerFunction(vehicleType, "connectGrabNode", Hose.connectGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "disconnectGrabNode", Hose.disconnectGrabNode)
    SpecializationUtil.registerFunction(vehicleType, "removeHoseConnections", Hose.removeHoseConnections)
    SpecializationUtil.registerFunction(vehicleType, "parkHose", Hose.parkHose)
    SpecializationUtil.registerFunction(vehicleType, "unparkHose", Hose.unparkHose)
    SpecializationUtil.registerFunction(vehicleType, "isAttached", Hose.isAttached)
    SpecializationUtil.registerFunction(vehicleType, "isDetached", Hose.isDetached)
    SpecializationUtil.registerFunction(vehicleType, "isConnected", Hose.isConnected)
    SpecializationUtil.registerFunction(vehicleType, "isExtended", Hose.isExtended)
    SpecializationUtil.registerFunction(vehicleType, "findConnector", Hose.findConnector)
    SpecializationUtil.registerFunction(vehicleType, "restrictPlayerMovement", Hose.restrictPlayerMovement)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorObjectDesc", Hose.getConnectorObjectDesc)
    SpecializationUtil.registerFunction(vehicleType, "constructConnectorJoint", Hose.constructConnectorJoint)
    SpecializationUtil.registerFunction(vehicleType, "constructPlayerJoint", Hose.constructPlayerJoint)
    SpecializationUtil.registerFunction(vehicleType, "onPlayerJointBreak", Hose.onPlayerJointBreak)
    SpecializationUtil.registerFunction(vehicleType, "onConnectorJointBreak", Hose.onConnectorJointBreak)
    SpecializationUtil.registerFunction(vehicleType, "fillRaycastCallback", Hose.fillRaycastCallback)
end

function Hose.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onPostLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onPreDelete", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateInterpolation", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateTick", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onReadStream", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteStream", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onReadUpdateStream", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onWriteUpdateStream", Hose)
end

function Hose:onLoad(savegame)
    self.spec_hose = self[("spec_%s.hose"):format(Hose.MOD_NAME)]
    local spec = self.spec_hose

    local typeString = Utils.getNoNil(getXMLString(self.xmlFile, "vehicle.hose#type"), ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
    spec.connectorType = g_manureSystem.connectorManager:getConnectorType(typeString)

    spec.grabNodes = {}
    spec.grabNodesToObjects = {}

    Hose.loadGrabNodes(self)

    if self.isClient then
        spec.mesh = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#mesh"), self.i3dMappings)
        spec.targetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#targetNode"), self.i3dMappings)
        spec.centerNode1 = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#centerNode1"), self.i3dMappings)
        spec.centerNode2 = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#centerNode2"), self.i3dMappings)

        local startTrans = { getWorldTranslation(spec.mesh) }
        local endTrans = { getWorldTranslation(spec.targetNode) }
        local length = MathUtil.vector3Length(endTrans[1] - startTrans[1], endTrans[2] - startTrans[2], endTrans[3] - startTrans[3])

        spec.length = (Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#length"), length))
        setShaderParameter(spec.mesh, "cv0", 0, 0, -spec.length, 0, false)
    end

    spec.lastInRangePosition = { 0, 0, 0 }
    spec.playerMaxHoseLength = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#playerMaxHoseLength"), Hose.RESPAWN_MAX_LENGTH)

    spec.foundVehicleId = 0
    spec.foundConnectorId = 0
    spec.foundConnectorIsConnected = false
    spec.foundGrabNodeId = 0

    if self.isServer then
        spec.foundVehicleIdSend = 0
        spec.foundConnectorIdSend = 0
        spec.foundConnectorIsConnectedSend = false
        spec.foundGrabNodeIdSend = 0
    end

    spec.dirtyFlag = self:getNextDirtyFlag()
end

function Hose:onPostLoad(savegame)
    g_manureSystem:addConnectorObject(self)
end

function Hose:onLoadFinished(savegame)
    if self.isServer then
        for _, joint in ipairs(self.componentJoints) do
            joint.orgRotLimit = ListUtil.copyTable(joint.rotLimit)
            joint.orgRotMinLimit = ListUtil.copyTable(joint.rotMinLimit)
        end
    end

    self:computeCatmullSpline()
end

function Hose:onPreDelete()
    self:removeHoseConnections()
    g_manureSystem:removeConnectorObject(self)
end

function Hose:onMissionSaveToSavegame(key, xmlFile)
    local spec = self.spec_hose

    -- Remap for saving.
    local grabNodesToSave = {}
    for grabNodeId, desc in pairs(spec.grabNodesToObjects) do
        table.insert(grabNodesToSave, { grabNodeId, desc })
    end

    for i, data in ipairs(grabNodesToSave) do
        local id, desc = unpack(data)
        local grabNode = self:getGrabNodeById(id)
        if not grabNode.isExtension then
            local saveKey = key .. (".grabNodesToObjects.grabNode(%d)"):format(i - 1)

            if desc ~= nil then
                local vehicle = desc.vehicle
                local connector = vehicle:getConnectorById(desc.connectorId)

                setXMLInt(xmlFile, saveKey .. "#grabNodeId", id)
                setXMLInt(xmlFile, saveKey .. "#connectorId", connector.id)
                local objectId = g_manureSystem:getConnectorObjectId(vehicle)
                setXMLInt(xmlFile, saveKey .. "#objectId", objectId)

                -- No need to store anything else.
                if connector.isParkPlace then
                    return
                end
            end
        end
    end
end

function Hose:onMissionLoadFromSavegame(key, xmlFile)
    local i = 0
    while true do
        local loadKey = key .. (".grabNodesToObjects.grabNode(%d)"):format(i)

        if not hasXMLProperty(xmlFile, loadKey) then
            break
        end

        local grabNodeId = getXMLInt(xmlFile, loadKey .. "#grabNodeId")
        local connectorId = getXMLInt(xmlFile, loadKey .. "#connectorId")
        local objectId = getXMLInt(xmlFile, loadKey .. "#objectId")

        if g_manureSystem:connectorObjectExists(objectId) then
            local object = g_manureSystem:getConnectorObject(objectId)
            self:attach(grabNodeId, connectorId, object)
        end

        i = i + 1
    end
end

function Hose:onReadStream(streamId, connection)
    if connection:getIsServer() then
        local spec = self.spec_hose
        spec.hosesToLoadFromNetwork = {}

        local numOfGrabNodes = streamReadInt8(streamId)
        for id = 1, numOfGrabNodes do
            local grabNode = spec.grabNodes[id]
            grabNode.state = streamReadInt8(streamId)

            if self:isAttached(grabNode) then
                local player = NetworkUtil.readNodeObject(streamId)
                self:grab(id, player, true)
            elseif self:isConnected(grabNode) then
                if streamReadBool(streamId) then
                    local vehicleId = NetworkUtil.readNodeObjectId(streamId)
                    local connectorId = streamReadUIntN(streamId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS) + 1
                    table.insert(spec.hosesToLoadFromNetwork, { vehicleId = vehicleId, connectorId = connectorId, grabNodeId = id })
                end
            end
        end
    end
end

function Hose:onWriteStream(streamId, connection)
    if not connection:getIsServer() then
        local spec = self.spec_hose
        local numOfGrabNodes = #spec.grabNodes
        streamWriteInt8(streamId, numOfGrabNodes)

        for id = 1, numOfGrabNodes do
            local grabNode = spec.grabNodes[id]
            streamWriteInt8(streamId, grabNode.state)

            if self:isAttached(grabNode) then
                NetworkUtil.writeNodeObject(streamId, grabNode.player)
            elseif self:isConnected(grabNode) then
                local desc = spec.grabNodesToObjects[id]
                streamWriteBool(streamId, desc ~= nil)
                if desc ~= nil then
                    NetworkUtil.writeNodeObjectId(streamId, NetworkUtil.getObjectId(desc.vehicle))
                    streamWriteUIntN(streamId, desc.connectorId - 1, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS)
                end
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
            spec.foundConnectorIsConnected = streamReadBool(streamId)
            spec.foundGrabNodeId = streamReadUIntN(streamId, Hose.GRAB_NODES_SEND_NUM_BITS)
        end
    end
end

function Hose:onWriteUpdateStream(streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        local spec = self.spec_hose
        if streamWriteBool(streamId, bitAND(dirtyMask, spec.dirtyFlag) ~= 0) then
            NetworkUtil.writeNodeObjectId(streamId, spec.foundVehicleId)
            streamWriteUIntN(streamId, spec.foundConnectorId, ManureSystemConnector.CONNECTORS_SEND_NUM_BITS) -- allow sync number 0
            streamWriteBool(streamId, spec.foundConnectorIsConnected)
            streamWriteUIntN(streamId, spec.foundGrabNodeId, Hose.GRAB_NODES_SEND_NUM_BITS) -- allow sync number 0
        end
    end
end

function Hose:onUpdateInterpolation(dt)
    if self.isClient then
        self:computeCatmullSpline()
    end
end

function Hose:onUpdate(dt)
    local spec = self.spec_hose

    if spec.hosesToLoadFromNetwork ~= nil then
        for _, toLoad in ipairs(spec.hosesToLoadFromNetwork) do
            local vehicle = NetworkUtil.getObject(toLoad.vehicleId)
            self:attach(toLoad.grabNodeId, toLoad.connectorId, vehicle, true)
        end

        spec.hosesToLoadFromNetwork = nil
    end
end

function Hose:onUpdateTick(dt)
    local spec = self.spec_hose

    if self.isServer and self.firstTimeRun then
        local grabNodeId = next(spec.grabNodesToObjects)
        if grabNodeId ~= nil then
            local grabNode = self:getGrabNodeById(grabNodeId)

            local desc = spec.grabNodesToObjects[grabNodeId]
            if desc ~= nil and desc.connectorId ~= nil then
                local vehicle = desc.vehicle
                local connector1 = vehicle:getConnectorById(desc.connectorId)

                if not connector1.isParkPlace then
                    local connectorDesc, length = self:getConnectorObjectDesc(grabNodeId)

                    if connectorDesc ~= nil and connectorDesc.connectorId ~= nil then
                        local doCheck = vehicle.getLastSpeed ~= nil and vehicle:getLastSpeed(true) > 2 or connectorDesc.vehicle.getLastSpeed ~= nil and connectorDesc.vehicle:getLastSpeed(true) > 2
                        if doCheck then
                            local connector2 = connectorDesc.vehicle:getConnectorById(connectorDesc.connectorId)
                            local ax, _, az = getWorldTranslation(connector1.node)
                            local bx, _, bz = getWorldTranslation(connector2.node)

                            local distance = MathUtil.vector2Length(ax - bx, az - bz)
                            length = length + Hose.RESPAWN_LENGTH_OFFSET

                            if distance > length then
                                if g_manureSystem.debug then
                                    Logger.info("Restriction detach distance: ", distance)
                                end

                                if grabNode.isExtension then
                                    --When the grabNode is an extension we detach it from the other hose.
                                    desc.vehicle:detach(desc.connectorId, grabNodeId, self)
                                else
                                    self:detach(grabNodeId, desc.connectorId, vehicle)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function Hose:restrictPlayerMovement(id, player, dt)
    local spec = self.spec_hose
    local networkInformation = player.networkInformation
    local movementIsDirty = networkInformation.interpolationTime.isDirty

    if movementIsDirty then
        local xt, yt, zt = getTranslation(player.rootNode)
        local interpolatorPosition = networkInformation.interpolatorPosition
        movementIsDirty = math.abs(xt - interpolatorPosition.targetPositionX) > 0.001
            or math.abs(yt - interpolatorPosition.targetPositionY) > 0.001
            or math.abs(zt - interpolatorPosition.targetPositionZ) > 0.001
    end

    if movementIsDirty then
        local grabNode = self:getGrabNodeById(id)

        if self:isAttached(grabNode) then
            local desc, length = self:getConnectorObjectDesc(id)

            if length > spec.playerMaxHoseLength then
                if player == g_currentMission.player then
                    g_currentMission:showBlinkingWarning(g_i18n:getText("warning_hoseRangeRestrictionLength"), 1000)
                end
                local x, y, z = unpack(spec.lastInRangePosition)
                --Set current position when the last in range position isn't set.
                if x == 0 or y == 0 or z == 0 then
                    spec.lastInRangePosition = { getTranslation(player.rootNode) }
                end

                player:moveToAbsoluteInternal(unpack(spec.lastInRangePosition))
                return
            else
                spec.lastInRangePosition = { getTranslation(player.rootNode) }
            end

            if desc ~= nil and desc.connectorId ~= nil then
                local connector = desc.vehicle:getConnectorById(desc.connectorId)
                local cx, cy, cz = getWorldTranslation(connector.node)
                local px, py, pz = getWorldTranslation(player.rootNode)
                local dx, dz = px - cx, pz - cz
                local radius = dx * dx + dz * dz
                length = length + Hose.RESPAWN_LENGTH_OFFSET

                local actionRadius = length * length

                if radius < actionRadius then
                    spec.lastInRangePosition = { getTranslation(player.rootNode) }
                else
                    cx, cy, cz = getWorldTranslation(connector.node)
                    px, py, pz = getWorldTranslation(player.rootNode)

                    local distance = MathUtil.vector2Length(px - cx, pz - cz)
                    local x, _, z = unpack(spec.lastInRangePosition)

                    x = cx + ((px - cx) / distance) * (length - Hose.RESPAWN_OFFSET * dt)
                    z = cz + ((pz - cz) / distance) * (length - Hose.RESPAWN_OFFSET * dt)

                    player:moveToAbsoluteInternal(x, py, z)
                    spec.lastInRangePosition = { x, py, z }

                    if not spec.rangeRestrictionMessageShown and player == g_currentMission.player then
                        spec.rangeRestrictionMessageShown = true
                        g_currentMission:showBlinkingWarning(g_i18n:getText("warning_hoseRangeRestriction"), 5000)
                    end
                end
            end
        end
    end
end

function Hose:findConnector(id)
    if not self.isServer then
        return
    end

    local spec = self.spec_hose

    spec.foundVehicleId = 0
    spec.foundConnectorId = 0
    spec.foundConnectorIsConnected = false
    spec.foundGrabNodeId = 0

    local grabNode = self:getGrabNodeById(id)
    if grabNode ~= nil then
        if self:isAttached(grabNode) or self:isConnected(grabNode) then
            local x, y, z = getWorldTranslation(grabNode.node)

            local objects = g_manureSystem:getConnectorObjects()
            for _, object in pairs(objects) do
                if object ~= self then
                    local vx, _, vz = getWorldTranslation(object.components[1].node)
                    local distanceToObject = MathUtil.vector2LengthSq(x - vx, z - vz)

                    if distanceToObject < Hose.VEHICLE_CONNECTOR_SEQUENCE
                        or object:isa(Placeable) or object:isa(Bga) then

                        if object.isaHose ~= nil and object:isaHose() then
                            for _, connectorGrabNode in ipairs(object:getGrabNodes()) do
                                if not grabNode.isExtension and connectorGrabNode.isExtension and not self:isConnected(connectorGrabNode) then
                                    local rx, ry, rz = getWorldTranslation(connectorGrabNode.node)
                                    local distance = MathUtil.vector2LengthSq(x - rx, z - rz)

                                    if distance < Hose.CONNECTOR_SEQUENCE and math.abs(y - ry) < 1.5 then
                                        spec.foundVehicleId = NetworkUtil.getObjectId(object)
                                        spec.foundConnectorId = connectorGrabNode.id
                                        spec.foundConnectorIsConnected = self:isExtended(connectorGrabNode)
                                        spec.foundGrabNodeId = id
                                    end
                                end
                            end
                        elseif not grabNode.isExtension then
                            for _, connector in ipairs(object:getConnectorsByType(spec.connectorType)) do
                                if not connector.hasOpenManureFlow or connector.isConnected then
                                    local rx, ry, rz = getWorldTranslation(connector.node)
                                    local distance = MathUtil.vector2LengthSq(x - rx, z - rz)

                                    local connectorInRange = distance < Hose.CONNECTOR_SEQUENCE and math.abs(y - ry) < connector.inRangeDistance
                                    if not connectorInRange and connector.isParkPlace then
                                        rx, ry, rz = getWorldTranslation(connector.parkPlaceLengthNode)
                                        distance = MathUtil.vector2LengthSq(x - rx, z - rz)
                                        connectorInRange = distance < Hose.CONNECTOR_SEQUENCE and math.abs(y - ry) < connector.inRangeDistance
                                    end

                                    if connectorInRange then
                                        spec.foundVehicleId = NetworkUtil.getObjectId(object)
                                        spec.foundConnectorId = connector.id
                                        spec.foundConnectorIsConnected = connector.isConnected
                                        spec.foundGrabNodeId = id
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if spec.foundVehicleId ~= spec.foundVehicleIdSend
        or spec.foundConnectorId ~= spec.foundConnectorIdSend
        or spec.foundConnectorIsConnected ~= spec.foundConnectorIsConnectedSend
        or spec.foundGrabNodeId ~= spec.foundGrabNodeIdSend then
        spec.foundVehicleIdSend = spec.foundVehicleId
        spec.foundConnectorIdSend = spec.foundConnectorId
        spec.foundConnectorIsConnectedSend = spec.foundConnectorIsConnected
        spec.foundGrabNodeIdSend = spec.foundGrabNodeId
        self:raiseDirtyFlags(spec.dirtyFlag)
    end
end

function Hose:getConnectorObjectDesc(id, totalHoseLength, doRaycast)
    local spec = self.spec_hose

    doRaycast = doRaycast or false
    totalHoseLength = totalHoseLength or self:getLength()

    spec.lastRaycastDistance = 0
    spec.lastRaycastObject = nil

    for grabNodeId, desc in pairs(spec.grabNodesToObjects) do
        if grabNodeId ~= id then
            local vehicle = desc.vehicle

            -- Recursively get the connector object.
            if vehicle.isaHose ~= nil and vehicle:isaHose() then
                totalHoseLength = totalHoseLength + vehicle:getLength()
                return vehicle:getConnectorObjectDesc(desc.connectorId, totalHoseLength, doRaycast)
            end

            local connector = vehicle:getConnectorById(desc.connectorId)
            if connector.isConnected then
                return desc, totalHoseLength
            end
        end
    end

    -- Do raycast on the other node.
    if doRaycast then
        for grabNodeId, _ in ipairs(spec.grabNodes) do
            if grabNodeId ~= id then
                local grabNode = self:getGrabNodeById(grabNodeId)
                local x, y, z = getWorldTranslation(grabNode.raycastNode)
                local dx, dy, dz = localDirectionToWorld(grabNode.raycastNode, 0, 0, -1)
                raycastAll(x, y, z, dx, dy, dz, "fillRaycastCallback", Hose.RAYCAST_DISTANCE, self, Hose.RAYCAST_MASK, true)

                if spec.lastRaycastObject ~= nil then
                    if spec.lastRaycastObject:isUnderFillPlane(x, y + 0.1, z) then
                        -- Add forced dirt increment.
                        self:addDirtAmount(0.05, true)
                        return { vehicle = spec.lastRaycastObject }, totalHoseLength
                    end
                else
                    local isNearWater = (y <= g_currentMission.waterY + 0.1)
                    if isNearWater then
                        return { vehicle = nil, isNearWater = isNearWater }, totalHoseLength
                    end
                end
            end
        end
    end

    return nil, totalHoseLength
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

function Hose:fillRaycastCallback(hitObjectId, x, y, z, distance)
    if hitObjectId ~= 0 then
        if hitObjectId == g_currentMission.terrainRootNode then
            return true
        end

        local object = g_currentMission:getNodeObject(hitObjectId)
        if object ~= nil and object.isa ~= nil then
            local spec = self.spec_hose

            if object:isa(Vehicle) then
                if SpecializationUtil.hasSpecialization(ManureSystemFillArmReceiver, object.specializations) then
                    spec.lastRaycastDistance = distance
                    spec.lastRaycastObject = object

                    return false
                end
            elseif object:isa(ManureSystemStorage) then
                spec.lastRaycastDistance = distance
                spec.lastRaycastObject = object
                return false
            end
        end
    end

    return true
end

--- Allows easy check on raycast
function Hose:isaHose()
    return true
end

function Hose:getLength()
    return self.spec_hose.length
end

function Hose:getGrabNodes()
    return self.spec_hose.grabNodes
end

function Hose:getGrabNodeById(id)
    return self.spec_hose.grabNodes[id]
end

function Hose:getConnectorById(id)
    return self:getGrabNodeById(id)
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

    p3x, p3y, p3z = localToLocal(spec.targetNode, spec.mesh, p3x, p3y, p3z)

    local w1x, w1y, w1z = getWorldTranslation(spec.centerNode1)
    local w2x, w2y, w2z = getWorldTranslation(spec.centerNode2)

    p1x, p1y, p1z = worldToLocal(spec.mesh, (w1x + w2x) * 0.5, (w1y + w2y) * 0.5, (w1z + w2z) * 0.5)

    -- Fix flickering on the hose mesh.
    local intersectionOffset = 0.003
    Hose.setCatmullPoint(spec.mesh, "cv0", p0x, p0y, p0z, 0)
    Hose.setCatmullPoint(spec.mesh, "cv2", p1x + intersectionOffset, p1y, p1z, 0)
    Hose.setCatmullPoint(spec.mesh, "cv3", p2x - intersectionOffset, p2y, p2z, 0)
    Hose.setCatmullPoint(spec.mesh, "cv4", p3x - intersectionOffset, p3y, p3z, 0)
end

function Hose:grab(id, player, noEventSend)
    HoseGrabDropEvent.sendEvent(self, id, player, true, noEventSend)

    if g_manureSystem.debug then
        Logger.info("Grab hose id", id)
    end

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

        grabNode.jointIndex = self:constructPlayerJoint(desc, self:getTotalMass())
    end

    player.isCarryingObject = true
    player.hoseGrabNodeId = id
end

function Hose:drop(id, player, noEventSend)
    HoseGrabDropEvent.sendEvent(self, id, player, false, noEventSend)

    if g_manureSystem.debug then
        Logger.info("Drop hose id", id)
    end

    local grabNode = self:getGrabNodeById(id)

    grabNode.state = Hose.STATE_DETACHED
    grabNode.player = nil

    if self.isServer then
        if grabNode.jointIndex ~= nil then
            removeJoint(grabNode.jointIndex)
        end

        local componentNode = self.components[grabNode.componentIndex].node
        setCollisionMask(componentNode, grabNode.componentCollisionMask)
    end

    grabNode.jointIndex = nil

    player.isCarryingObject = false
    player.hoseGrabNodeId = nil
end

function Hose:attach(id, connectorId, vehicle, noEventSend)
    HoseAttachDetachEvent.sendEvent(self, id, connectorId, vehicle, true, noEventSend)

    if g_manureSystem.debug then
        Logger.info("Attaching to " .. vehicle:getName() .. " gp: " .. id .. " connector: " .. connectorId)
    end

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

    if g_manureSystem.debug then
        Logger.info("Detaching from " .. vehicle:getName() .. " gp: " .. id .. " connector: " .. connectorId)
    end

    local grabNode = self:getGrabNodeById(id)

    local connector = vehicle:getConnectorById(connectorId)

    if not connector.isParkPlace then
        self:disconnectGrabNode(grabNode, connector, vehicle)
    else
        self:unparkHose(connector, vehicle)
    end
end

function Hose:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    local spec = self.spec_hose
    local grabNode = self:getGrabNodeById(id)

    if grabNode.isExtension then
        local dir = state and -1 or 1
        self:playAnimation(grabNode.extensionAnimationName, dir, nil, true)
    end

    grabNode.state = state and Hose.STATE_EXTENDED or Hose.STATE_DETACHED

    -- Set two way recognition
    if state then
        spec.grabNodesToObjects[id] = { vehicle = hose, connectorId = grabNodeId }
    else
        spec.grabNodesToObjects[id] = nil
    end
end

function Hose:connectGrabNode(grabNode, connector, vehicle)
    local spec = self.spec_hose

    grabNode.state = Hose.STATE_CONNECTED

    if self.isServer then
        local componentNode = self.components[grabNode.componentIndex].node
        local jointTransform = createTransformGroup("jointTransform")
        link(connector.node, jointTransform)

        local x, y, z = localToLocal(connector.node, componentNode, 0, 0, 0)
        setTranslation(jointTransform, x, y, z)
        setRotation(jointTransform, 0, 0, 0)

        local desc = {}
        desc.actor1 = vehicle.rootNode
        desc.actor2 = componentNode
        desc.transform = jointTransform

        local wx, wy, wz = localToWorld(componentNode, x, y, z)
        local rx, ry, rz = localRotationToWorld(jointTransform, 0, 0, 0)
        if grabNode.updateHoseTargetRotation then
            rx, ry, rz = localRotationToWorld(jointTransform, 0, math.pi, 0)
        end

        local wqx, wqy, wqz, wqw = mathEulerToQuaternion(rx, ry, rz)
        self:setWorldPositionQuaternion(wx, wy, wz, wqx, wqy, wqz, wqw, grabNode.componentIndex, true)

        grabNode.jointTransform = jointTransform
        grabNode.jointIndex = self:constructConnectorJoint(desc)

        -- Restore joint transform position
        setTranslation(desc.transform, unpack(connector.jointOrigTrans))

        if not grabNode.isExtension then
            local limit = math.rad(10)
            for i = 1, 3 do
                self:setComponentJointRotLimit(self.componentJoints[grabNode.componentJointIndex], i, -limit, limit)
            end
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
    spec.grabNodesToObjects[grabNode.id] = { vehicle = vehicle, connectorId = connector.id }
end

function Hose:disconnectGrabNode(grabNode, connector, vehicle)
    local spec = self.spec_hose

    grabNode.state = Hose.STATE_DETACHED

    if self.isServer then
        if grabNode.jointIndex ~= nil then
            removeJoint(grabNode.jointIndex)
        end

        if grabNode.jointTransform ~= nil then
            delete(grabNode.jointTransform)
            grabNode.jointTransform = nil
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

    grabNode.jointIndex = nil

    vehicle:setIsConnected(connector.id, false, nil, nil, true)
    spec.grabNodesToObjects[grabNode.id] = nil
end

function Hose:removeHoseConnections()
    local spec = self.spec_hose

    for id, grabNode in ipairs(spec.grabNodes) do
        if self:isAttached(grabNode) then
            self:drop(id, grabNode.player, true)
        elseif self:isConnected(grabNode) or self:isExtended(grabNode) then
            local desc = spec.grabNodesToObjects[id]
            if desc ~= nil then
                if grabNode.isExtension and self:isExtended(grabNode) then
                    --When the grabNode is an extension we detach it from the other hose.
                    desc.vehicle:detach(desc.connectorId, id, self, true)
                else
                    self:detach(id, desc.connectorId, desc.vehicle, true)
                end
            end
        end
    end
end

function Hose:parkHose(connector, vehicle)
    local spec = self.spec_hose

    if connector.parkPlaceLength < spec.length then
        if self.isClient then
            g_currentMission:showBlinkingWarning(g_i18n:getText("warning_parkingPlaceTooSmall"):format(connector.parkPlaceLength, spec.length), 2000)
        end

        return
    end

    self:removeHoseConnections()

    local length = math.min(connector.parkPlaceLength, self.sizeLength) * connector.parkDirection
    local grabNodesDivision = #spec.grabNodes - 1
    local division = #self.components - 1

    -- First we remove the hose from physics
    self:removeFromPhysics()

    local xStartOffPos, yStartOffPos, zStartOffPos = unpack(connector.parkStartTransOffset)
    local xEndOffPos, yEndOffPos, zEndOffPos = unpack(connector.parkEndTransOffset)

    local xStartOffRot, yStartOffRot, zStartOffRot = unpack(connector.parkStartRotOffset)
    local xEndOffRot, yEndOffRot, zEndOffRot = unpack(connector.parkEndRotOffset)

    local xPos, yPos, zPos = localToWorld(connector.node, xStartOffPos, yStartOffPos, zStartOffPos)
    local xRot, yRot, zRot = localRotationToWorld(connector.node, xStartOffRot, yStartOffRot, zStartOffRot)

    -- Do correction on the end offset with the start offset.
    xEndOffPos = xEndOffPos - xStartOffPos
    yEndOffPos = yEndOffPos - yStartOffPos
    zEndOffPos = zEndOffPos - zStartOffPos

    -- We place the components correctly.
    for i = 1, #self.components do
        local parkNode = createTransformGroup("parkNode")
        setWorldTranslation(parkNode, xPos, yPos, zPos)
        setWorldRotation(parkNode, xRot, yRot, zRot)

        local alpha = i - 1
        -- Calculate offset.
        local tx, ty, tz = MathUtil.vector3Lerp(xStartOffPos, yStartOffPos, zStartOffPos, xEndOffPos, yEndOffPos, zEndOffPos, 1 / division * alpha)
        local x, y, z = localToWorld(parkNode, tx, ty, tz + (length / division * alpha))

        local ox, oy, oz = 0, 0, 0
        if connector.parkDirection == ManureSystemCouplingStrategy.PARK_DIRECTION_RIGHT then
            oy = oy + math.pi
        end

        local rx, ry, rz = localRotationToWorld(parkNode, ox, oy, oz)
        self:setWorldPosition(x, y, z, rx, ry, rz, i, true)

        delete(parkNode)
    end

    -- Add the hose back to physics
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
        spec.grabNodesToObjects[grabNode.id] = { vehicle = vehicle, connectorId = connector.id }
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
            if grabNode.jointIndex ~= nil then
                removeJoint(grabNode.jointIndex)
            end

            if grabNode.jointTransform ~= nil then
                delete(grabNode.jointTransform)
                grabNode.jointTransform = nil
            end
            excludedComponentIds[grabNode.componentIndex] = true
        end

        grabNode.state = Hose.STATE_DETACHED
        vehicle:setIsConnected(connector.id, false, nil, nil, true)
        spec.grabNodesToObjects[id] = nil
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

function Hose:constructPlayerJoint(jointDesc, mass)
    local constructor = JointConstructor:new()
    constructor:setActors(jointDesc.actor1, jointDesc.actor2)
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

    if not g_manureSystem.debug then
        local forceAcceleration = 6
        local forceLimit = forceAcceleration * mass * 40
        constructor:setBreakable(forceLimit, forceLimit)
    end

    local jointIndex = constructor:finalize()

    if not g_manureSystem.debug then
        addJointBreakReport(jointIndex, "onPlayerJointBreak", self)
    end

    return jointIndex
end

function Hose:constructConnectorJoint(jointDesc)
    if getRigidBodyType(jointDesc.actor2) ~= "Dynamic" then
        return
    end

    local constructor = JointConstructor:new()

    constructor:setActors(jointDesc.actor1, jointDesc.actor2)
    constructor:setJointTransforms(jointDesc.transform, jointDesc.transform)

    local springForce = 7500
    local springDamping = 1500
    constructor:setEnableCollision(false)
    constructor:setRotationLimitSpring(springForce, springDamping, springForce, springDamping, springForce, springDamping)
    constructor:setTranslationLimitSpring(springForce, springDamping, springForce, springDamping, springForce, springDamping)

    for axis = 0, 2 do
        constructor:setRotationLimit(axis, 0, 0)
        constructor:setTranslationLimit(axis, true, 0, 0)
    end

    constructor:setBreakable(Hose.JOINT_BREAK_FORCE, Hose.JOINT_BREAK_TORQUE)

    local jointIndex = constructor:finalize()

    addJointBreakReport(jointIndex, "onConnectorJointBreak", self)

    return jointIndex
end

function Hose:onPlayerJointBreak(jointIndex, breakingImpulse)
    local player = g_currentMission.player

    if player ~= nil then
        local hose = NetworkUtil.getObject(player.lastFoundHose)
        local grabNode = hose:getGrabNodeById(player.lastFoundGradNodeId)

        if jointIndex == grabNode.jointIndex then
            hose:drop(grabNode.id, player)
        end
    end

    -- Do not delete the joint internally, we already deleted it
    return false
end

function Hose:onConnectorJointBreak(jointIndex, breakingImpulse)
    local spec = self.spec_hose

    for grabNodeId, desc in pairs(spec.grabNodesToObjects) do
        local grabNode = self:getGrabNodeById(grabNodeId)
        if jointIndex == grabNode.jointIndex then
            if grabNode.isExtension then
                --When the grabNode is an extension we detach it from the other hose.
                desc.vehicle:detach(desc.connectorId, grabNodeId, self)
            else
                self:detach(grabNodeId, desc.connectorId, desc.vehicle)
            end
        end
    end

    -- Do not delete the joint internally, we already deleted it
    return false
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

function Hose:isExtended(grabNode)
    return grabNode.state == Hose.STATE_EXTENDED
end

function Hose.loadGrabNodes(self)
    local spec = self.spec_hose

    local hoseConfigurationId = Utils.getNoNil(self.configurations["hose"], 1)
    local baseKey = ("vehicle.hose.hoseConfigurations.hoseConfiguration(%d)"):format(hoseConfigurationId - 1)
    ObjectChangeUtil.updateObjectChanges(self.xmlFile, "vehicle.hose.hoseConfigurations.hoseConfiguration", hoseConfigurationId, self.components, self)

    -- Fallback key
    if not hasXMLProperty(self.xmlFile, baseKey) then
        baseKey = "vehicle.hose"
    end

    local i = 0
    while i <= 2 ^ Hose.GRAB_NODES_SEND_NUM_BITS do
        local key = ("%s.grabNodes.grabNode(%d)"):format(baseKey, i)

        if not hasXMLProperty(self.xmlFile, key) then
            break
        end

        if #spec.grabNodes == 2 ^ Hose.GRAB_NODES_SEND_NUM_BITS then
            Logger.error("Max amount of grabNodes reached!")
            break
        end

        local node = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. "#node"), self.i3dMappings)

        if node ~= nil then
            local grabNode = {}

            grabNode.id = i + 1
            grabNode.node = node
            grabNode.raycastNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. "#raycastNode"), self.i3dMappings)

            if self.isClient then
                grabNode.visualNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. ".visuals#visualNode"), self.i3dMappings)
                grabNode.hoseTargetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, key .. ".visuals#hoseTargetNode"), self.i3dMappings)
                grabNode.visualOrigRot = { getRotation(grabNode.visualNode) }
                grabNode.hoseTargetNodeOrigRot = { getRotation(grabNode.hoseTargetNode) }
                grabNode.hoseTargetNodeOrigTrans = { getTranslation(grabNode.hoseTargetNode) }
                grabNode.updateHoseTargetRotation = Utils.getNoNil(getXMLBool(self.xmlFile, key .. ".visuals#updateHoseTargetRotation"), false)
            end

            grabNode.isExtension = Utils.getNoNil(getXMLBool(self.xmlFile, key .. "#isExtension"), false)
            grabNode.extensionAnimationName = getXMLString(self.xmlFile, key .. "#extensionAnimationName")

            grabNode.jointOrigRot = { getRotation(node) }
            grabNode.jointOrigTrans = { getTranslation(node) }
            grabNode.componentIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. "#componentIndex"), 1)
            grabNode.componentJointIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. "#componentJointIndex"), 1)

            local componentNode = self.components[grabNode.componentIndex].node
            grabNode.componentCollisionMask = getCollisionMask(componentNode)
            grabNode.state = Hose.STATE_DETACHED
            grabNode.player = nil

            if self.isServer then
                grabNode.jointIndex = nil
                grabNode.jointTransform = nil
            end

            table.insert(spec.grabNodes, grabNode)
        end

        i = i + 1
    end
end
