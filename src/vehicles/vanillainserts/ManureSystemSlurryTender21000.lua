----------------------------------------------------------------------------------------------------
-- ManureSystemSlurryTender21000
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Slurry Tender 21000 for Horsch Pack.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemSlurryTender21000
ManureSystemSlurryTender21000 = {}

function ManureSystemSlurryTender21000.prerequisitesPresent(specializations)
    return true
end

function ManureSystemSlurryTender21000.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemSlurryTender21000)
end

function ManureSystemSlurryTender21000:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 120)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#toReachMaxEfficiencyTime", 1100)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2.5)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-0.409 1.079 -3.446")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 -90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(3), "DOCK")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(3), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(3), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(3), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(3), "-0.02 3.6 -3.14")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(3), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(3), "-0.02 3.6 -3.14")
end
