----------------------------------------------------------------------------------------------------
-- ManureSystemKuhnMetris4102
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the Kuhn Metris 4102.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemKuhnMetris4102
ManureSystemKuhnMetris4102 = {}

function ManureSystemKuhnMetris4102.prerequisitesPresent(specializations)
    return true
end

function ManureSystemKuhnMetris4102.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemKuhnMetris4102)
end

function ManureSystemKuhnMetris4102:onPreLoad(savegame)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor#litersPerSecond", 75)
    setXMLString(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump#template", "SLURRY_02")
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#indoor", 0.85)
    setXMLFloat(self.xmlFile, "vehicle.manureSystemPumpMotor.sounds.pump.pitch#outdoor", 0.75)

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "0.58 0.78 -0.26")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 0")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(0), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.172 0.93 -0.26")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 -45")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_4")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#color"):format(0), "KUHN_RED1")

    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(1), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(1), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(1), "-0.58 0.78 -0.26")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(1), "0 -90 0")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(1), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(1), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(1), "-0.172 0.93 -0.26")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(1), "0 180 45")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(1), "CONNECTOR_4")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#color"):format(1), "KUHN_RED1")
end
