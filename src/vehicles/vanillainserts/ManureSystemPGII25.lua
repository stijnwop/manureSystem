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

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.87 1.515 3.3")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -45")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.valve#type"):format(0), "8INCH_BRASS")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.handle#type"):format(0), "HANDLE_NEW")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "DOCK")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(1), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(1), "-0.714 3.8 -2.5")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(1), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(1), "-0.714 3.8 -2.5")
end
