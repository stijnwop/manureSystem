--
-- overwrites
--
-- Author: Stijn Wopereis
-- Description: Handle overwrites
-- Name: overwrites
-- Hide: yes
--
-- Copyright (c) Wopster, 2023

---@class manureSystem_overwrite
manureSystem_overwrite = {}

---@type table
local originalFunctions = {}

----------------
-- Overwrites --
----------------

local function objectHasConnectors(object)
    return object ~= nil and object.hasConnectors ~= nil and object:hasConnectors()
end

local function objectSupportsFillArms(object)
    return object ~= nil and object.getSupportsFillArms ~= nil and object:getSupportsFillArms()
end

local function objectHasFillArms(object)
    if object ~= nil and object.getFillArms ~= nil then
        for _, fillArm in ipairs(object:getFillArms()) do
            if fillArm.limitedFillDirection == nil or fillArm.limitedFillDirection == ManureSystemPumpMotor.PUMP_DIRECTION_IN then
                return true
            end
        end
    end

    return false
end

local function inj_fillTrigger_getIsActivatable(self, superFunc, vehicle, ...)
    if objectHasConnectors(self.sourceObject) and objectHasConnectors(vehicle) then
        return false
    end

    return superFunc(self, vehicle, ...)
end

local function inj_loadTrigger_getAllowsActivation(self, superFunc, fillableObject, ...)
    if self.source ~= nil then
        if objectHasConnectors(self.source.owningPlaceable) and objectHasConnectors(fillableObject) then
            return false
        end

        if objectSupportsFillArms(self.source.owningPlaceable) and objectHasFillArms(fillableObject) then
            return false
        end
    end

    return superFunc(self, fillableObject, ...)
end

---Early hook to overwrite
function manureSystem_overwrite.init()
    manureSystem_overwrite.overwrittenFunction(FillTrigger, "getIsActivatable", inj_fillTrigger_getIsActivatable)
    manureSystem_overwrite.overwrittenFunction(LoadTrigger, "getAllowsActivation", inj_loadTrigger_getAllowsActivation)
end

---Store the original function on consoles
local function storeOriginalFunction(target, name)
    if not GS_IS_CONSOLE_VERSION then
        return
    end

    if originalFunctions[target] == nil then
        originalFunctions[target] = {}
    end

    -- Store the original function
    if originalFunctions[target][name] == nil then
        originalFunctions[target][name] = target[name]
    end
end

---Overwrite the vanilla function and store
function manureSystem_overwrite.overwrittenFunction(target, name, newFunc)
    storeOriginalFunction(target, name)
    target[name] = Utils.overwrittenFunction(target[name], newFunc)
end

---Append the vanilla function and store
function manureSystem_overwrite.appendedFunction(target, name, newFunc)
    storeOriginalFunction(target, name)
    target[name] = Utils.appendedFunction(target[name], newFunc)
end

---Prepend the vanilla function and store
function manureSystem_overwrite.prependedFunction(target, name, newFunc)
    storeOriginalFunction(target, name)
    target[name] = Utils.prependedFunction(target[name], newFunc)
end

---Reset the vanilla functions to it's original state
function manureSystem_overwrite.resetOriginalFunctions()
    for target, functions in pairs(originalFunctions) do
        for name, func in pairs(functions) do
            target[name] = func
        end
    end
end
