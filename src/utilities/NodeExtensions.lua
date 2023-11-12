--
-- NodeExtensions
--
-- Author: Stijn Wopereis
-- Description: Node extensions
-- Name: NodeExtensions
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class NodeExtensions
NodeExtensions = {}

---@return void
function NodeExtensions.setVectorByXML(node, xmlFile, xmlKey, func)
    local x, y, z = xmlFile:getValue(xmlKey, nil, false)
    func(node, x, y, z)
end

---@return void
function NodeExtensions.setPosition(node, x, y, z)
    if x ~= nil and y ~= nil and z ~= nil then
        setTranslation(node, x, y, z)
    end
end

---@return void
function NodeExtensions.setRotation(node, x, y, z)
    if x ~= nil and y ~= nil and z ~= nil then
        setRotation(node, x, y, z)
    end
end

---@return void
function NodeExtensions.setScale(node, x, y, z)
    if x ~= nil and y ~= nil and z ~= nil then
        setScale(node, x, y, z)
    end
end

---@return boolean
function NodeExtensions.hasFrozenScale(node)
    local x, y, z = getScale(node)
    return x == 1 and y == 1 and z == 1
end

---@return boolean
function NodeExtensions.isRigidBody(node)
    return getRigidBodyType(node) ~= RigidBodyType.NONE
end

---@return void
function NodeExtensions.iterateNode(node, func)
    for i = 0, getNumOfChildren(node) - 1 do
        local child = getChildAt(node, i)

        if func(child) == false then
            return
        end

        NodeExtensions.iterateNode(child, func)
    end
end

---@return number | nil
function NodeExtensions.getFirstRigidBodyNode(node)
    local physicsNode

    NodeExtensions.iterateNode(node, function(child)
        if NodeExtensions.isRigidBody(child) then
            physicsNode = child
            return false
        end
    end)

    return physicsNode
end
