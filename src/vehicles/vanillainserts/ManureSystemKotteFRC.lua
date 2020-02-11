----------------------------------------------------------------------------------------------------
-- ManureSystemKotteFRC
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Kotte FRC.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemKotteFRC
ManureSystemKotteFRC = {}

function ManureSystemKotteFRC.prerequisitesPresent(specializations)
    return true
end

function ManureSystemKotteFRC.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemKotteFRC)
end

function ManureSystemKotteFRC:onPreLoad(savegame)
    setXMLInt(self.xmlFile, "vehicle.manureSystemFillArmReceiver#fillVolumeIndex", 1)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-0.653 0.771 -5.03")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "10 -90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "COUPLING")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#inRangeDistance"):format(1), 2)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(1), "0.653 0.771 -5.03")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(1), "10 90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(2), "DOCK")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(2), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(2), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(2), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(2), "0 3.68 3.3")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(2), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(2), "0 3.68 3.3")
end
