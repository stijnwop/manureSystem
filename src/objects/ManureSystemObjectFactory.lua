----------------------------------------------------------------------------------------------------
-- ManureSystemObjectFactory
----------------------------------------------------------------------------------------------------
-- Purpose: Factory class to handle the manure system objects.
--
-- Copyright (c) Wopster, 2020
----------------------------------------------------------------------------------------------------

---@class ManureSystemObjectFactory
ManureSystemObjectFactory = {}

local ManureSystemObjectFactory_mt = Class(ManureSystemObjectFactory)

---Creates a new instance of the factory.
---@return ManureSystemObjectFactory
function ManureSystemObjectFactory:new()
    local self = setmetatable({}, ManureSystemObjectFactory_mt)
    return self
end

---Factory method to get the correct manure system object.
function ManureSystemObjectFactory.getManureSystemObject(object)
    if object:isa(HusbandryModuleLiquidManure) then
        return ManureSystemObjectHusbandry:new(object, g_server ~= nil, g_client ~= nil)
    elseif object:isa(BuyingStation) or object:isa(LoadingStation) then
        return ManureSystemObject:new(object, g_server ~= nil, g_client ~= nil)
    end

    Logger.error("Could not found proper manure system object!")

    return nil
end

---Get the class name of the given object.
function ManureSystemObjectFactory.getClassName(object)
    local objectClass = object:class()
    return objectClass.className
end

---Validate the given object class if it has a classname.
function ManureSystemObjectFactory:validateObjectClass(objectClass)
    if objectClass.className == nil then
        for k, v in pairs(_G) do
            if v == objectClass then
                objectClass.className = k
            end
        end
    end

    --Fix the husbandry modules.
    if objectClass.className == nil then
        if objectClass:isa(HusbandryModuleLiquidManure) then
            objectClass.className = "HusbandryModuleLiquidManure"
        end
    end
end

---Insert facade into the given object class.
function ManureSystemObjectFactory:insertToObjectClass(objectClass)
    assert(objectClass.load ~= nil)
    assert(objectClass.update ~= nil)
    assert(objectClass.delete ~= nil)
    assert(objectClass.loadFromXMLFile ~= nil)
    assert(objectClass.saveToXMLFile ~= nil)

    self:validateObjectClass(objectClass)

    objectClass.new = Utils.overwrittenFunction(objectClass.new, ManureSystemObjectFacade.new)
    objectClass.load = Utils.overwrittenFunction(objectClass.load, ManureSystemObjectFacade.load)
    objectClass.update = Utils.appendedFunction(objectClass.update, ManureSystemObjectFacade.update)
    objectClass.delete = Utils.appendedFunction(objectClass.delete, ManureSystemObjectFacade.delete)

    --objectClass.loadFromXMLFile = Utils.appendedFunction(objectClass.loadFromXMLFile, ManureSystemObjectFacade.loadFromXMLFile)
    --objectClass.saveToXMLFile = Utils.appendedFunction(objectClass.saveToXMLFile, ManureSystemObjectFacade.saveToXMLFile)
end
