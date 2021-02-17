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
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.87 1.515 4.1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -45")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.valve#type"):format(0), "8INCH_BRASS")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.handle#type"):format(0), "HANDLE_NEW")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "DOCK")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(1), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(1), "-0.714 3.8 -5")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(1), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(1), "-0.714 3.8 -5")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(9), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(9), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(9), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(9), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(9), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(9),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(9), "-0.327 2.542 4.62")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(9), "0 180 0")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(10), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(10), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(10), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(10),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(10), "-0.327 2.712 4.635")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(10), "0 180 0")
end
