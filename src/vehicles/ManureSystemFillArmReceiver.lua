----------------------------------------------------------------------------------------------------
-- ManureSystemFillArmReceiver
----------------------------------------------------------------------------------------------------
-- Purpose: allows fillArm interaction with the vehicle.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemFillArmReceiver
ManureSystemFillArmReceiver = {}
ManureSystemFillArmReceiver.MOD_NAME = g_currentModName

function ManureSystemFillArmReceiver.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(FillVolume, specializations)
end

function ManureSystemFillArmReceiver.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "isUnderFillPlane", ManureSystemFillArmReceiver.isUnderFillPlane)
end

function ManureSystemFillArmReceiver.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemFillArmReceiver)
end

function ManureSystemFillArmReceiver:onLoad(savegame)
    self.spec_manureSystemFillArmReceiver = self[("spec_%s.manureSystemFillArmReceiver"):format(ManureSystemFillArmReceiver.MOD_NAME)]

    if #self.spec_fillVolume.volumes == 0 then
        return
    end

    local fillVolumeIndex = Utils.getNoNil(getXMLInt(self.xmlFile, "vehicle.manureSystemFillArmReceiver#fillVolumeIndex"), 1)
    if self.spec_fillVolume.volumes[fillVolumeIndex] == nil then
        g_logManager:xmlWarning(self.configFileName, "Invalid fillVolumeIndex '%d'!", fillVolumeIndex)

        return
    end

    local spec = self.spec_manureSystemFillArmReceiver
    spec.fillVolumeIndex = fillVolumeIndex
    spec.fillArmOffset = Utils.getNoNil(getXMLFloat(self.xmlFile, "vehicle.manureSystemFillArmReceiver#fillArmOffset"), 0)

    spec = self.spec_fillTriggerVehicle

    if spec.fillTrigger ~= nil then
        spec.fillTrigger:delete()
        spec.fillTrigger = nil
    end
end

function ManureSystemFillArmReceiver:isUnderFillPlane(x, y, z)
    local spec = self.spec_fillVolume
    if #spec.volumes == 0 then
        return false
    end

    local fillVolumeIndex = self.spec_manureSystemFillArmReceiver.fillVolumeIndex
    local fillArmOffset = self.spec_manureSystemFillArmReceiver.fillArmOffset

    if spec.volumes[fillVolumeIndex].volume ~= nil then
        local volume = spec.volumes[fillVolumeIndex].volume

        local xl, _, zl = worldToLocal(volume, x, y, z)

        local height = getFillPlaneHeightAtLocalPos(volume, xl, zl)
        local _, volumeWorldY, _ = localToWorld(volume, xl, height, zl)

        volumeWorldY = volumeWorldY + fillArmOffset

        return volumeWorldY >= y
    end

    return false
end
