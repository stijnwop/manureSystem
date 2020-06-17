----------------------------------------------------------------------------------------------------
-- ManureSystemSlurryTank21000
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Slurry Tank 21000 for Horsch Pack.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemSlurryTank21000
ManureSystemSlurryTank21000 = {}

function ManureSystemSlurryTank21000.prerequisitesPresent(specializations)
    return true
end

function ManureSystemSlurryTank21000.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemSlurryTank21000)
end

function ManureSystemSlurryTank21000:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 300)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1250)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.995 1.745 2.07")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -45")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.valve#type"):format(0), "8INCH_BRASS")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.handle#type"):format(0), "HANDLE_NEW")
end
