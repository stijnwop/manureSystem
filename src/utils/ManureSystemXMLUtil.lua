----------------------------------------------------------------------------------------------------
-- ManureSystemXMLUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemXMLUtil utility.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemXMLUtil
ManureSystemXMLUtil = {}

---getOrCreateNode
---@param vehicle table
---@param xmlFile table
---@param key table
---@param index table
function ManureSystemXMLUtil.getOrCreateNode(vehicle, xmlFile, key, index)
    if Utils.getNoNil(getXMLBool(xmlFile, key .. "#createNode"), false) then
        if index == nil then
            index = 0
        end

        local node = createTransformGroup(("manureSystemConnector_node_%d"):format(index + 1))
        local linkNode = I3DUtil.indexToObject(vehicle.components, Utils.getNoNil(getXMLString(xmlFile, key .. "#linkNode"), "0>"), vehicle.i3dMappings)

        local translation = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. "#position")) }
        if translation[1] ~= nil and translation[2] ~= nil and translation[3] ~= nil then
            setTranslation(node, unpack(translation))
        end

        local rotation = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. "#rotation")) }
        if rotation[1] ~= nil and rotation[2] ~= nil and rotation[3] ~= nil then
            setRotation(node, MathUtil.degToRad(rotation[1]), MathUtil.degToRad(rotation[2]), MathUtil.degToRad(rotation[3]))
        end

        link(linkNode, node)

        return node
    end

    return I3DUtil.indexToObject(vehicle.components, getXMLString(xmlFile, key .. "#node"), vehicle.i3dMappings)
end
