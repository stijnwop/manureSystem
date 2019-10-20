----------------------------------------------------------------------------------------------------
-- ManureSystemPGII25
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the SamsonAgro PG II 25.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemPGII25
ManureSystemPGII25 = {}

function ManureSystemPGII25.prerequisitesPresent(specializations)
    return true
end

function ManureSystemPGII25.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemPGII25)
end

function ManureSystemPGII25:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|4|0|0|0|0|0|0|0") -- screw_decals
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "0 0 0")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "0 0 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.5)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 300)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1250)
end
