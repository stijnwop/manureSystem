----------------------------------------------------------------------------------------------------
-- ManureSystemLeebPT350
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the Leeb PT 350 of pack Horsch.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemLeebPT350
ManureSystemLeebPT350 = {}

function ManureSystemLeebPT350.prerequisitesPresent(specializations)
    return true
end

function ManureSystemLeebPT350.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemLeebPT350)
end

function ManureSystemLeebPT350:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 65)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_03")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 0.85)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 0.75)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "1.194 1.564 4.052")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "41 10 8.65")
end
