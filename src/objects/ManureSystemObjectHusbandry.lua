----------------------------------------------------------------------------------------------------
-- ManureSystemObjectHusbandry
----------------------------------------------------------------------------------------------------
-- Purpose: Add manure system support to the animal husbandry modules.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemObjectHusbandry
ManureSystemObjectHusbandry = {}

local ManureSystemObjectHusbandry_mt = Class(ManureSystemObjectHusbandry, ManureSystemObject)

InitObjectClass(ManureSystemObjectHusbandry, "ManureSystemObjectHusbandry")

---Local insertion method to add support for the vanilla placeables.
local function insertIntoVanillaHusbandry(xmlFile, xmlFileName)
    if xmlFileName == "data/placeables/animalHusbandry/husbandryCow.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryCowLarge.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryPig.xml"
        or xmlFileName == "data/placeables/animalHusbandry/husbandryPigLarge.xml" then

        setXMLBool(xmlFile, ("placeable.manureSystemFillArmReceiver#allowFillArm"), false) -- vanilla husbandry does not support fill arms.
        setXMLString(xmlFile, "placeable.manureSystemConnectors#rootNode", "0|3")

        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#linkNode"):format(0), "0|3")
        setXMLBool(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
        setXMLFloat(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2)
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#position"):format(0), "3.45 1.025 1.35")
        setXMLString(xmlFile, ("placeable.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 0")
    end
end

---Creates a new instance of the `ManureSystemObjectHusbandry`.
---@return ManureSystemObjectHusbandry
function ManureSystemObjectHusbandry:new(parent, isServer, isClient, mt)
    local self = ManureSystemObject:new(parent, isServer, isClient, mt or ManureSystemObjectHusbandry_mt)
    return self
end

---Called on load.
function ManureSystemObjectHusbandry:load(xmlFile, baseKey, baseNode, owner, baseDirectory)
    self.module = self.parent

    --Overwrite parent here cause owner is only known on load state.
    self.parent = owner

    --We ignore the specific baseKey here when no manure system entry is found.
    if not hasXMLProperty(xmlFile, baseKey .. ".manureSystemConnectors") then
        baseKey = "placeable"
    end

    if self.module:isa(HusbandryModuleLiquidManure) then
        insertIntoVanillaHusbandry(xmlFile, owner.configFileName)
    end

    if not ManureSystemObjectHusbandry:superClass().load(self, xmlFile, baseKey, baseNode) then
        return false
    end

    return true
end

function ManureSystemObjectHusbandry:getName()
    return ("%s.%s"):format(self.parent:getName(), self.module.moduleName)
end

function ManureSystemObjectHusbandry:getFillUnitFillType(unitIndex)
    for fillTypeIndex, _ in pairs(self.module.loadPlace.fillTypes) do
        local fillLevel = self.module:getFillLevel(fillTypeIndex)

        if fillLevel > 0 then
            return fillTypeIndex
        end
    end

    return FillType.UNKNOWN
end

function ManureSystemObjectHusbandry:getFillUnitAllowsFillType(_, fillType)
    if self.module:getIsFillTypeAllowed(fillType) then
        return true
    end

    return ManureSystemObjectHusbandry:superClass().getFillUnitAllowsFillType(self, _, fillType)
end

function ManureSystemObjectHusbandry:getFillUnitFillLevel(unitIndex)
    local fillType = self:getFillUnitFillType()
    return self.module:getFillLevel(fillType)
end

function ManureSystemObjectHusbandry:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()

    return fillLevel / capacity
end

function ManureSystemObjectHusbandry:getFillUnitCapacity(unitIndex)
    return self.module:getCapacity()
end

function ManureSystemObjectHusbandry:getFillUnitFreeCapacity(unitIndex)
    return self.module:getFreeCapacity()
end

function ManureSystemObjectHusbandry:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0
    if self.module:getIsToolTypeAllowed(toolType) then
        movedFillLevel = self.module:addFillLevelFromTool(farmId, fillLevelDelta, fillTypeIndex)
    end

    return movedFillLevel
end

---Checks if the given Y translation is under the fill plane.
function ManureSystemObjectHusbandry:isUnderFillPlane(x, y, z)
    if self.module ~= nil then
        if not self.allowFillArm then
            return false
        end

        local node = self.module.fillPlane.node
        if node == nil then
            return true
        end

        local _, py, _ = getWorldTranslation(node)
        py = py + self.fillArmOffset

        return py >= y
    end

    return false
end

---Gets the fillUnit index for the fill arm.
function ManureSystemObjectHusbandry:getFillArmFillUnitIndex()
    -- Always 1 since we don't support multi unit storage on objects.
    return 1
end
