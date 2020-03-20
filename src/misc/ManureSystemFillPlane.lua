----------------------------------------------------------------------------------------------------
-- ManureSystemFillPlane
----------------------------------------------------------------------------------------------------
-- Purpose: Fill plane that supports mixing animation.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFillPlane
ManureSystemFillPlane = {}

local ManureSystemFillPlane_mt = Class(ManureSystemFillPlane)

--- Creates a new instance of the manure system fill plane.
---@return ManureSystemFillPlane
function ManureSystemFillPlane:new(parent, customMt)
    local instance = {}

    setmetatable(instance, customMt or ManureSystemFillPlane_mt)

    instance.parent = parent
    instance.planeNode = nil
    instance.maxCapacity = 0
    instance.planeMinY = 0
    instance.planeMaxY = 0
    instance.planeOffsetY = 0
    instance.colorChange = false
    instance.capacity = 0
    instance.impact = 0

    return instance
end

function ManureSystemFillPlane:load(rootNode, xmlFile, xmlNode, capacity)
    local planeNodeIndex = XMLUtil.getValueFromXMLFileOrUserAttribute(xmlFile, xmlNode, "node", getXMLString, rootNode)

    if planeNodeIndex ~= nil then
        local planeNode = I3DUtil.indexToObject(rootNode, planeNodeIndex)

        if planeNode ~= nil then
            self.planeNode = planeNode
            self.planeMinY = Utils.getNoNil(XMLUtil.getValueFromXMLFileOrUserAttribute(xmlFile, xmlNode, "planeMinY", getXMLFloat, rootNode), 0)
            self.planeMaxY = Utils.getNoNil(XMLUtil.getValueFromXMLFileOrUserAttribute(xmlFile, xmlNode, "planeMaxY", getXMLFloat, rootNode), 0)
            self.planeOffsetY = Utils.getNoNil(XMLUtil.getValueFromXMLFileOrUserAttribute(xmlFile, xmlNode, "planeOffsetY", getXMLFloat, rootNode), 0)
            self.colorChange = Utils.getNoNil(XMLUtil.getValueFromXMLFileOrUserAttribute(xmlFile, xmlNode, "colorChange", getXMLBool, rootNode), false)
            self.capacity = capacity

            assert(self.planeMinY <= self.planeMaxY)
            self:setHeight(0)
            self:resetMixingState(0)
        end
    end
end

function ManureSystemFillPlane:delete()
end

---Load the fill plane from the savegame.
function ManureSystemFillPlane:loadFromXMLFile(xmlFile, key, resetVehicles)
    if self.planeNode ~= nil then
        local thickness = Utils.getNoNil(getXMLFloat(xmlFile, key .. "#thickness"), 0)
        self:setHeight(self:getFillUnitFillLevel())
        self:resetMixingState(thickness)
    end
end

function ManureSystemFillPlane:setHeight(fillLevel)
    if self.planeNode ~= nil then
        local x, oldY, z = getTranslation(self.planeNode)
        local y = self.planeMinY + (self.planeMaxY - self.planeMinY) * fillLevel / self.capacity
        setTranslation(self.planeNode, x, y, z)

        return oldY ~= y
    end

    return false
end

function ManureSystemFillPlane:isUnder(x, y, z)
    if self.planeNode == nil then
        return true
    end

    local _, py, _ = getWorldTranslation(self.planeNode)
    py = py + self.planeOffsetY

    return py >= y
end

function ManureSystemFillPlane:setColorScale(colorScale)
    setShaderParameter(self.planeNode, "colorScale", colorScale[1], colorScale[2], colorScale[3], 0, false)
end

function ManureSystemFillPlane:getShaderPlaneAngle(node)
    local angle = Utils.getYRotationBetweenNodes(self.planeNode, node)
    local _, _, _, numberOfAngles = getShaderParameter(self.planeNode, "mixParams")

    local step = (math.pi * 2) / numberOfAngles
    local plane = angle % step

    return angle
end

function ManureSystemFillPlane:resetMixingState(thickness)
    self.impact = 0
    setShaderParameter(self.planeNode, "displacementScaleSpeedFrequency", 0.01, 0.1, 0.1, 0, false)
    local mixedRoughnessPow = 0.5 + (1 - thickness)
    local _, _, _, numberOfAngles = getShaderParameter(self.planeNode, "mixParams")
    setShaderParameter(self.planeNode, "mixParams", mixedRoughnessPow, 0, 0, numberOfAngles, false)
end

function ManureSystemFillPlane:setMixingState(literPerSecond, thickness)
    local impact = MathUtil.clamp(literPerSecond * (1.1 - thickness) / literPerSecond, 0, 1)

    if math.abs(self.impact - impact) > 0.01 then
        self.impact = impact

        local maxOffsetScale = (literPerSecond * 0.5) / 1000
        local offsetScale = maxOffsetScale * impact
        local waveY = impact * 1.1
        local waveZ = impact

        setShaderParameter(self.planeNode, "displacementScaleSpeedFrequency", offsetScale, waveY, waveZ, 0, false)

        local angle = 2
        local yOffset = impact / 2
        local mixedRoughnessPow = 0.5 + (1 - thickness)
        local _, _, _, numberOfAngles = getShaderParameter(self.planeNode, "mixParams")
        setShaderParameter(self.planeNode, "mixParams", mixedRoughnessPow, yOffset, angle, numberOfAngles, false)
    end
end
