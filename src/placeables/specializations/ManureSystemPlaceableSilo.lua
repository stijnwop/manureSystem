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
    SpecializationUtil.registerFunction(placeableType, "getConnectorsByType", ManureSystemPlaceableSilo.getConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getActiveConnectorsByType", ManureSystemPlaceableSilo.getActiveConnectorsByType)
    SpecializationUtil.registerFunction(placeableType, "getConnectorInRangeNode", ManureSystemPlaceableSilo.getConnectorInRangeNode)
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
    schema:setXMLSpecializationType()
end

function ManureSystemPlaceableSilo.registerSavegameXMLPaths(schema, basePath)
    schema:setXMLSpecializationType("ManureSystemPlaceableSilo")
    schema:setXMLSpecializationType()
end

function ManureSystemPlaceableSilo:onLoad(savegame)
    self.spec_manureSystemPlaceableSilo = self[("spec_%s.manureSystemPlaceableSilo"):format(ManureSystemPlaceableSilo.MOD_NAME)]
    local spec = self.spec_manureSystemPlaceableSilo
    spec.connectors = ManureSystemConnectors.new(self, g_currentMission.manureSystem)
    if not spec.connectors:loadFromPlaceableXML(self.xmlFile) then
        spec.connectors:delete()
    end

    if not spec.connectors:hasConnectors() then
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
