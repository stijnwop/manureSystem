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
        spec.length = Utils.getNoNil(getXMLInt(self.xmlFile, "vehicle.hose#length"), self.sizeLength)

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
        self:computeCatmull(dt)
    end
end

function Hose:computeCatmull(dt)
    local spec = Hose.getSpecTable(self)
    local x, y, z = 0, 0, 0
    setShaderParameter(spec.mesh, "cv0", x, y, -spec.length + z, 0, false)

    x, y, z = localToLocal(spec.targetNode, spec.mesh, 0, 0, 0)
    setShaderParameter(spec.mesh, "cv2", 0, 0, 0, 0, false)
    setShaderParameter(spec.mesh, "cv3", x, y, z, 0, false)

    x, y, z = 0, 0, 0
    x, y, z = localToLocal(spec.targetNode, spec.mesh, x, y, spec.length + z)
    setShaderParameter(spec.mesh, "cv4", x, y, z, 0, false)
end

