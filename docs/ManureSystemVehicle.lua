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

    local modDesc = XMLFile.load("animals", ManureSystemVehicle.MOD_DIR .. "modDesc.xml")
    modDesc:iterate("modDesc.storeItems.storeItem", function (_, key)
        local storeItemXMLFilename = modDesc:getString(key .. "#xmlFilename")
        table.insert(storeItems, storeItemXMLFilename)
    end)
    modDesc:delete()

    for _, xmlFilename in ipairs(storeItems) do
        local vehicleXML = XMLFile.load("vehicleXML", ManureSystemVehicle.MOD_DIR .. xmlFilename)

        if vehicleXML:hasProperty("vehicle.manureSystem") then
            local vehicleType = vehicleXML:getString("vehicle#type")
            -- Enable the pump motor functionality: true/false (yes/no)
            local hasPumpMotor = vehicleXML:getBool("vehicle.manureSystem#hasPumpMotor") or false
            -- Enable the connector functionality: true/false (yes/no)
            local hasConnectors = vehicleXML:getBool("vehicle.manureSystem#hasConnectors") or false
            -- Enable the fill arm functionality: true/false (yes/no)
            local hasFillArm = vehicleXML:getBool("vehicle.manureSystem#hasFillArm") or false
            -- Enable the fill arm receiver functionality: true/false (yes/no)
            local hasFillArmReceiver = vehicleXML:getBool("vehicle.manureSystem#hasFillArmReceiver") or false
            ManureSystemVehicle.VEHICLES[vehicleType] = { hasPumpMotor = hasPumpMotor, hasConnectors = hasConnectors, hasFillArm = hasFillArm, hasFillArmReceiver = hasFillArmReceiver }
        end

        vehicleXML:delete()
    end

    storeItems = nil
    ManureSystemVehicle.HAS_MANURESYSTEM_INFORMATION = true
end

function ManureSystemVehicle.prerequisitesPresent(specializations)
    return true
end

function ManureSystemVehicle.hasFeatureEnabled(vehicleType, feature)
    local vehicle = ManureSystemVehicle.VEHICLES[vehicleType]
    return vehicle ~= nil and vehicle[feature] or false
end
