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
    setXMLString(self.xmlFile, "vehicle.manureSystemFillArm#rotation", "-2.85 -89 -3.223")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemFillArm#fillYOffset", -0.5)

    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 250)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1250)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-1.295 1.315 2.355")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 -90 0")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "-1.235 1.315 2.355")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 180 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.valve#type"):format(0), "8INCH_BRASS")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.handle#type"):format(0), "HANDLE_NEW")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#isParkPlace"):format(1), true)
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#parkPlaceLength"):format(1), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(1), "1.49 0.98 0.238")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(1), "0 -90 0")
end
