-- ManureSystemPlaceableFillArmReceiver
--
-- Author: Stijn Wopereis
-- Description: Allows fill arm interaction with placeables
-- Name: ManureSystemPlaceableFillArmReceiver
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableFillArmReceiver
ManureSystemPlaceableFillArmReceiver = {}
ManureSystemPlaceableFillArmReceiver.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableFillArmReceiver.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(ManureSystemPlaceableBase, specializations)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "getFillPlaneInfo", ManureSystemPlaceableFillArmReceiver.getFillPlaneInfo)
    SpecializationUtil.registerFunction(placeableType, "updateFillPlaneInfo", ManureSystemPlaceableFillArmReceiver.updateFillPlaneInfo)
    SpecializationUtil.registerFunction(placeableType, "resetFillPlaneInfo", ManureSystemPlaceableFillArmReceiver.resetFillPlaneInfo)
    SpecializationUtil.registerFunction(placeableType, "getFillArmFillUnitIndex", ManureSystemPlaceableFillArmReceiver.getFillArmFillUnitIndex)
    SpecializationUtil.registerFunction(placeableType, "isUnderFillPlane", ManureSystemPlaceableFillArmReceiver.isUnderFillPlane)

    SpecializationUtil.registerFunction(placeableType, "setThickness", ManureSystemPlaceableFillArmReceiver.setThickness)
    SpecializationUtil.registerFunction(placeableType, "getThickness", ManureSystemPlaceableFillArmReceiver.getThickness)
    SpecializationUtil.registerFunction(placeableType, "increaseThickness", ManureSystemPlaceableFillArmReceiver.increaseThickness)
    SpecializationUtil.registerFunction(placeableType, "decreaseThickness", ManureSystemPlaceableFillArmReceiver.decreaseThickness)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerOverwrittenFunctions(placeableType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "getFillUnitFillType", ManureSystemPlaceableFillArmReceiver.getFillUnitFillType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "addFillUnitFillLevel", ManureSystemPlaceableFillArmReceiver.addFillUnitFillLevel)

    SpecializationUtil.registerOverwrittenFunction(placeableType, "getNeedHourChanged", ManureSystemPlaceableFillArmReceiver.getNeedHourChanged)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "updateInfo", ManureSystemPlaceableFillArmReceiver.updateInfo)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableFillArmReceiver)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableFillArmReceiver)
    SpecializationUtil.registerEventListener(placeableType, "onHourChanged", ManureSystemPlaceableFillArmReceiver)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableFillArmReceiver")
    schema:register(XMLValueType.FLOAT, basePath .. ".manureSystemFillArmReceiver#fillArmOffset", "Offset for the fill arm interaction", 0)
    schema:register(XMLValueType.BOOL, basePath .. ".manureSystemFillArmReceiver#thicknessEnabled", "Pump material is thickening during time and can be mixed up again", "Fill arm receiver is active")
    schema:setXMLSpecializationType()
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerSavegameXMLPaths(schema, basePath)
    schema:register(XMLValueType.FLOAT, basePath .. "#thickness", "Thickness")
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onPreLoad(savegame)
    self.spec_manureSystemPlaceableFillArmReceiver = self[("spec_%s.manureSystemPlaceableFillArmReceiver"):format(ManureSystemPlaceableFillArmReceiver.MOD_NAME)]
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onLoad(savegame)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    spec.isActive = self.xmlFile:getBool("placeable.manureSystem#hasFillArmReceiver", false)

    spec.fillPlaneInfo = {}
    spec.fillArmOffset = self.xmlFile:getValue("placeable.manureSystemFillArmReceiver#fillArmOffset", 0)

    spec.thicknessEnabled = self.xmlFile:getBool("placeable.manureSystemFillArmReceiver#thicknessEnabled", spec.isActive)
    spec.thickness = 0 -- 0-1 range

    if not spec.thicknessEnabled then
        SpecializationUtil.removeEventListener(self, "onHourChanged", ManureSystemPlaceableFillArmReceiver)
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:loadFromXMLFile(xmlFile, key)
    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        local thickness = xmlFile:getValue(key .. "#thickness")
        if thickness ~= nil then
            self:setThickness(thickness)
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:saveToXMLFile(xmlFile, key, usedModNames)
    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        local thickness = self:getThickness()
        xmlFile:setValue(key .. "#thickness", thickness)
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onHourChanged()
    self:increaseThickness()
end

---@return table
function ManureSystemPlaceableFillArmReceiver:getFillPlaneInfo()
    return self.spec_manureSystemPlaceableFillArmReceiver.fillPlaneInfo
end

---@return void
function ManureSystemPlaceableFillArmReceiver:updateFillPlaneInfo(x, y, z)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    if not spec.isActive and not spec.thicknessEnabled then
        return
    end

    local storages = self:getManureSystemStorages()
    if storages ~= nil then
        local closestDistance = math.huge

        for i, storage in ipairs(storages) do
            if storage.dynamicFillPlane ~= nil then
                local wx, _, wz = getWorldTranslation(storage.dynamicFillPlane)
                local distance = MathUtil.vector2Length(wx - x, wz - z)
                if distance < closestDistance then
                    closestDistance = distance

                    if storage.dynamicFillPlaneFillType == nil then
                        local textureArrayIndex, _, _, _ = getShaderParameter(storage.dynamicFillPlane, "fillTypeId")
                        if textureArrayIndex ~= nil then
                            for _, fillType in ipairs(g_fillTypeManager:getFillTypes()) do
                                if fillType.textureArrayIndex == textureArrayIndex then
                                    storage.dynamicFillPlaneFillType = fillType.index
                                    break
                                end
                            end
                        end

                        if storage.dynamicFillPlaneFillType == nil then
                            storage.dynamicFillPlaneFillType = next(storage:getSupportedFillTypes())
                        end
                    end

                    spec.fillPlaneInfo.node = storage.dynamicFillPlane
                    spec.fillPlaneInfo.isDynamic = true
                    spec.fillPlaneInfo.fillTypeIndex = storage.dynamicFillPlaneFillType
                    spec.fillPlaneInfo.fillArmFillUnitIndex = i
                end
            end

            if storage.fillPlanes ~= nil then
                for fillTypeIndex, fillPlane in pairs(storage.fillPlanes) do
                    if fillPlane.loaded then
                        local wx, _, wz = getWorldTranslation(fillPlane.node)
                        local distance = MathUtil.vector2Length(wx - x, wz - z)

                        local force = false
                        if math.abs(distance - closestDistance) < 0.1 then
                            local fillLevel1 = storage:getFillLevel(fillTypeIndex)
                            local fillLevel2 = storage:getFillLevel(spec.fillPlaneInfo.fillTypeIndex)
                            force = fillLevel1 > fillLevel2
                        end

                        if distance < closestDistance or force then
                            closestDistance = distance

                            spec.fillPlaneInfo.node = fillPlane.node
                            spec.fillPlaneInfo.isDynamic = false
                            spec.fillPlaneInfo.fillTypeIndex = fillTypeIndex
                            spec.fillPlaneInfo.fillArmFillUnitIndex = i
                        end
                    end
                end
            end
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:resetFillPlaneInfo()
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    spec.fillPlaneInfo.node = nil
    spec.fillPlaneInfo.isDynamic = false
    spec.fillPlaneInfo.fillTypeIndex = FillType.UNKNOWN
    spec.fillPlaneInfo.fillArmFillUnitIndex = 0
end

---@return number
function ManureSystemPlaceableFillArmReceiver:getFillArmFillUnitIndex()
    local fillPlaneInfo = self:getFillPlaneInfo()
    if fillPlaneInfo ~= nil then
        return fillPlaneInfo.fillArmFillUnitIndex
    end

    return 0
end

---@return boolean
function ManureSystemPlaceableFillArmReceiver:isUnderFillPlane(x, y, z)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    if not spec.isActive and not spec.thicknessEnabled then
        return false
    end

    local fillPlaneInfo = self:getFillPlaneInfo()
    if fillPlaneInfo ~= nil then
        local fillPlane = fillPlaneInfo.node
        if fillPlane ~= nil then
            if fillPlaneInfo.isDynamic then
                local lx, ly, lz = worldToLocal(fillPlane, x, y, z)
                local height = getFillPlaneHeightAtLocalPos(fillPlane, lx, lz)
                if height + spec.fillArmOffset >= ly then
                    return true
                end
            else
                local _, wy, _ = getWorldTranslation(fillPlane)
                if wy + spec.fillArmOffset >= y then
                    return true
                end
            end
        end
    end

    return false
end

---@return void
function ManureSystemPlaceableFillArmReceiver:setThickness(thickness)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver
    if spec.thicknessEnabled then
        spec.thickness = MathUtil.clamp(thickness, 0, 1)
    end
end

---@return number
function ManureSystemPlaceableFillArmReceiver:getThickness()
    return self.spec_manureSystemPlaceableFillArmReceiver.thickness
end

---@return void
function ManureSystemPlaceableFillArmReceiver:increaseThickness()
    if not self.isServer then
        return
    end

    if not self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        return
    end

    -- Manure with up to 4% solids content can be handled as a liquid with irrigation equipment
    -- Manure with 4 to 10% solids content can be handled as a slurry

    local thickness = self:getThickness()

    -- The more it's filled the slower thickening is.
    local fillUnitIndex = self:getFillArmFillUnitIndex()
    local percentage = self:getFillUnitFillLevelPercentage(fillUnitIndex)
    local mq = (1.1 - percentage) * 0.001

    self:setThickness(thickness + mq * 2)
end

---@return void
function ManureSystemPlaceableFillArmReceiver:decreaseThickness(mixPerSecond)
    if not self.isServer then
        return
    end

    if not self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        return
    end

    if mixPerSecond <= 0 then
        return
    end

    local fillUnitIndex = self:getFillArmFillUnitIndex()
    local fillLevel = self:getFillUnitFillLevel(fillUnitIndex)
    if fillLevel <= 0 then
        return
    end

    local thickness = self:getThickness()

    -- Mixed amount depends on the fill level because low fill level is mixed faster.
    local mixedAmount = mixPerSecond / 100 / fillLevel

    self:setThickness(thickness - mixedAmount)
end

----------------
-- Overwrites --
----------------

---@return number
function ManureSystemPlaceableFillArmReceiver:getFillUnitFillType(superFunc, fillUnitIndex, ...)
    if fillUnitIndex == self:getFillArmFillUnitIndex() then
        local fillPlaneInfo = self:getFillPlaneInfo()
        if fillPlaneInfo ~= nil and fillPlaneInfo.node ~= nil then
            local storage = self:getManureSystemStorageByIndex(fillPlaneInfo.fillArmFillUnitIndex)
            if storage ~= nil then
                local fillLevel = storage:getFillLevel(fillPlaneInfo.fillTypeIndex)
                if fillLevel > 0 then
                    return fillPlaneInfo.fillTypeIndex
                end
            end
        end

        return FillType.UNKNOWN
    end

    return superFunc(self, fillUnitIndex, ...)
end

---@return number
function ManureSystemPlaceableFillArmReceiver:addFillUnitFillLevel(superFunc, ...)
    local movedFillLevel = superFunc(self, ...)

    if movedFillLevel > 0 then
        self:decreaseThickness(movedFillLevel)
    end

    return movedFillLevel
end

---@return boolean
function ManureSystemPlaceableFillArmReceiver:getNeedHourChanged(superFunc, ...)
    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        return true
    end

    return superFunc(self, ...)
end

---@return void
function ManureSystemPlaceableFillArmReceiver:updateInfo(superFunc, infoTable, ...)
    superFunc(self, infoTable, ...)

    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        local thickness = self:getThickness()

        table.insert(infoTable, {
            text = ("%d%%"):format(thickness * 100),
            title = g_i18n:getText("info_title_thickness")
        })
    end
end
