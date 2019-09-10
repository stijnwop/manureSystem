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

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "dock")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(0), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(0), "0 3.68 3.3")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(0), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(0), "0 3.68 3.3")
end
