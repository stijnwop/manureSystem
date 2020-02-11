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

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.002 1.548 3.785")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 -40")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.95 1.578 3.785")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -40")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.valve#type"):format(0), "8INCH_BRASS")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.handle#type"):format(0), "HANDLE_NEW")
end
