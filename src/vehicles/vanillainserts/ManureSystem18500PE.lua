----------------------------------------------------------------------------------------------------
-- ManureSystem18500PE
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Zunhammer 18500PE.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystem18500PE
ManureSystem18500PE = {}

function ManureSystem18500PE.prerequisitesPresent(specializations)
    return true
end

function ManureSystem18500PE.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystem18500PE)
end

function ManureSystem18500PE:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 150)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_02")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 1)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 1)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.261 0.821 2.797")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "25 90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#isParkPlace"):format(1), true)
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(1), "1.18 1.85 -2.66")
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkPlaceLength"):format(1), 4)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(2), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#isParkPlace"):format(2), true)
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(2), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(2), "-1.18 1.85 -2.66")
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkPlaceLength"):format(2), 4)

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(9), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(9), "TRANSFER_HOSE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(9), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(9), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(9), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(9),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(9), "0 1.38 3.069")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(9), "90 180 0")

    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#type"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#socket"):format(10), "TRANSFER_HOSE_CABLE_BUNDLE")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#attacherJointIndices"):format(10), "1")
    setXMLInt(self.xmlFile, ("vehicle.connectionHoses.target(%d)#straighteningFactor"):format(10), 2)
    setXMLBool(self.xmlFile, ("vehicle.connectionHoses.target(%d)#createNode"):format(10), true)
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#linkNode"):format(10),  "0>")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#position"):format(10), "0 1.38 2.869")
    setXMLString(self.xmlFile, ("vehicle.connectionHoses.target(%d)#rotation"):format(10), "90 180 0")
end
