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

function Hose.prerequisitesPresent(specializations)
    return true
end

function Hose.getSpecTable(self)
    return self["spec_" .. self.customEnvironment .. ".hose"]
end

function Hose.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "computeCatmull", Hose.computeCatmull)
    SpecializationUtil.registerFunction(vehicleType, "isaHose", Hose.isaHose)
    SpecializationUtil.registerFunction(vehicleType, "getGrabNodes", Hose.getGrabNodes)
    SpecializationUtil.registerFunction(vehicleType, "getClosestGrabNodeId", Hose.getClosestGrabNodeId)
end

function Hose.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateInterpolation", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdate", Hose)
end

function Hose:onLoad(savegame)
    local spec = Hose.getSpecTable(self)

    spec.grabNodes = {}

    Hose.loadGrabNodes(self)

    if self.isClient then
        spec.mesh = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#mesh"), self.i3dMappings)
        spec.targetNode = I3DUtil.indexToObject(self.components, getXMLString(self.xmlFile, "vehicle.hose#targetNode"), self.i3dMappings)
        local offset = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#offset"), 0.25)
        spec.length = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.hose#length"), self.sizeLength) - offset

        setShaderParameter(spec.mesh, "cv0", 0, 0, -spec.length, 0, false)
        setShaderParameter(spec.mesh, "cv1", 0, 0, 0, 0, false)
        local x, y, z = localToLocal(spec.targetNode, spec.mesh, 0, 0, spec.length)
        setShaderParameter(spec.mesh, "cv3", x, y, z, 0, false)
    end
end

function Hose:onLoadFinished(savegame)
    if self.isClient then
        self:computeCatmull()
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
        self:computeCatmull()
    end
end

function Hose:onUpdate(dt)
    if self.isClient then
        local spec = Hose.getSpecTable(self)
        for id, grabNode in ipairs(spec.grabNodes) do
            DebugUtil.drawDebugNode(grabNode.node, id, false)
        end
    end
end

--- Allows easy check on raycast
function Hose:isaHose()
    return true
end

function Hose:getGrabNodes()
    local spec = Hose.getSpecTable(self)
    return spec.grabNodes
end

function Hose:getClosestGrabNodeId(x, y, z)
    local closestGrabNodeId
    local closestDistance = math.huge

    for id, grabNode in ipairs(self:getGrabNodes()) do
        local xg, yg, zg = getWorldTranslation(grabNode.node)
        local distance = math.sqrt((xg - x) * (xg - x) + (yg - y) * (yg - y) + (zg - z) * (zg - z))

        if distance < closestDistance then
            closestDistance = distance
            closestGrabNodeId = id
        end
    end

    return closestGrabNodeId
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
function Hose:computeCatmull()
    local spec = Hose.getSpecTable(self)
    local p0x, p0y, p0z = 0, 0, 0 -- calculate base offset
    local p1x, p1y, p1z = 0, 0, 0
    local p2x, p2y, p2z = localToLocal(spec.targetNode, spec.mesh, 0, 0, 0)
    local p3x, p3y, p3z = 0, 0, 0 -- calculate target offset

    p0x, p0y, p0z = p0x, p0y, -spec.length + p0z
    p3x, p3y, p3z = localToLocal(spec.targetNode, spec.mesh, p3x, p3y, spec.length + p3z)

    Hose.setCatmullPoint(spec.mesh, "cv0", p0x, p0y, p0z)
    Hose.setCatmullPoint(spec.mesh, "cv2", p1x, p1y, p1z)
    Hose.setCatmullPoint(spec.mesh, "cv3", p2x, p2y, p2z)
    Hose.setCatmullPoint(spec.mesh, "cv4", p3x, p3y, p3z)
end

function Hose:grab(id, player, state, noEventSent)

end

function Hose:drop(id, player, state, noEventSent)

end

function Hose.loadGrabNodes(self)
    local spec = Hose.getSpecTable(self)

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
            grabNode.componentIndex = Utils.getNoNil(getXMLInt(self.xmlFile, key .. '#componentIndex'), 1)
            grabNode.state = Hose.STATE_DETACHED

            table.insert(spec.grabNodes, grabNode)
        end

        i = i + 1
    end
end
