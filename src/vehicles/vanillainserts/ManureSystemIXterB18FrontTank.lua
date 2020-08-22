----------------------------------------------------------------------------------------------------
-- ManureSystemIXterB18FrontTank
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the Kverneland iXtra 1100 Comfort.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemIXterB18FrontTank
ManureSystemIXterB18FrontTank = {}

function ManureSystemIXterB18FrontTank.prerequisitesPresent(specializations)
    return true
end

function ManureSystemIXterB18FrontTank.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemIXterB18FrontTank)
end

function ManureSystemIXterB18FrontTank:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 30)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_03")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 0.85)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 0.75)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(0), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "-0.078 0.49 0.609")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "90 -80 -90")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")
end
