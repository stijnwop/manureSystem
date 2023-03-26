---@class ManureSystemPlaceableSilo
ManureSystemPlaceableSilo = {}
ManureSystemPlaceableSilo.MOD_NAME = g_currentModName

function ManureSystemPlaceableSilo.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(PlaceableSilo, specializations)
end

function ManureSystemPlaceableSilo.registerOverwrittenFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "setIsConnected", ManureSystemPlaceableSilo.setIsConnected)
    SpecializationUtil.registerFunction(placeableType, "setIsManureFlowOpen", ManureSystemPlaceableSilo.setIsManureFlowOpen)
    SpecializationUtil.registerFunction(placeableType, "getConnectorById", ManureSystemPlaceableSilo.getConnectorById)
    SpecializationUtil.registerFunction(placeableType, "hasConnectors", ManureSystemPlaceableSilo.hasConnectors)
    SpecializationUtil.registerFunction(placeableType, "getConnectorsByType", ManureSystemPlaceableSilo.getConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getActiveConnectorsByType", ManureSystemPlaceableSilo.getActiveConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getConnectorInRangeNode", ManureSystemPlaceableSilo.getConnectorInRangeNode)

    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillType", ManureSystemPlaceableSilo.getFillUnitFillType)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitAllowsFillType", ManureSystemPlaceableSilo.getFillUnitAllowsFillType)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillLevel", ManureSystemPlaceableSilo.getFillUnitFillLevel)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFillLevelPercentage", ManureSystemPlaceableSilo.getFillUnitFillLevelPercentage)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitCapacity", ManureSystemPlaceableSilo.getFillUnitCapacity)
    SpecializationUtil.registerFunction(placeableType, "getFillUnitFreeCapacity", ManureSystemPlaceableSilo.getFillUnitFreeCapacity)
    SpecializationUtil.registerFunction(placeableType, "getFillArmFillUnitIndex", ManureSystemPlaceableSilo.getFillArmFillUnitIndex)
    SpecializationUtil.registerFunction(placeableType, "addFillUnitFillLevel", ManureSystemPlaceableSilo.addFillUnitFillLevel)
    SpecializationUtil.registerFunction(placeableType, "isUnderFillPlane", ManureSystemPlaceableSilo.isUnderFillPlane)
end

function ManureSystemPlaceableSilo.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onReadStream", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onWriteStream", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onFinalizePlacement", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onUpdate", ManureSystemPlaceableSilo)
    SpecializationUtil.registerEventListener(placeableType, "onUpdateTick", ManureSystemPlaceableSilo)
end

function ManureSystemPlaceableSilo.registerXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableSilo")
    ManureSystemConnectors.registerXMLPaths(schema, "placeable")
    schema:register(XMLValueType.FLOAT, "placeable.manureSystemFillArmReceiver#fillArmOffset", "Offset for the fillarm interaction")
    schema:setXMLSpecializationType()
end

function ManureSystemPlaceableSilo.registerSavegameXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableSilo")
    schema:setXMLSpecializationType()
end

function ManureSystemPlaceableSilo:onLoad(savegame)
    self.spec_manureSystemPlaceableSilo = self[("spec_%s.manureSystemPlaceableSilo"):format(ManureSystemPlaceableSilo.MOD_NAME)]
    local spec = self.spec_manureSystemPlaceableSilo

    spec.hasConnectors = self.xmlFile:getBool("placeable.manureSystem#hasConnectors") or false
    spec.hasFillArmReceiver = self.xmlFile:getBool("placeable.manureSystem#hasFillArmReceiver") or false
    if spec.hasConnectors then
        spec.connectors = ManureSystemConnectors.new(self, g_currentMission.manureSystem)
        if not spec.connectors:loadFromPlaceableXML(self.xmlFile) then
            spec.connectors:delete()
        end

    end

    if spec.hasFillArmReceiver then
        spec.fillArmOffset = self.xmlFile:getValue("placeable.manureSystemFillArmReceiver#fillArmOffset", 0)
    end

    if not spec.hasConnectors or not spec.connectors:hasConnectors() then
        SpecializationUtil.removeEventListener(self, "onFinalizePlacement", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemPlaceableSilo)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemPlaceableSilo)
    end
end

function ManureSystemPlaceableSilo:onDelete()
    self.spec_manureSystemPlaceableSilo.connectors:delete()
end

function ManureSystemPlaceableSilo:onReadStream(streamId, connection)
    self.spec_manureSystemPlaceableSilo.connectors:readStream(streamId, connection)
end

function ManureSystemPlaceableSilo:onWriteStream(streamId, connection)
    self.spec_manureSystemPlaceableSilo.connectors:writeStream(streamId, connection)
end

function ManureSystemPlaceableSilo:onFinalizePlacement()
    self.spec_manureSystemPlaceableSilo.connectors:register()
end

function ManureSystemPlaceableSilo:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    self.spec_manureSystemPlaceableSilo.connectors:update(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
end

function ManureSystemPlaceableSilo:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    self.spec_manureSystemPlaceableSilo.connectors:updateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
end

function ManureSystemPlaceableSilo:setIsConnected(id, state, grabNodeId, hose, noEventSend)
    self.spec_manureSystemPlaceableSilo.connectors:setIsConnected(id, state, grabNodeId, hose, noEventSend)
end

function ManureSystemPlaceableSilo:setIsManureFlowOpen(id, state, force, noEventSend)
    self.spec_manureSystemPlaceableSilo.connectors:setIsManureFlowOpen(id, state, force, noEventSend)
end

function ManureSystemPlaceableSilo:hasConnectors()
    return self.spec_manureSystemPlaceableSilo.connectors:hasConnectors()
end

function ManureSystemPlaceableSilo:getConnectorById(type)
    return self.spec_manureSystemPlaceableSilo.connectors:getConnectorById(type)
end

function ManureSystemPlaceableSilo:getConnectorsByType(type)
    return self.spec_manureSystemPlaceableSilo.connectors:getConnectorsByType(type)
end

function ManureSystemPlaceableSilo:getActiveConnectorsByType(type)
    return self.spec_manureSystemPlaceableSilo.connectors:getActiveConnectorsByType(type)
end

function ManureSystemPlaceableSilo:getConnectorInRangeNode()
    return self.spec_manureSystemPlaceableSilo.connectors:getConnectorInRangeNode()
end

local function getStorage(self)
    local spec = self.spec_silo

    --Todo: support multi storage? Seems to be not used for silos..
    for _, storage in ipairs(spec.storages) do
        return storage
    end

    return nil
end

function ManureSystemPlaceableSilo:getFillUnitFillType(unitIndex)
    local storage = getStorage(self)

    for fillTypeIndex, fillLevel in pairs(storage:getFillLevels()) do
        if fillLevel > 0 then
            return fillTypeIndex -- only support first
        end
    end

    return FillType.UNKNOWN
end

function ManureSystemPlaceableSilo:getFillUnitAllowsFillType(_, fillType)
    local storage = getStorage(self)

    for fillTypeIndex, fillLevel in pairs(storage:getFillLevels()) do
        if fillType ~= fillTypeIndex and fillLevel > 0 then
            return false
        end
    end

    return storage:getIsFillTypeSupported(fillType)
end

function ManureSystemPlaceableSilo:getFillUnitFillLevel(unitIndex)
    local storage = getStorage(self)
    local fillType = self:getFillUnitFillType()
    return storage:getFillLevel(fillType)
end

function ManureSystemPlaceableSilo:getFillUnitFillLevelPercentage(unitIndex)
    local fillLevel = self:getFillUnitFillLevel()
    local capacity = self:getFillUnitCapacity()
    return fillLevel / capacity
end

function ManureSystemPlaceableSilo:getFillUnitCapacity(unitIndex)
    local fillType = self:getFillUnitFillType()
    local storage = getStorage(self)
    return storage:getCapacity(fillType)
end

function ManureSystemPlaceableSilo:getFillUnitFreeCapacity(unitIndex)
    local fillType = self:getFillUnitFillType()
    local storage = getStorage(self)
    return storage:getFreeCapacity(fillType)
end

function ManureSystemPlaceableSilo:getFillArmFillUnitIndex()
    -- Always 1 since we don't support multi unit storage.
    return 1
end

function ManureSystemPlaceableSilo:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    local spec = self.spec_silo
    local storage = getStorage(self)
    if storage:getIsFillTypeSupported(fillTypeIndex) then
        if spec.loadingStation:hasFarmAccessToStorage(farmId, storage) then
            local oldFillLevel = storage:getFillLevel(fillTypeIndex)
            storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
            local newFillLevel = storage:getFillLevel(fillTypeIndex)

            movedFillLevel = movedFillLevel + (newFillLevel - oldFillLevel)

            if movedFillLevel >= fillLevelDelta - 0.001 then
                movedFillLevel = fillLevelDelta
            end
        end
    end

    return movedFillLevel
end

function ManureSystemPlaceableSilo:isUnderFillPlane(x, y, z)
    local storage = getStorage(self)

    local node
    if storage.dynamicFillPlane ~= nil then
        node = storage.dynamicFillPlane.node
    else
        local fillType = self:getFillUnitFillType()
        local fillPlane = storage.fillPlanes[fillType]
        if fillPlane ~= nil then
            node = fillPlane.node
        end
    end

    if node == nil then
        return true
    end

    local spec = self.spec_manureSystemPlaceableSilo
    local _, py, _ = getWorldTranslation(node)
    py = py + spec.fillArmOffset

    return py >= y
end
