----------------------------------------------------------------------------------------------------
-- ManureSystemiXtrackT4
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the Kverneland iXtrack T4.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemiXtrackT4
ManureSystemiXtrackT4 = {}

function ManureSystemiXtrackT4.prerequisitesPresent(specializations)
    return true
end

function ManureSystemiXtrackT4.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemiXtrackT4)
end

function ManureSystemiXtrackT4:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 65)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_03")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 0.85)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 0.75)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(0), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.762 0.674 1.41")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -50")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_4")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#color"):format(0), "SHARED_BLACK4")
end
