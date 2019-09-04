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
end
