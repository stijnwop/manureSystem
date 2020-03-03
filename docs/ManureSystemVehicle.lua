----------------------------------------------------------------------------------------------------
-- ManureSystemVehicle
----------------------------------------------------------------------------------------------------
-- Purpose: Enables mod-support for the ManureSystem mod.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemVehicle
ManureSystemVehicle = {}
ManureSystemVehicle.MOD_DIR = g_currentModDirectory
ManureSystemVehicle.VEHICLES = {}

ManureSystemVehicle.HAS_MANURESYSTEM_INFORMATION = false
if not ManureSystemVehicle.HAS_MANURESYSTEM_INFORMATION then
    local storeItems = {}
    local modDesc = loadXMLFile("modDesc", ManureSystemVehicle.MOD_DIR .. "modDesc.xml")

    local i = 0
    while true do
        local storeItemKey = ("modDesc.storeItems.storeItem(%d)"):format(i)
        if not hasXMLProperty(modDesc, storeItemKey) then break end
        local xmlFilename = getXMLString(modDesc, storeItemKey .. "#xmlFilename")
        table.insert(storeItems, xmlFilename)
        i = i + 1
    end

    delete(modDesc)

    for _, xmlFilename in ipairs(storeItems) do
        local vehicleXML = loadXMLFile("vehicleXML", ManureSystemVehicle.MOD_DIR .. xmlFilename)

        if hasXMLProperty(vehicleXML, "vehicle.manureSystem") then
            local vehicleType = getXMLString(vehicleXML, "vehicle#type")
            -- Enable the pump motor functionality: true/false (yes/no)
            local hasPumpMotor = Utils.getNoNil(getXMLBool(vehicleXML, "vehicle.manureSystem#hasPumpMotor"), false)
            -- Enable the connector functionality: true/false (yes/no)
            local hasConnectors = Utils.getNoNil(getXMLBool(vehicleXML, "vehicle.manureSystem#hasConnectors"), false)
            -- Enable the fill arm functionality: true/false (yes/no)
            local hasFillArm = Utils.getNoNil(getXMLBool(vehicleXML, "vehicle.manureSystem#hasFillArm"), false)
            -- Enable the fill arm receiver functionality: true/false (yes/no)
            local hasFillArmReceiver = Utils.getNoNil(getXMLBool(vehicleXML, "vehicle.manureSystem#hasFillArmReceiver"), false)
            ManureSystemVehicle.VEHICLES[vehicleType] = { hasPumpMotor = hasPumpMotor, hasConnectors = hasConnectors, hasFillArm = hasFillArm, hasFillArmReceiver = hasFillArmReceiver }
        end

        delete(vehicleXML)
    end

    storeItems = nil
    ManureSystemVehicle.HAS_MANURESYSTEM_INFORMATION = true
end

function ManureSystemVehicle.prerequisitesPresent(specializations)
    return true
end

function ManureSystemVehicle.getManureSystemVehicleHasFeatureEnabled(vehicleType, feature)
    local vehicle = ManureSystemVehicle.VEHICLES[vehicleType]
    return vehicle ~= nil and vehicle[feature] or false
end
