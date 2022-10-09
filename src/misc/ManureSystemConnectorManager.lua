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

g_xmlManager:addCreateSchemaFunction(function()
    ManureSystemConnectorManager.xmlSchema = XMLSchema.new("manureSystemConnector")
end)

g_xmlManager:addInitSchemaFunction(function()
    local schema = ManureSystemConnectorManager.xmlSchema
    schema:register(XMLValueType.STRING, "assets.set(?).connectors.connector(?)#type", "The connector type")
    schema:register(XMLValueType.NODE_INDEX, "assets.set(?).connectors.connector(?)#node", "The connector node")

    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).animation")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).animation(?)")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).animation")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).animation(?)")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).valves.valve(?).handle(?).animation")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).valves.valve(?).handle(?).animation(?)")

    schema:addDelayedRegistrationFunc("AnimatedVehicle:part", function(cSchema, cKey)
        cSchema:register(XMLValueType.INT, cKey .. "#wheelIndex", "Wheel index [1..n]")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#startSteeringAngle", "Start steering angle")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#endSteeringAngle", "End steering angle")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#startBrakeFactor", "Start brake force factor")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#endBrakeFactor", "End brake force factor")
    end)

    schema:addDelayedRegistrationFunc("AnimatedVehicle:part", function(cSchema, cKey)
        cSchema:register(XMLValueType.INT, cKey .. "#inputAttacherJointIndex", "Input Attacher Joint Index [1..n]")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#lowerRotLimitScaleStart", "Lower rotaton limit start")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#lowerRotLimitScaleEnd", "Lower rotaton limit end")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#upperRotLimitScaleStart", "Upper rotaton limit start")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#upperRotLimitScaleEnd", "Upper rotaton limit end")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#lowerTransLimitScaleStart", "Lower translation limit start")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#lowerTransLimitScaleEnd", "Lower translation limit end")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#upperTransLimitScaleStart", "Upper translation limit start")
        cSchema:register(XMLValueType.VECTOR_3, cKey .. "#upperTransLimitScaleEnd", "Upper translation limit end")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#lowerRotationOffsetStart", "Lower rotation offset start")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#lowerRotationOffsetEnd", "Lower rotation offset end")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#upperRotationOffsetStart", "Upper rotation offset start")
        cSchema:register(XMLValueType.ANGLE, cKey .. "#upperRotationOffsetEnd", "Upper rotation offset end")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#lowerDistanceToGroundStart", "Lower distance to ground start")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#lowerDistanceToGroundEnd", "Lower distance to ground end")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#upperDistanceToGroundStart", "Upper distance to ground start")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#upperDistanceToGroundEnd", "Upper distance to ground end")
    end)

    schema:addDelayedRegistrationFunc("AnimatedVehicle:part", function(cSchema, cKey)
        cSchema:register(XMLValueType.BOOL, cKey .. "#baleLoaderAnimationNodes", "Bale Loader animation nodes turn on/off")
    end)

    schema:addDelayedRegistrationFunc("AnimatedVehicle:part", function(cSchema, cKey)
        cSchema:register(XMLValueType.FLOAT, cKey .. "#startTipSideEmptyFactor", "Start tip side empty factor")
        cSchema:register(XMLValueType.FLOAT, cKey .. "#endTipSideEmptyFactor", "End tip side empty factor")
    end)

    schema:register(XMLValueType.STRING, "assets.set(?).valves.valve(?)#type", "The valve type")
    schema:register(XMLValueType.NODE_INDEX, "assets.set(?).valves.valve(?)#node", "The valve node")
    schema:register(XMLValueType.STRING, "assets.set(?).valves.valve(?).handle(?)#type", "The handle type")
    schema:register(XMLValueType.NODE_INDEX, "assets.set(?).valves.valve(?).handle(?)#node", "The handle node")
    schema:register(XMLValueType.VECTOR_TRANS, "assets.set(?).valves.valve(?).handle(?)#linkOffset", "The link offset")
end)

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

    --local orgConnectionHoseManagerDirectory = g_connectionHoseManager.baseDirectory
    --g_connectionHoseManager.baseDirectory = self.modDirectory
    --g_connectionHoseManager:loadConnectionHosesFromXML(Utils.getFilename("resources/assets/connectionHoses/connectionHoses.xml", self.modDirectory))
    --g_connectionHoseManager.baseDirectory = orgConnectionHoseManagerDirectory

    local collisionFilename = Utils.getFilename("resources/collisions/connectorCollision.i3d", self.modDirectory)
    local collisionRoot = g_i3DManager:loadSharedI3DFile(collisionFilename, false, false)
    self.collision = getChildAt(collisionRoot, 0)
    setCollisionMask(self.collision, ManureSystemConnectorManager.COLLISION_MASK)
    setRigidBodyType(self.collision, RigidBodyType.KINEMATIC)
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
    local xmlFile = XMLFile.load("connectorsSetsXML", xmlFilename, ManureSystemConnectorManager.xmlSchema)

    local i = 0
    while true do
        local key = ("assets.set(%d)"):format(i)
        if not xmlFile:hasProperty(key) then break end

        local filename = xmlFile:getString(key .. "#filename")
        if filename ~= nil then
            local desc = {}
            desc.xmlFilename = xmlFilename
            desc.filename = Utils.getFilename(filename, self.modDirectory)
            desc.sharedRoot = g_i3DManager:loadSharedI3DFile(desc.filename, false, false)
            local nodeId = getChildAt(desc.sharedRoot, 0)

            -- Connectors
            desc.connectors = {}
            local c = 0
            while true do
                local connectorKey = ("%s.connectors.connector(%d)"):format(key, c)
                if not xmlFile:hasProperty(connectorKey) then break end

                local connectorTypeString = xmlFile:getString(connectorKey .. "#type")
                local connectorNode = I3DUtil.indexToObject(nodeId, xmlFile:getString(connectorKey .. "#node"))
                if connectorTypeString ~= nil and connectorNode ~= nil then
                    local connectorTypeKey = self:formatConnectorKey(connectorTypeString)
                    local connector = {}
                    connector.node = connectorNode
                    connector.animationKey = connectorKey .. ".animation"
                    connector.hasAnimation = xmlFile:hasProperty(connector.animationKey)

                    desc.connectors[connectorTypeKey] = connector
                end

                c = c + 1
            end

            -- Valves
            desc.valves = {}
            local v = 0
            while true do
                local valveKey = ("%s.valves.valve(%d)"):format(key, v)
                if not xmlFile:hasProperty(valveKey) then break end

                local valveTypeString = xmlFile:getString(valveKey .. "#type")
                local valveNode = I3DUtil.indexToObject(nodeId, xmlFile:getString(valveKey .. "#node"))
                if valveTypeString ~= nil and valveNode ~= nil then
                    local valveTypeKey = self:formatConnectorKey(valveTypeString)
                    local valve = {}
                    valve.node = valveNode
                    valve.handles = {}

                    local h = 0
                    while true do
                        local handleKey = ("%s.handle(%d)"):format(valveKey, h)
                        if not xmlFile:hasProperty(handleKey) then break end

                        local handleTypeString = xmlFile:getString(handleKey .. "#type")
                        local handleNode = I3DUtil.indexToObject(nodeId, xmlFile:getString(handleKey .. "#node"))
                        if handleTypeString ~= nil and handleNode ~= nil then
                            local handleTypeKey = self:formatConnectorKey(handleTypeString)
                            local handle = {}
                            handle.node = handleNode
                            handle.animationKey = handleKey .. ".animation"
                            handle.hasAnimation = xmlFile:hasProperty(handle.animationKey)
                            handle.linkOffset = Utils.getNoNil(string.getVectorN(xmlFile:getString(handleKey .. "#linkOffset"), 3), { 0, 0, 0 })

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

    xmlFile:delete()
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
