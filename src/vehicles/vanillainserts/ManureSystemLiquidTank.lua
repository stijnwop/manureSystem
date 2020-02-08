----------------------------------------------------------------------------------------------------
-- ManureSystemLiquidTank
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the pallets.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemLiquidTank
ManureSystemLiquidTank = {}

function ManureSystemLiquidTank.prerequisitesPresent(specializations)
    return true
end

function ManureSystemLiquidTank.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemLiquidTank)
end

function ManureSystemLiquidTank:onPreLoad(savegame)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "coupling")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#createNode"):format(0), true)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#position"):format(0), "0.715 1.345 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#rotation"):format(0), "0 90 0")
end
