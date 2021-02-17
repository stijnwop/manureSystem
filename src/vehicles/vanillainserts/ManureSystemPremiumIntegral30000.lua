----------------------------------------------------------------------------------------------------
-- ManureSystemPremiumIntegral30000
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Veenhuis PremiumIntegral30000.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemPremiumIntegral30000
ManureSystemPremiumIntegral30000 = {}

function ManureSystemPremiumIntegral30000.prerequisitesPresent(specializations)
    return true
end

function ManureSystemPremiumIntegral30000.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemPremiumIntegral30000)
end

function ManureSystemPremiumIntegral30000:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 170)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1100)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.2 0.39 3.253")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "11 85 0")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(0), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(0), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(0), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(0), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(0), "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(0), "-0.37 1.97 4.34")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(0), "0 180 0")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(1), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(1), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(1), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(1), 1)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(1), "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(1), "-0.37 2.14 4.355")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(1), "0 180 0")
end
