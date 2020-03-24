----------------------------------------------------------------------------------------------------
-- ManureSystemLiquidTank
----------------------------------------------------------------------------------------------------
-- Purpose: Insert fertilizer function into the pallets.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemLiquidTank
ManureSystemLiquidTank = {}
ManureSystemLiquidTank.updatedStoreItemConfigurations = {}

function ManureSystemLiquidTank.prerequisitesPresent(specializations)
    return true
end

function ManureSystemLiquidTank.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", ManureSystemLiquidTank)
end

function ManureSystemLiquidTank:onPreLoad(savegame)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d)#type"):format(0), "COUPLINGFERTILIZER")
    setXMLBool(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#createNode"):format(0), true)
    setXMLInt(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#id"):format(0), 3)
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#position"):format(0), "0.638 0.33 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet#rotation"):format(0), "0 0 0")
    setXMLString(self.xmlFile, ("vehicle.manureSystemConnectors.connector(%d).sharedSet.connector#type"):format(0), "CONNECTOR_1")

    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d)#name"):format(0), "$l10n_configuration_disappearOnEmpty")
    setXMLFloat(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d)#price"):format(0), 0)

    -- Don't delete the pallet when empty but make it refillable.
    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d)#name"):format(1), "$l10n_configuration_refillable")
    setXMLFloat(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d)#price"):format(1), 0)
    setXMLBool(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits#removeVehicleIfEmpty"):format(1), false)
    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d)#unit"):format(1, 0), "$l10n_unit_literShort")
    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d)#fillTypes"):format(1, 0), "LIQUIDFERTILIZER")
    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d)#startFillType"):format(1, 0), "LIQUIDFERTILIZER")
    setXMLFloat(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d)#capacity"):format(1, 0), 2000)
    setXMLFloat(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d)#startFillLevel"):format(1, 0), 2000)
    setXMLString(self.xmlFile, ("vehicle.fillUnit.fillUnitConfigurations.fillUnitConfiguration(%d).fillUnits.fillUnit(%d).fillRootNode#node"):format(1, 0), "0>")

    if ManureSystemLiquidTank.updatedStoreItemConfigurations[self.configFileName] == nil then
        setXMLBool(self.xmlFile, "vehicle.storeData.canBeSold", true)
        local storeItem = g_storeManager:getItemByXMLFilename(self.configFileName)
        storeItem.canBeSold = true
        storeItem.configurations = StoreItemUtil.getConfigurationsFromXML(self.xmlFile, getXMLRootName(self.xmlFile), self.baseDirectory, self.customEnvironment, false, storeItem)
        ManureSystemLiquidTank.updatedStoreItemConfigurations[self.configFileName] = true
    end
end
