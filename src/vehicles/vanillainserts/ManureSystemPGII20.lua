----------------------------------------------------------------------------------------------------
-- ManureSystemPGII20
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the SamsonAgro PG II 20.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemPGII20
ManureSystemPGII20 = {}

function ManureSystemPGII20.prerequisitesPresent(specializations)
    return true
end

function ManureSystemPGII20.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemPGII20)
end

function ManureSystemPGII20:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#needsDockingCollision", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|4|0|0|0|0|2") -- colPart3
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "0.19 -1.35 0.075")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "-2.85 1.091 -3.223")
    --setXMLString(self.xmlFile, "vehicle.manureSystemFillArm.collision#position", "0.27 -1.35 0")

    setXMLFloat(self.xmlFile, "vehicle.pumpMotor#litersPerSecond", 250)
    setXMLFloat(self.xmlFile, "vehicle.pumpMotor#toReachMaxEfficiencyTime", 1250)
end
