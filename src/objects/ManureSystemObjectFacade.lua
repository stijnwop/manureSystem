----------------------------------------------------------------------------------------------------
-- ManureSystemObjectFacade
----------------------------------------------------------------------------------------------------
-- Purpose: façade to communicate with the underlying object.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemObjectFacade
ManureSystemObjectFacade = {}

---Default method, which returns the params without alternations.
local function default(params) return params end

---Unpack station load params, which needs order correction.
local function unpackStationLoadParams(targetObject, params)
    local nodeId, xmlFile, key, _ = unpack(params)
    return { xmlFile, key, nodeId }
end

---Unpack the husbandry load params.
local function unpackHusbandryLoadParams(targetObject, params)
    local xmlFile, key, nodeId, owner, baseDirectory = unpack(params)
    return { xmlFile, key, nodeId, owner, baseDirectory }
end

---Creates a set with helper methods.
local function Set(t)
    t = t or {}
    t.values = {}

    function t:get(key)
        return t.values[key]
    end

    function t:set(key, value)
        t.values[key] = value
    end

    function t:getDefault()
        return default
    end

    function t:getOrDefault(key)
        return t:get(key) or t:getDefault()
    end

    function t:has(key)
        return t:get(key) ~= nil
    end

    return t
end

---Unpack methods for the `load` function.
local unpackLoadFunctions = Set()

unpackLoadFunctions:set("BuyingStation", unpackStationLoadParams)
unpackLoadFunctions:set("LoadingStation", unpackStationLoadParams)
unpackLoadFunctions:set("HusbandryModuleLiquidManure", unpackHusbandryLoadParams)
unpackLoadFunctions:set("HusbandryModuleMilk", unpackHusbandryLoadParams)

---Unpack methods for the `update` function.
local unpackUpdateFunctions = Set()

---Set of functions that requires difference unpacking.
local functionSets = Set()
functionSets:set("load", unpackLoadFunctions)
functionSets:set("update", unpackUpdateFunctions)

---Get unpacked function params based on unpack function.
function ManureSystemObjectFacade.getUnpackedParams(targetObject, functionName, params)
    local className = ManureSystemObjectFactory.getClassName(targetObject)

    local sets = functionSets:get(functionName)
    local func = sets:getOrDefault(className)
    return func(targetObject, params)
end

---Calls the manure system object with the unpacked params.
function ManureSystemObjectFacade.call(functionName, targetObject, params)
    local unpackedParams = {}

    if functionSets:has(functionName) then
        unpackedParams = ManureSystemObjectFacade.getUnpackedParams(targetObject, functionName, params)
        if unpackedParams == nil then
            return false
        end
    end

    local object = targetObject.manureSystemObject
    return object[functionName](object, unpack(unpackedParams))
end

-------------------------------------------------------------
-- Entry points
-------------------------------------------------------------

---Hook into the target object class `new` method in order to set the manure system object.
function ManureSystemObjectFacade.new(targetObject, superFunc, ...)
    local object = superFunc(targetObject, ...)

    object.manureSystemObject = ManureSystemObjectFactory.getManureSystemObject(object)

    return object
end

---Called on load.
function ManureSystemObjectFacade.load(self, superFunc, ...)
    if not superFunc(self, ...) then
        return false
    end

    if not ManureSystemObjectFacade.call("load", self, { ... }) then
        return false
    end

    return true
end

---Called on delete.
function ManureSystemObjectFacade.delete(self)
    ManureSystemObjectFacade.call("delete", self)
end

---Called on update.
function ManureSystemObjectFacade.update(self, ...)
    ManureSystemObjectFacade.call("update", self, { ... })
end
