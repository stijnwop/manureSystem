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
ManureSystemPlaceableFillArmReceiver.THICKNESS_SEND_THRESHOLD = 0.001

---@return boolean
function ManureSystemPlaceableFillArmReceiver.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(ManureSystemPlaceableBase, specializations)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "getSupportsFillArms", ManureSystemPlaceableFillArmReceiver.getSupportsFillArms)
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
    SpecializationUtil.registerOverwrittenFunction(placeableType, "addManureSystemStorage", ManureSystemPlaceableFillArmReceiver.addManureSystemStorage)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "removeManureSystemStorage", ManureSystemPlaceableFillArmReceiver.removeManureSystemStorage)

    SpecializationUtil.registerOverwrittenFunction(placeableType, "getFillUnitFillType", ManureSystemPlaceableFillArmReceiver.getFillUnitFillType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "addFillUnitFillLevel", ManureSystemPlaceableFillArmReceiver.addFillUnitFillLevel)

    SpecializationUtil.registerOverwrittenFunction(placeableType, "getNeedHourChanged", ManureSystemPlaceableFillArmReceiver.getNeedHourChanged)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "updateInfo", ManureSystemPlaceableFillArmReceiver.updateInfo)
end

---@return void
function ManureSystemPlaceableFillArmReceiver.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableFillArmReceiver)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableFillArmReceiver)
    SpecializationUtil.registerEventListener(placeableType, "onReadStream", ManureSystemPlaceableFillArmReceiver)
    SpecializationUtil.registerEventListener(placeableType, "onWriteStream", ManureSystemPlaceableFillArmReceiver)
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
    schema:register(XMLValueType.INT, basePath .. ".storage(?)#index", "Storage index")
    schema:register(XMLValueType.STRING, basePath .. ".storage(?).node(?)#fillType", "Fill type")
    schema:register(XMLValueType.FLOAT, basePath .. ".storage(?).node(?)#thickness", "Thickness")
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onPreLoad(savegame)
    local spec = self[("spec_%s.manureSystemPlaceableFillArmReceiver"):format(ManureSystemPlaceableFillArmReceiver.MOD_NAME)]

    spec.fillPlanes = {}
    spec.thickness = {}
    spec.thicknessSent = {}

    spec.fillPlaneInfo = {}

    self.spec_manureSystemPlaceableFillArmReceiver = spec
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onLoad(savegame)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    spec.isActive = self.xmlFile:getBool("placeable.manureSystem#hasFillArmReceiver", false)
    spec.fillArmOffset = self.xmlFile:getValue("placeable.manureSystemFillArmReceiver#fillArmOffset", 0)
    spec.thicknessEnabled = self.xmlFile:getValue("placeable.manureSystemFillArmReceiver#thicknessEnabled", spec.isActive)

    if not spec.thicknessEnabled then
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemPlaceableFillArmReceiver)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemPlaceableFillArmReceiver)
        SpecializationUtil.removeEventListener(self, "onHourChanged", ManureSystemPlaceableFillArmReceiver)
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:loadFromXMLFile(xmlFile, key)
    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        xmlFile:iterate(key .. ".storage", function(_, storageKey)
            local fillUnitIndex = xmlFile:getValue(storageKey .. "#index")
            if fillUnitIndex ~= nil then
                xmlFile:iterate(storageKey .. ".node", function(_, nodeKey)
                    local fillTypeName = xmlFile:getValue(nodeKey .. "#fillType")
                    if fillTypeName ~= nil then
                        local fillTypeIndex = g_fillTypeManager:getFillTypeIndexByName(fillTypeName)
                        local thickness = xmlFile:getValue(nodeKey .. "#thickness")
                        if fillTypeIndex ~= nil and thickness ~= nil then
                            self:setThickness(fillUnitIndex, fillTypeIndex, thickness, true)
                        end
                    end
                end)
            end
        end)
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:saveToXMLFile(xmlFile, key, usedModNames)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver
    if spec.thicknessEnabled then
        local i = 0
        for storage, data in pairs(spec.thickness) do
            local storageKey = ("%s.storage(%d)"):format(key, i)

            local j = 0
            for fillTypeIndex, thickness in pairs(data) do
                if thickness > 0 then
                    local nodeKey = ("%s.node(%d)"):format(storageKey, j)
                    local fillTypeName = g_fillTypeManager:getFillTypeNameByIndex(fillTypeIndex)
                    xmlFile:setValue(nodeKey .. "#fillType", fillTypeName)
                    xmlFile:setValue(nodeKey .. "#thickness", thickness)
                    j = j + 1
                end
            end

            if j > 0 then
                xmlFile:setValue(storageKey .. "#index", storage.index)
                i = i + 1
            end
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onReadStream(streamId, connection)
    for _, data in pairs(self.spec_manureSystemPlaceableFillArmReceiver.thickness) do
        local fillUnitIndex = streamReadUInt8(streamId)

        for _, _ in pairs(data) do
            local fillTypeIndex = streamReadUIntN(streamId, FillTypeManager.SEND_NUM_BITS)
            local thickness = streamReadFloat32(streamId)
            self:setThickness(fillUnitIndex, fillTypeIndex, thickness, true)
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onWriteStream(streamId, connection)
    for storage, data in pairs(self.spec_manureSystemPlaceableFillArmReceiver.thickness) do
        streamWriteUInt8(streamId, storage.index)

        for fillTypeIndex, thickness in pairs(data) do
            streamWriteUIntN(streamId, fillTypeIndex, FillTypeManager.SEND_NUM_BITS)
            streamWriteFloat32(streamId, thickness)
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:onHourChanged()
    for storage, data in pairs(self.spec_manureSystemPlaceableFillArmReceiver.thickness) do
        for fillTypeIndex, _ in pairs(data) do
            self:increaseThickness(storage.index, fillTypeIndex)
        end
    end
end

---@return boolean
function ManureSystemPlaceableFillArmReceiver:getSupportsFillArms()
    return self.spec_manureSystemPlaceableFillArmReceiver.isActive
end

---@return table | nil
function ManureSystemPlaceableFillArmReceiver:getFillPlaneInfo()
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    if not spec.isActive and not spec.thicknessEnabled then
        return nil
    end

    return spec.fillPlaneInfo
end

---@return void
function ManureSystemPlaceableFillArmReceiver:updateFillPlaneInfo(x, y, z)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    if not spec.isActive and not spec.thicknessEnabled then
        return
    end

    local closestDistance = math.huge

    for storage, fillPlanes in pairs(spec.fillPlanes) do
        for _, fillPlane in ipairs(fillPlanes) do
            local distance = MathUtil.vector2Length(fillPlane.worldPosX - x, fillPlane.worldPosZ - z)

            local force = false
            if math.abs(distance - closestDistance) < 0.1 then
                local fillLevel1 = storage:getFillLevel(fillPlane.fillTypeIndex)
                local fillLevel2 = storage:getFillLevel(spec.fillPlaneInfo.fillTypeIndex)
                force = fillLevel1 > fillLevel2
            end

            if distance < closestDistance or force then
                closestDistance = distance

                spec.fillPlaneInfo.node = fillPlane.node
                spec.fillPlaneInfo.isDynamic = fillPlane.isDynamic
                spec.fillPlaneInfo.fillTypeIndex = fillPlane.fillTypeIndex
                spec.fillPlaneInfo.fillArmFillUnitIndex = storage.index
            end
        end
    end
end

---@return void
function ManureSystemPlaceableFillArmReceiver:resetFillPlaneInfo()
    local spec = self.spec_manureSystemPlaceableFillArmReceiver

    if not spec.isActive and not spec.thicknessEnabled then
        return
    end

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
function ManureSystemPlaceableFillArmReceiver:setThickness(fillUnitIndex, fillTypeIndex, thickness, ...)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver
    if spec.thicknessEnabled then
        local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
        if storage ~= nil then
            if spec.thickness[storage] ~= nil and spec.thickness[storage][fillTypeIndex] ~= nil then
                spec.thickness[storage][fillTypeIndex] = MathUtil.clamp(thickness, 0, 1)

                local diff = spec.thicknessSent[storage][fillTypeIndex] - spec.thickness[storage][fillTypeIndex]
                if math.abs(diff) > ManureSystemPlaceableFillArmReceiver.THICKNESS_SEND_THRESHOLD then
                    ManureSystemThicknessEvent.sendEvent(self, fillUnitIndex, fillTypeIndex, thickness, ...)
                    spec.thicknessSent[storage][fillTypeIndex] = spec.thickness[storage][fillTypeIndex]
                end
            end
        end
    end
end

---@return number
function ManureSystemPlaceableFillArmReceiver:getThickness(fillUnitIndex, fillTypeIndex)
    local spec = self.spec_manureSystemPlaceableFillArmReceiver
    if spec.thicknessEnabled then
        local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
        if storage ~= nil then
            if spec.thickness[storage] ~= nil and spec.thickness[storage][fillTypeIndex] ~= nil then
                return spec.thickness[storage][fillTypeIndex]
            end
        end
    end

    return 0
end

---@return void
function ManureSystemPlaceableFillArmReceiver:increaseThickness(fillUnitIndex, fillTypeIndex)
    if not self.isServer then
        return
    end

    if not self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        return
    end

    -- Manure with up to 4% solids content can be handled as a liquid with irrigation equipment
    -- Manure with 4 to 10% solids content can be handled as a slurry

    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage == nil then
        return
    end

    local capacity = storage:getCapacity(fillTypeIndex)
    if capacity <= 0 then
        return
    end

    local fillLevel = storage:getFillLevel(fillTypeIndex)
    if fillLevel <= 0 then
        return
    end

    local thickness = self:getThickness(fillUnitIndex, fillTypeIndex)
    if thickness >= 1 then
        return
    end

    -- The more it's filled the slower thickening is.
    local percentage = fillLevel / capacity
    local mq = (1.1 - percentage) * 0.001

    self:setThickness(fillUnitIndex, fillTypeIndex, thickness + mq * 2)
end

---@return void
function ManureSystemPlaceableFillArmReceiver:decreaseThickness(fillUnitIndex, fillTypeIndex, mixPerSecond)
    if not self.isServer then
        return
    end

    if not self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        return
    end

    local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
    if storage == nil then
        return
    end

    local fillLevel = storage:getFillLevel(fillTypeIndex)
    if fillLevel <= 0 then
        return
    end

    local thickness = self:getThickness(fillUnitIndex, fillTypeIndex)
    if thickness <= 0 then
        return
    end

    if mixPerSecond <= 0 then
        return
    end

    -- Mixed amount depends on the fill level because low fill level is mixed faster.
    local mixedAmount = mixPerSecond / 100 / fillLevel

    self:setThickness(fillUnitIndex, fillTypeIndex, thickness - mixedAmount)
end

----------------
-- Overwrites --
----------------

---@return boolean, number
function ManureSystemPlaceableFillArmReceiver:addManureSystemStorage(superFunc, storage, ...)
    local success, index = superFunc(self, storage, ...)

    if success then
        local spec = self.spec_manureSystemPlaceableFillArmReceiver

        spec.fillPlanes[storage] = {}
        spec.thickness[storage] = {}
        spec.thicknessSent[storage] = {}

        if storage.dynamicFillPlane ~= nil then
            local fillTypeIndex = nil

            local textureArrayIndex, _, _, _ = getShaderParameter(storage.dynamicFillPlane, "fillTypeId")
            if textureArrayIndex ~= nil then
                fillTypeIndex = g_currentMission.manureSystem:getFillTypeIndexByTextureArrayIndex(textureArrayIndex + 1)
            end

            if fillTypeIndex == nil or not storage:getIsFillTypeSupported(fillTypeIndex) then
                fillTypeIndex = next(storage:getSupportedFillTypes())
            end

            local wx, _, wz = getWorldTranslation(storage.dynamicFillPlane)

            table.insert(spec.fillPlanes[storage], {
                node = storage.dynamicFillPlane,
                worldPosX = wx,
                worldPosZ = wz,
                isDynamic = true,
                fillTypeIndex = fillTypeIndex
            })
        end

        if storage.fillPlanes ~= nil then
            for fillTypeIndex, fillPlane in pairs(storage.fillPlanes) do
                if fillPlane.loaded then
                    local wx, _, wz = getWorldTranslation(fillPlane.node)

                    table.insert(spec.fillPlanes[storage], {
                        node = fillPlane.node,
                        worldPosX = wx,
                        worldPosZ = wz,
                        isDynamic = false,
                        fillTypeIndex = fillTypeIndex
                    })
                end
            end
        end

        if #spec.fillPlanes[storage] > 0 then
            for _, fillPlane in ipairs(spec.fillPlanes[storage]) do
                spec.thickness[storage][fillPlane.fillTypeIndex] = 0 -- 0-1 range
                spec.thicknessSent[storage][fillPlane.fillTypeIndex] = 0 -- 0-1 range
            end
        else
            spec.fillPlanes[storage] = nil
            spec.thickness[storage] = nil
            spec.thicknessSent[storage] = nil
        end
    end

    return success, index
end

---@return boolean
function ManureSystemPlaceableFillArmReceiver:removeManureSystemStorage(superFunc, storage, ...)
    local success = superFunc(self, storage, ...)

    if success then
        local spec = self.spec_manureSystemPlaceableFillArmReceiver

        spec.fillPlanes[storage] = nil
        spec.thickness[storage] = nil
        spec.thicknessSent[storage] = nil
    end

    return success
end

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
function ManureSystemPlaceableFillArmReceiver:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, ...)
    local movedFillLevel = superFunc(self, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, ...)

    if self.spec_manureSystemPlaceableFillArmReceiver.thicknessEnabled then
        if movedFillLevel > 0 then
            self:decreaseThickness(fillUnitIndex, fillTypeIndex, movedFillLevel)
        elseif movedFillLevel < 0 then
            local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
            if storage ~= nil then
                local fillLevel = storage:getFillLevel(fillTypeIndex)
                if fillLevel <= 0 then
                    self:setThickness(fillUnitIndex, fillTypeIndex, 0)
                end
            end
        end
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

    local spec = self.spec_manureSystemPlaceableFillArmReceiver
    if spec.thicknessEnabled then
        local averageThicknessByFillType = {}

        for storage, data in pairs(spec.thickness) do
            for fillTypeIndex, thickness in pairs(data) do
                if storage:getFillLevel(fillTypeIndex) > 0 then
                    if averageThicknessByFillType[fillTypeIndex] == nil then
                        averageThicknessByFillType[fillTypeIndex] = thickness
                    else
                        averageThicknessByFillType[fillTypeIndex] = (averageThicknessByFillType[fillTypeIndex] + thickness) / 2
                    end
                end
            end
        end

        for fillTypeIndex, thickness in pairs(averageThicknessByFillType) do
            table.insert(infoTable, {
                text = ("%d%%"):format(thickness * 100),
                title = ("%s (%s)"):format(g_i18n:getText("info_title_thickness"), g_fillTypeManager:getFillTypeTitleByIndex(fillTypeIndex))
            })
        end
    end
end
