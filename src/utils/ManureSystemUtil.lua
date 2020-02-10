----------------------------------------------------------------------------------------------------
-- ManureSystemUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemUtil utility.
--
-- Copyright (c) Wopster, 2018
----------------------------------------------------------------------------------------------------

---@class ManureSystemUtil
ManureSystemUtil = {}

ManureSystemUtil.NO_RIGID_BODY = "norigidbody"

---Gets the first found physics node when the root node isn't a rigid body.
function ManureSystemUtil.getFirstPhysicsNode(nodeId)
    if getRigidBodyType(nodeId):lower() ~= ManureSystemUtil.NO_RIGID_BODY then
        return nodeId
    end

    for i = 0, getNumOfChildren(nodeId) - 1 do
        local tmp = ManureSystemUtil.getFirstPhysicsNode(getChildAt(nodeId, i))

        if tmp ~= 0 then
            return tmp
        end
    end

    return 0
end

function ManureSystemUtil.loadSharedAnimation(object, xmlFile, key, animation, parentNode)
    local name = getXMLString(xmlFile, key .. "#name")
    if name ~= nil then
        animation.name = name
        animation.parts = {}
        animation.currentTime = 0
        animation.currentSpeed = 1
        animation.looping = Utils.getNoNil(getXMLBool(xmlFile, key .. "#looping"), false)
        animation.resetOnStart = Utils.getNoNil(getXMLBool(xmlFile, key .. "#resetOnStart"), true)

        local partI = 0
        while true do
            local partKey = key .. string.format(".part(%d)", partI)
            if not hasXMLProperty(xmlFile, partKey) then
                break
            end

            local animationPart = {}
            if ManureSystemUtil.loadSharedAnimationPart(object, xmlFile, partKey, animationPart, parentNode) then
                table.insert(animation.parts, animationPart)
            end
            partI = partI + 1
        end

        -- sort parts by start/end time
        animation.partsReverse = {}
        for _, part in ipairs(animation.parts) do
            table.insert(animation.partsReverse, part)
        end
        table.sort(animation.parts, AnimatedVehicle.animPartSorter)
        table.sort(animation.partsReverse, AnimatedVehicle.animPartSorterReverse)

        object:initializeAnimationParts(animation)

        animation.currentPartIndex = 1
        animation.duration = 0
        for _, part in ipairs(animation.parts) do
            animation.duration = math.max(animation.duration, part.startTime + part.duration)
        end

        return true
    end

    return false
end

function ManureSystemUtil.loadSharedAnimationPart(object, xmlFile, partKey, part, parentNode)
    local node = I3DUtil.indexToObject(parentNode, getXMLString(xmlFile, partKey .. "#node"))
    local startTime = getXMLFloat(xmlFile, partKey .. "#startTime")
    local duration = getXMLFloat(xmlFile, partKey .. "#duration")
    local endTime = getXMLFloat(xmlFile, partKey .. "#endTime")
    local direction = MathUtil.sign(Utils.getNoNil(getXMLInt(xmlFile, partKey .. "#direction"), 0))
    local startRot = StringUtil.getRadiansFromString(getXMLString(xmlFile, partKey .. "#startRot"), 3)
    local endRot = StringUtil.getRadiansFromString(getXMLString(xmlFile, partKey .. "#endRot"), 3)
    local startTrans = StringUtil.getVectorNFromString(getXMLString(xmlFile, partKey .. "#startTrans"), 3)
    local endTrans = StringUtil.getVectorNFromString(getXMLString(xmlFile, partKey .. "#endTrans"), 3)
    local startScale = StringUtil.getVectorNFromString(getXMLString(xmlFile, partKey .. "#startScale"), 3)
    local endScale = StringUtil.getVectorNFromString(getXMLString(xmlFile, partKey .. "#endScale"), 3)
    local visibility = getXMLBool(xmlFile, partKey .. "#visibility")

    local requiredAnimation = getXMLString(xmlFile, partKey .. "#requiredAnimation")
    local requiredAnimationRange = StringUtil.getVectorNFromString(getXMLString(xmlFile, partKey .. "#requiredAnimationRange"), 2)

    local hasTiming = startTime ~= nil and (duration ~= nil or endTime ~= nil)
    if hasTiming then
        if endTime ~= nil then
            duration = endTime - startTime
        end
        part.node = node
        part.startTime = startTime * 1000
        part.duration = duration * 1000
        part.direction = direction
        part.requiredAnimation = requiredAnimation
        part.requiredAnimationRange = requiredAnimationRange

        if node ~= nil then
            if endRot ~= nil then
                part.startRot = startRot
                part.endRot = endRot
            end
            if endTrans ~= nil then
                part.startTrans = startTrans
                part.endTrans = endTrans
            end
            if endScale ~= nil then
                part.startScale = startScale
                part.endScale = endScale
            end

            part.visibility = visibility
        end

        return true
    end

    return false
end
