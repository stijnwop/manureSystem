----------------------------------------------------------------------------------------------------
-- ManureSystemFieldMaster20
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Briri Field Master 20.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFieldMaster20
ManureSystemFieldMaster20 = {}

function ManureSystemFieldMaster20.prerequisitesPresent(specializations)
    return true
end

function ManureSystemFieldMaster20.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemFieldMaster20)
end

function ManureSystemFieldMaster20:onPreLoad(savegame)
    -- Insert FillArm.
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#createNode", true)
    setXMLBool(self.xmlFile, "vehicle.manureSystemFillArm#needsDockingCollision", true)
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#linkNode", "0>0|4|1|0|5|0")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#position", "-0.888 0.7 3.065")
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "0 -90 0")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.4)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 250)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1050)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.125 0.922 2.345")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "15 90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(1), "1.125 0.922 1.845")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(1), "15 90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(2), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(2), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(2), "-1.085 0.89 2.49")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(2), "17.5 -90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(3), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(3), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(3), "-1.316 0.875 1.42")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(3), "17.5 -90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(4), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(4), true)
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#isParkPlace"):format(4), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(4), "1.161 2.09 -3.3")
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkOffsetThreshold"):format(4), 5)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkEndTransOffset"):format(4), "-0.01 -0.175 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkEndRotOffset"):format(4), "-13 0 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(5), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(5), true)
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#isParkPlace"):format(5), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(5), "-1.161 2.09 -3.3")
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkOffsetThreshold"):format(5), 5)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkEndTransOffset"):format(5), "0.01 -0.175 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkEndRotOffset"):format(5), "-13 0 0")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(9), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(9), "TRANSFER_HOSE_CURVE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(9), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(9), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(9), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(9),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(9), "0.144 3.481 2.674")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(9), "-180 -30 90")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(10), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(10), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(10), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(10),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(10), "0.333 3.481 2.674")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(10), "-180 -30 90")
end
