-- ManureSystemPlaceableConnector
--
-- Author: Stijn Wopereis
-- Description: Connector implementation for placeables
-- Name: ManureSystemPlaceableConnector
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class ManureSystemPlaceableConnector
ManureSystemPlaceableConnector = {}
ManureSystemPlaceableConnector.MOD_NAME = g_currentModName

---@return boolean
function ManureSystemPlaceableConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(ManureSystemPlaceableBase, specializations)
end

---@return void
function ManureSystemPlaceableConnector.registerFunctions(placeableType)
    SpecializationUtil.registerFunction(placeableType, "hasConnectors", ManureSystemPlaceableConnector.hasConnectors)
    SpecializationUtil.registerFunction(placeableType, "getConnectors", ManureSystemPlaceableConnector.getConnectors)
    SpecializationUtil.registerFunction(placeableType, "getConnectorById", ManureSystemPlaceableConnector.getConnectorById)
    SpecializationUtil.registerFunction(placeableType, "getConnectorsByType", ManureSystemPlaceableConnector.getConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getActiveConnectorsByType", ManureSystemPlaceableConnector.getActiveConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getConnectorInRangeNode", ManureSystemPlaceableConnector.getConnectorInRangeNode)
    SpecializationUtil.registerFunction(placeableType, "setIsConnectorActive", ManureSystemPlaceableConnector.setIsConnectorActive)
    SpecializationUtil.registerFunction(placeableType, "getConnectorAllowsFillType", ManureSystemPlaceableConnector.getConnectorAllowsFillType)
    SpecializationUtil.registerFunction(placeableType, "setIsConnected", ManureSystemPlaceableConnector.setIsConnected)
    SpecializationUtil.registerFunction(placeableType, "setIsManureFlowOpen", ManureSystemPlaceableConnector.setIsManureFlowOpen)

    SpecializationUtil.registerFunction(placeableType, "setUsedConnectorId", ManureSystemPlaceableConnector.setUsedConnectorId)

    SpecializationUtil.registerFunction(placeableType, "getAnimatedObjectByIndex", ManureSystemPlaceableConnector.getAnimatedObjectByIndex)
    SpecializationUtil.registerFunction(placeableType, "getIsAnimationPlaying", ManureSystemPlaceableConnector.getIsAnimationPlaying)
    SpecializationUtil.registerFunction(placeableType, "getAnimationTime", ManureSystemPlaceableConnector.getAnimationTime)
    SpecializationUtil.registerFunction(placeableType, "playAnimation", ManureSystemPlaceableConnector.playAnimation)
end

---@return void
function ManureSystemPlaceableConnector.registerOverwrittenFunctions(placeableType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "getFillUnitFillType", ManureSystemPlaceableConnector.getFillUnitFillType)
    SpecializationUtil.registerOverwrittenFunction(placeableType, "getFillUnitAllowsFillType", ManureSystemPlaceableConnector.getFillUnitAllowsFillType)
end

---@return void
function ManureSystemPlaceableConnector.registerEventListeners(placeableType)
    SpecializationUtil.registerEventListener(placeableType, "onPreLoad", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onLoad", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onDelete", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onReadStream", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onWriteStream", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onFinalizePlacement", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onUpdate", ManureSystemPlaceableConnector)
    SpecializationUtil.registerEventListener(placeableType, "onUpdateTick", ManureSystemPlaceableConnector)
end

---@return void
function ManureSystemPlaceableConnector.registerXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableConnector")
    ManureSystemConnectors.registerXMLPaths(schema, basePath)
    schema:setXMLSpecializationType()
end

---@return void
function ManureSystemPlaceableConnector:onPreLoad(savegame)
    self.spec_manureSystemPlaceableConnector = self[("spec_%s.manureSystemPlaceableConnector"):format(ManureSystemPlaceableConnector.MOD_NAME)]
end

---@return void
function ManureSystemPlaceableConnector:onLoad(savegame)
    local spec = self.spec_manureSystemPlaceableConnector

    spec.isActive = self.xmlFile:getBool("placeable.manureSystem#hasConnectors", false)

    if spec.isActive then
        spec.connectors = ManureSystemConnectors.new(self, g_currentMission.manureSystem)
        if not spec.connectors:loadFromPlaceableXML(self.xmlFile) then
            spec.connectors:delete()
            spec.connectors = nil
        end

        spec.usedConnectorId = nil
    end

    if not self:hasConnectors() then
        SpecializationUtil.removeEventListener(self, "onReadStream", ManureSystemPlaceableConnector)
        SpecializationUtil.removeEventListener(self, "onWriteStream", ManureSystemPlaceableConnector)
        SpecializationUtil.removeEventListener(self, "onFinalizePlacement", ManureSystemPlaceableConnector)
        SpecializationUtil.removeEventListener(self, "onUpdate", ManureSystemPlaceableConnector)
        SpecializationUtil.removeEventListener(self, "onUpdateTick", ManureSystemPlaceableConnector)
    end
end

---@return void
function ManureSystemPlaceableConnector:onDelete(...)
    local spec = self.spec_manureSystemPlaceableConnector
    if spec.connectors ~= nil then
        spec.connectors:delete(...)
        spec.connectors = nil
    end
end

---@return void
function ManureSystemPlaceableConnector:onReadStream(...)
    self.spec_manureSystemPlaceableConnector.connectors:readStream(...)
end

---@return void
function ManureSystemPlaceableConnector:onWriteStream(...)
    self.spec_manureSystemPlaceableConnector.connectors:writeStream(...)
end

---@return void
function ManureSystemPlaceableConnector:onFinalizePlacement()
    self.spec_manureSystemPlaceableConnector.connectors:register()
end

---@return void
function ManureSystemPlaceableConnector:onUpdate(...)
    self.spec_manureSystemPlaceableConnector.connectors:update(...)
end

---@return void
function ManureSystemPlaceableConnector:onUpdateTick(...)
    self.spec_manureSystemPlaceableConnector.connectors:updateTick(...)
end

---@return boolean
function ManureSystemPlaceableConnector:hasConnectors(...)
    local spec = self.spec_manureSystemPlaceableConnector
    if spec.connectors ~= nil then
        return spec.connectors:hasConnectors(...)
    end

    return false
end

---@return table | nil
function ManureSystemPlaceableConnector:getConnectors(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getConnectors(...)
    end

    return nil
end

---@return table | nil
function ManureSystemPlaceableConnector:getConnectorById(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getConnectorById(...)
    end

    return nil
end

---@return table | nil
function ManureSystemPlaceableConnector:getConnectorsByType(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getConnectorsByType(...)
    end

    return nil
end

---@return table | nil
function ManureSystemPlaceableConnector:getActiveConnectorsByType(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getActiveConnectorsByType(...)
    end

    return nil
end

---@return number | nil
function ManureSystemPlaceableConnector:getConnectorInRangeNode(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getConnectorInRangeNode(...)
    end

    return nil
end

---@return void
function ManureSystemPlaceableConnector:setIsConnectorActive(...)
    if self:hasConnectors() then
        self.spec_manureSystemPlaceableConnector.connectors:setIsConnectorActive(...)
    end
end

---@return boolean
function ManureSystemPlaceableConnector:getConnectorAllowsFillType(...)
    if self:hasConnectors() then
        return self.spec_manureSystemPlaceableConnector.connectors:getConnectorAllowsFillType(...)
    end

    return false
end

---@return void
function ManureSystemPlaceableConnector:setIsConnected(...)
    if self:hasConnectors() then
        self.spec_manureSystemPlaceableConnector.connectors:setIsConnected(...)
    end
end

---@return void
function ManureSystemPlaceableConnector:setIsManureFlowOpen(...)
    if self:hasConnectors() then
        self.spec_manureSystemPlaceableConnector.connectors:setIsManureFlowOpen(...)
    end
end

---@return void
function ManureSystemPlaceableConnector:setUsedConnectorId(connectorId)
    if self:hasConnectors() then
        self.spec_manureSystemPlaceableConnector.usedConnectorId = connectorId
    end
end

---@return table | nil
function ManureSystemPlaceableConnector:getAnimatedObjectByIndex(index)
    local spec = self.spec_animatedObjects
    if spec ~= nil and spec.animatedObjects ~= nil then
        return spec.animatedObjects[index]
    end

    return nil
end

---@return boolean
function ManureSystemPlaceableConnector:getIsAnimationPlaying(index)
    local animatedObject = self:getAnimatedObjectByIndex(index)
    if animatedObject ~= nil then
        return animatedObject.isMoving
    end

    return false
end

---@return number
function ManureSystemPlaceableConnector:getAnimationTime(index)
    local animatedObject = self:getAnimatedObjectByIndex(index)
    if animatedObject ~= nil then
        return animatedObject.animation.time
    end

    return 0
end

---@return void
function ManureSystemPlaceableConnector:playAnimation(index, direction)
    local animatedObject = self:getAnimatedObjectByIndex(index)
    if animatedObject ~= nil then
        animatedObject:setDirection(direction)
    end
end

----------------
-- Overwrites --
----------------

---@return number
function ManureSystemPlaceableConnector:getFillUnitFillType(superFunc, fillUnitIndex, ...)
    if self:hasConnectors() then
        local storage = self:getManureSystemStorageByIndex(fillUnitIndex)
        if storage ~= nil then
            local fillType = FillType.UNKNOWN

            local connector = self:getConnectorById(self.spec_manureSystemPlaceableConnector.usedConnectorId)
            if connector ~= nil then
                for fillTypeIndex, fillLevel in pairs(storage:getFillLevels()) do
                    if self:getConnectorAllowsFillType(connector, fillTypeIndex) and fillLevel > 0 then
                        fillType = fillTypeIndex
                    end
                end
            end

            return fillType
        end
    end

    return superFunc(self, fillUnitIndex, ...)
end

---@return boolean
function ManureSystemPlaceableConnector:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillTypeIndex, ...)
    local connector = self:getConnectorById(self.spec_manureSystemPlaceableConnector.usedConnectorId)
    if connector ~= nil and not self:getConnectorAllowsFillType(connector, fillTypeIndex) then
        return false
    end

    return superFunc(self, fillUnitIndex, fillTypeIndex, ...)
end
