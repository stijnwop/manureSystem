----------------------------------------------------------------------------------------------------
-- ManureSystemConnector
----------------------------------------------------------------------------------------------------
-- Purpose:
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnector
ManureSystemConnector = {}

function ManureSystemConnector.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(ManureBarrel, specializations)
end

function ManureSystemConnector.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "loadManureSystemConnectorFromXML", ManureSystemConnector.loadManureSystemConnectorFromXML)
    SpecializationUtil.registerFunction(vehicleType, "setIsUsed", ManureSystemConnector.setIsUsed)
    SpecializationUtil.registerFunction(vehicleType, "getConnectors", ManureSystemConnector.getConnectors)
    SpecializationUtil.registerFunction(vehicleType, "getConnectorById", ManureSystemConnector.getConnectorById)
end

function ManureSystemConnector.registerOverwrittenFunctions(vehicleType)
end

function ManureSystemConnector.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onLoad", ManureSystemConnector)
    SpecializationUtil.registerEventListener(vehicleType, "onDelete", ManureSystemConnector)
end

function ManureSystemConnector:onLoad(savegame)
    self.spec_manureSystemConnector = ManureSystemUtil.getSpecTable(self, "manureSystemConnector")

    local spec = self.spec_manureSystemConnector

    spec.manureSystemConnectors = {}

    local i = 0
    while true do
        local baseKey = ("vehicle.manureSystemConnectors.connector(%d)"):format(i)

        if not hasXMLProperty(self.xmlFile, baseKey) then
            break
        end

        local connector = {}
        if self:loadManureSystemConnectorFromXML(connector, self.xmlFile, baseKey, i) then
            table.insert(spec.manureSystemConnectors, connector)
        end

        i = i + 1
    end

    if #spec.manureSystemConnectors ~= 0 then
        log("Adding connector to: " .. self:getName())
        g_manureSystem:addConnectorVehicle(self)
    end
end

function ManureSystemConnector:onDelete()
    g_manureSystem:removeConnectorVehicle(self)
end

function ManureSystemConnector:loadManureSystemConnectorFromXML(connector, xmlFile, baseKey, index)
    local node = ManureSystemXMLUtil.getOrCreateNode(self, xmlFile, baseKey, index)

    if node ~= nil then
        connector.node = node
        connector.isConnected = false
        connector.inRangeDistance = Utils.getNoNil(getXMLFloat(xmlFile, baseKey .. "#inRangeDistance"), 1.3)
        connector.lockAnimationName = getXMLString(xmlFile, baseKey .. "#lockAnimationName")

        connector.jointOrigRot = { getRotation(node) }
        connector.jointOrigTrans = { getTranslation(node) }

        return true
    end

    return false
end

function ManureSystemConnector:getConnectors()
    return self.spec_manureSystemConnector.manureSystemConnectors
end

function ManureSystemConnector:getConnectorById(id)
    return self.spec_manureSystemConnector.manureSystemConnectors[id]
end

function ManureSystemConnector:setIsUsed(id, state, hoseSystem, noEventSend)
    local connector = self:getConnectorById(id)

    if connector.lockAnimationName ~= nil then
        local dir = state and 1 or -1
        self:playAnimation(connector.lockAnimationName, dir, nil, true)
    end
end