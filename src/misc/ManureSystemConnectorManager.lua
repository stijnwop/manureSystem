----------------------------------------------------------------------------------------------------
-- ManureSystemConnectorManager
----------------------------------------------------------------------------------------------------
-- Purpose: Manager to handle the connectors.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemConnectorManager
ManureSystemConnectorManager = {}
ManureSystemConnectorManager.COLLISION_MASK = 1088430080

ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK = "dock"
ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING = "coupling"
ManureSystemConnectorManager.CONNECTOR_TYPE_FERTILIZER_COUPLING = "couplingFertilizer"
ManureSystemConnectorManager.CONNECTOR_TYPE_TRANSFER_HOSE = "transfer"
ManureSystemConnectorManager.CONNECTOR_TYPE_OPTICAL = "optical" -- non functional

local ManureSystemConnectorManager_mt = Class(ManureSystemConnectorManager)

function ManureSystemConnectorManager:new(modDirectory, customMt)
    local self = setmetatable({}, customMt or ManureSystemConnectorManager_mt)

    self.modDirectory = modDirectory
    self.typeByName = {}
    self.numTypes = 0

    self.sets = {}

    return self
end

function ManureSystemConnectorManager:loadMapData()
    self:loadDefaultConnectorTypes()
    self:loadVisualConnectorsFromXML()

    local orgConnectionHoseManagerDirectory = g_connectionHoseManager.baseDirectory
    g_connectionHoseManager.baseDirectory = self.modDirectory
    g_connectionHoseManager:loadConnectionHosesFromXML(Utils.getFilename("resources/assets/connectionHoses/connectionHoses.xml", self.modDirectory))
    g_connectionHoseManager.baseDirectory = orgConnectionHoseManagerDirectory

    local collisionRoot = g_i3DManager:loadSharedI3DFile("resources/collisions/connectorCollision.i3d", self.modDirectory, false, false, false)
    self.collision = getChildAt(collisionRoot, 0)
    setCollisionMask(self.collision, ManureSystemConnectorManager.COLLISION_MASK)
    setRigidBodyType(self.collision, "Kinematic")
end

function ManureSystemConnectorManager:unloadMapData()
    delete(self.collision)

    for _, set in ipairs(self.sets) do
        if set.sharedRoot ~= nil then
            g_i3DManager:releaseSharedI3DFile(set.filename, nil, true)
            delete(set.sharedRoot)
            set.sharedRoot = nil
        end
    end
end

function ManureSystemConnectorManager:loadVisualConnectorsFromXML()
    local xmlFilename = Utils.getFilename("resources/assets/connectorsSets.xml", self.modDirectory)
    local xmlFile = loadXMLFile("ManureSystemConnectorSets", xmlFilename)

    local i = 0
    while true do
        local key = ("assets.set(%d)"):format(i)
        if not hasXMLProperty(xmlFile, key) then break end

        local filename = getXMLString(xmlFile, key .. "#filename")
        if filename ~= nil then
            local desc = {}
            desc.xmlFilename = xmlFilename
            desc.filename = Utils.getFilename(filename, self.modDirectory)
            desc.sharedRoot = g_i3DManager:loadSharedI3DFile(desc.filename, nil, false, false)
            local nodeId = getChildAt(desc.sharedRoot, 0)

            -- Connectors
            desc.connectors = {}
            local c = 0
            while true do
                local connectorKey = ("%s.connectors.connector(%d)"):format(key, c)
                if not hasXMLProperty(xmlFile, connectorKey) then break end

                local connectorTypeString = getXMLString(xmlFile, connectorKey .. "#type")
                local connectorNode = I3DUtil.indexToObject(nodeId, getXMLString(xmlFile, connectorKey .. "#node"))
                if connectorTypeString ~= nil and connectorNode ~= nil then
                    local connectorTypeKey = self:formatConnectorKey(connectorTypeString)
                    local connector = {}
                    connector.node = connectorNode
                    connector.animationKey = connectorKey .. ".animation"
                    connector.hasAnimation = hasXMLProperty(xmlFile, connector.animationKey)

                    desc.connectors[connectorTypeKey] = connector
                end

                c = c + 1
            end

            -- Valves
            desc.valves = {}
            local v = 0
            while true do
                local valveKey = ("%s.valves.valve(%d)"):format(key, v)
                if not hasXMLProperty(xmlFile, valveKey) then break end

                local valveTypeString = getXMLString(xmlFile, valveKey .. "#type")
                local valveNode = I3DUtil.indexToObject(nodeId, getXMLString(xmlFile, valveKey .. "#node"))
                if valveTypeString ~= nil and valveNode ~= nil then
                    local valveTypeKey = self:formatConnectorKey(valveTypeString)
                    local valve = {}
                    valve.node = valveNode
                    valve.handles = {}

                    local h = 0
                    while true do
                        local handleKey = ("%s.handle(%d)"):format(valveKey, h)
                        if not hasXMLProperty(xmlFile, handleKey) then break end

                        local handleTypeString = getXMLString(xmlFile, handleKey .. "#type")
                        local handleNode = I3DUtil.indexToObject(nodeId, getXMLString(xmlFile, handleKey .. "#node"))
                        if handleTypeString ~= nil and handleNode ~= nil then
                            local handleTypeKey = self:formatConnectorKey(handleTypeString)
                            local handle = {}
                            handle.node = handleNode
                            handle.animationKey = handleKey .. ".animation"
                            handle.hasAnimation = hasXMLProperty(xmlFile, handle.animationKey)
                            handle.linkOffset = Utils.getNoNil(StringUtil.getVectorNFromString(getXMLString(xmlFile, handleKey .. "#linkOffset"), 3), { 0, 0, 0 })

                            valve.handles[handleTypeKey] = handle
                        end

                        h = h + 1
                    end

                    desc.valves[valveTypeKey] = valve
                end

                v = v + 1
            end

            table.insert(self.sets, desc)
        end

        i = i + 1
    end
end

function ManureSystemConnectorManager:formatConnectorKey(name)
    return name:upper()
end

function ManureSystemConnectorManager:getConnectorSet(index)
    index = index or 1
    return self.sets[index]
end

function ManureSystemConnectorManager:loadDefaultConnectorTypes()
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_TRANSFER_HOSE)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_FERTILIZER_COUPLING)
    self:addConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_OPTICAL)
end

function ManureSystemConnectorManager:formatConnectorTypeKey(name)
    return ("CONNECTOR_TYPE_%s"):format(name:upper())
end

function ManureSystemConnectorManager:getConnectorType(name)
    local key = self:formatConnectorTypeKey(name)

    if self.typeByName[key] ~= nil then
        return self.typeByName[key]
    end

    return nil
end

function ManureSystemConnectorManager:addConnectorType(name)
    local key = self:formatConnectorTypeKey(name)

    if self.typeByName[key] == nil then
        self.numTypes = self.numTypes + 1
        self.typeByName[key] = self.numTypes
    else
        print(("Warning: connector type '%s' already exits!"):format(name))
    end
end

function ManureSystemConnectorManager:getConnectorStrategy(type, object)
    if type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING)
        or type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_FERTILIZER_COUPLING) then
        return ManureSystemCouplingStrategy:new(object, type)
    elseif type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK) then
        return ManureSystemDockStrategy:new(object)
    end

    return nil
end
