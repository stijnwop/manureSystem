----------------------------------------------------------------------------------------------------
-- ManureSystemShuttle8000
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the Horsch Shuttle 8000 for Horsch Pack.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemShuttle8000
ManureSystemShuttle8000 = {}

function ManureSystemShuttle8000.prerequisitesPresent(specializations)
    return true
end

function ManureSystemShuttle8000.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemShuttle8000)
end

function ManureSystemShuttle8000:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 35)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_03")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 0.85)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 0.75)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.037 0.446 -1.907")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "57.8 35.55 25.44")
end
