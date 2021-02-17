----------------------------------------------------------------------------------------------------
-- ManureSystemTerraVariant435
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Holmer Terra Variant 435.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemTerraVariant435
ManureSystemTerraVariant435 = {}

function ManureSystemTerraVariant435.prerequisitesPresent(specializations)
    return true
end

function ManureSystemTerraVariant435.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemTerraVariant435)
end

function ManureSystemTerraVariant435:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|15|0|0|0|4|1") -- colPart04
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "180 0 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.5)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 197)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1150)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-1.402 0.673 -1.386")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 -90 0")
end
