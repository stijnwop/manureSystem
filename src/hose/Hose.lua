---
-- Hose
--
-- Base class for the Hose.
--
-- Copyright (c) Wopster, 2019

Hose = {}

function Hose.prerequisitesPresent(specializations)
    return true
end

function Hose.getSpecTable(self)
    return self["spec_" .. self.customEnvironment .. ".hose"]
end

function Hose.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "computeCatmull", Hose.computeCatmull)
end

function Hose.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", Hose)
    SpecializationUtil.registerEventListener(vehicleType, "onUpdateInterpolation", Hose)
end

function Hose:onLoad(savegame)
    local spec = Hose.getSpecTable(self)

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
