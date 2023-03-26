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
    ManureSystemConnectorManager.xmlSchema = XMLSchema.new("ManureSystemConnectorManager")
end)

g_xmlManager:addInitSchemaFunction(function()
    local schema = ManureSystemConnectorManager.xmlSchema
    schema:register(XMLValueType.STRING, "assets.set(?).connectors.connector(?)#type", "The connector type")
    schema:register(XMLValueType.NODE_INDEX, "assets.set(?).connectors.connector(?)#node", "The connector node")

    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).vehicle.animation")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).connectors.connector(?).vehicle.animation(?)")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).valves.valve(?).handle(?).vehicle.animation")
    AnimatedVehicle.registerAnimationXMLPaths(schema, "assets.set(?).valves.valve(?).handle(?).vehicle.animation(?)")

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

    ManureSystemConnectorManager.AnimatedObjectRegisterXMLPaths(schema, "assets.set(?).connectors.connector(?).placeable.animatedObject")
    ManureSystemConnectorManager.AnimatedObjectRegisterXMLPaths(schema, "assets.set(?).valves.valve(?).handle(?).placeable.animatedObject")
end)

--Todo: why is this needed?
function ManureSystemConnectorManager.AnimatedObjectRegisterXMLPaths(schema, basePath)
    schema:register(XMLValueType.STRING, basePath .. "#saveId", "Save identifier", "AnimatedObject_[nodeName]")
    schema:register(XMLValueType.FLOAT, basePath .. ".animation#duration", "Animation duration (sec.)", 3)
    schema:register(XMLValueType.NODE_INDEX, basePath .. ".animation.part(?)#node", "Part node")
    schema:register(XMLValueType.FLOAT, basePath .. ".animation.part(?).keyFrame(?)#time", "Key time")
    schema:register(XMLValueType.VECTOR_ROT, basePath .. ".animation.part(?).keyFrame(?)#rotation", "Key rotation", "values read from i3d node")
    schema:register(XMLValueType.VECTOR_TRANS, basePath .. ".animation.part(?).keyFrame(?)#translation", "Key translation", "values read from i3d node")
    schema:register(XMLValueType.VECTOR_SCALE, basePath .. ".animation.part(?).keyFrame(?)#scale", "Key scale", "values read from i3d node")
    schema:register(XMLValueType.BOOL, basePath .. ".animation.part(?).keyFrame(?)#visibility", "Key visibility", true)
    schema:register(XMLValueType.NODE_INDEX, basePath .. ".animation.shader(?)#node", "Shader node")
    schema:register(XMLValueType.STRING, basePath .. ".animation.shader(?)#parameterName", "Shader parameter name")
    schema:register(XMLValueType.FLOAT, basePath .. ".animation.shader(?).keyFrame(?)#time", "Key time")
    schema:register(XMLValueType.STRING, basePath .. ".animation.shader(?).keyFrame(?)#values", "Key shader parameter values. Use '-' to force using existing shader parameter value")
    schema:register(XMLValueType.NODE_INDEX, basePath .. ".animation.clip#rootNode", "I3d animation rootnode")
    schema:register(XMLValueType.STRING, basePath .. ".animation.clip#name", "I3d animation clipName")
    schema:register(XMLValueType.STRING, basePath .. ".animation.clip#filename", "I3d animation external animation")
    schema:register(XMLValueType.FLOAT, basePath .. ".animation#initialTime", "Animation time after loading", 0)
    schema:register(XMLValueType.FLOAT, basePath .. ".openingHours#startTime", "Start day time")
    schema:register(XMLValueType.FLOAT, basePath .. ".openingHours#endTime", "End day time")
    schema:register(XMLValueType.BOOL, basePath .. ".openingHours#disableIfClosed", "Disabled if closed")
    schema:register(XMLValueType.L10N_STRING, basePath .. ".openingHours#closedText", "Closed text")
    schema:register(XMLValueType.NODE_INDEX, basePath .. ".controls#triggerNode", "Player trigger node")
    schema:register(XMLValueType.STRING, basePath .. ".controls#posAction", "Positive direction action event name")
    schema:register(XMLValueType.STRING, basePath .. ".controls#posText", "Positive direction text")
    schema:register(XMLValueType.STRING, basePath .. ".controls#negText", "Negative direction text")
    schema:register(XMLValueType.STRING, basePath .. ".controls#negAction", "Negative direction action event name")
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "moving(?)")
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "posEnd")
    SoundManager.registerSampleXMLPaths(schema, basePath .. ".sounds", "negEnd")
end

function ManureSystemConnectorManager.new(modDirectory, customMt)
    local self = setmetatable({}, customMt or ManureSystemConnectorManager_mt)

    self.modDirectory = modDirectory
    self.typeByName = {}
    self.numTypes = 0
    self.sets = {}

    return self
end

function ManureSystemConnectorManager:loadMapData()
    self:loadDefaultConnectorTypes()
    self:loadSharedSets()

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
        set:delete()
    end
end

function ManureSystemConnectorManager:loadSharedSets()
    local xmlFilename = Utils.getFilename("resources/assets/connectorsSets.xml", self.modDirectory)
    local xmlFile = XMLFile.load("connectorsSetsXML", xmlFilename, ManureSystemConnectorManager.xmlSchema)

    local i = 0
    while true do
        local key = ("assets.set(%d)"):format(i)
        if not xmlFile:hasProperty(key) then
            break
        end

        local sharedSet = SharedSet.new(self.modDirectory)
        if sharedSet:loadFromXML(xmlFile, key, xmlFilename) then
            table.insert(self.sets, sharedSet)
        end

        i = i + 1
    end

    xmlFile:delete()
end

---@return SharedSet
function ManureSystemConnectorManager:getSharedSet(index)
    return self.sets[index or 1]
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
        return ManureSystemCouplingStrategy.new(object, type)
    elseif type == self:getConnectorType(ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK) then
        return ManureSystemDockStrategy.new(object)
    end

    return nil
end
