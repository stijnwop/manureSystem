----------------------------------------------------------------------------------------------------
-- ManureSystemPGII35
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the SamsonAgro PG II 35.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemPGII35
ManureSystemPGII35 = {}

function ManureSystemPGII35.prerequisitesPresent(specializations)
    return true
end

function ManureSystemPGII35.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemPGII35)
end

function ManureSystemPGII35:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|5|0|0|0|0|0|1") -- decalsBoltsArmEnd
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "0 0 0")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "0 0 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.5)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 300)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1250)
end
