----------------------------------------------------------------------------------------------------
-- ManureSystemTV585
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Holmer TV585.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemTV585
ManureSystemTV585 = {}

function ManureSystemTV585.prerequisitesPresent(specializations)
    return true
end

function ManureSystemTV585.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemTV585)
end

function ManureSystemTV585:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "exactFillRootNode") -- colPart3
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "0 0.2 0")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "-90 0 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.25)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 197)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1150)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "coupling")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-1.291 1.54 -0.431")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 -90 0")
end
