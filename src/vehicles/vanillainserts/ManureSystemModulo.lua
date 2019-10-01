----------------------------------------------------------------------------------------------------
-- ManureSystemModulo
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Joskin Module.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemModulo
ManureSystemModulo = {}

function ManureSystemModulo.prerequisitesPresent(specializations)
    return true
end

function ManureSystemModulo.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemModulo)
end

function ManureSystemModulo:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#needsDockingCollision", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|3|1|0|0") -- colPart1
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "-0.725 0.04 -0.35")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "0 90 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.25)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 300)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1250)
end
