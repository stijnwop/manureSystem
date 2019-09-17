----------------------------------------------------------------------------------------------------
-- ManureSystemKotteTSA
----------------------------------------------------------------------------------------------------
-- Purpose: Insert Manure System function into the Kotte TSA.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemKotteTSA
ManureSystemKotteTSA = {}

function ManureSystemKotteTSA.prerequisitesPresent(specializations)
    return true
end

function ManureSystemKotteTSA.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemKotteTSA)
end

function ManureSystemKotteTSA:onPreLoad(savegame)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "coupling")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLFloat(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#inRangeDistance"):format(0), 2.5)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(0), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "-0.636 1.036 -4.488")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "15 -90 0")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "dock")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#linkNode"):format(1), "0>")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).funnel#position"):format(1), "-0.02 3.35 -4.3")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#linkNode"):format(1), "0>")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).trigger#position"):format(1), "-0.02 3.35 -4.3")
end
