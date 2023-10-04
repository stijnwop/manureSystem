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

local function getAllowTriggerActivation(trigger, sourceObject, targetObject)
    if sourceObject ~= nil and targetObject ~= nil then
        local sourceObjectCanDisableVanillaLoading = sourceObject.getCanDisableVanillaLoading == nil or sourceObject:getCanDisableVanillaLoading(targetObject, trigger)
        local targetObjectCanDisableVanillaLoading = targetObject.getCanDisableVanillaLoading == nil or targetObject:getCanDisableVanillaLoading(sourceObject, trigger)

        if sourceObjectCanDisableVanillaLoading and targetObjectCanDisableVanillaLoading then
            local pumpDirectionIn = ManureSystemPumpMotor.PUMP_DIRECTION_IN
            local pumpDirectionOut = ManureSystemPumpMotor.PUMP_DIRECTION_OUT

            local couplingTypeNames = {
                ManureSystemConnectorManager.CONNECTOR_TYPE_HOSE_COUPLING,
                ManureSystemConnectorManager.CONNECTOR_TYPE_FERTILIZER_COUPLING
            }

            local dockTypeName = ManureSystemConnectorManager.CONNECTOR_TYPE_DOCK

            for _, couplingTypeName in ipairs(couplingTypeNames) do
                if g_currentMission.manureSystem:getObjectHasConnectors(sourceObject, couplingTypeName, pumpDirectionOut) and g_currentMission.manureSystem:getObjectHasConnectors(targetObject, couplingTypeName, pumpDirectionIn) then
                    return false
                end
            end

            if g_currentMission.manureSystem:getObjectSupportsFillArms(sourceObject) and g_currentMission.manureSystem:getObjectHasFillArms(targetObject, nil, pumpDirectionIn) then
                return false
            end

            if g_currentMission.manureSystem:getObjectHasConnectors(sourceObject, dockTypeName, pumpDirectionOut) and g_currentMission.manureSystem:getObjectHasFillArms(targetObject, dockTypeName, pumpDirectionIn) then
                return false
            end
        end
    end

    return true
end

local function inj_fillTrigger_getIsActivatable(self, superFunc, vehicle, ...)
    if not getAllowTriggerActivation(self, self.sourceObject, vehicle) then
        return false
    end

    return superFunc(self, vehicle, ...)
end

local function inj_loadTrigger_getAllowsActivation(self, superFunc, fillableObject, ...)
    if self.source ~= nil and not getAllowTriggerActivation(self, self.source.owningPlaceable, fillableObject) then
        return false
    end

    return superFunc(self, fillableObject, ...)
end

local function inj_placeable_loadI3dFinished(self, superFunc, ...)
    local oldLoadEffect = EffectManager.loadEffect

    EffectManager.loadEffect = function(_, xmlFile, baseName, rootNode, parent, ...)
        local oldGetFilename = Utils.getFilename

        Utils.getFilename = function(filename, baseDirectory, ...)
            local manureSystemPrefix = "$manureSystemDir$"

            if filename:lower():startsWith(manureSystemPrefix:lower()) then
                filename = filename:sub(manureSystemPrefix:len() + 2)
                baseDirectory = g_currentMission.manureSystem.modDirectory
            end

            return oldGetFilename(filename, baseDirectory, ...)
        end

        local effects = oldLoadEffect(g_effectManager, xmlFile, baseName, rootNode, self, ...)

        Utils.getFilename = oldGetFilename

        return effects
    end

    superFunc(self, ...)

    EffectManager.loadEffect = oldLoadEffect
end

---Early hook to overwrite
function manureSystem_overwrite.init()
    manureSystem_overwrite.overwrittenFunction(FillTrigger, "getIsActivatable", inj_fillTrigger_getIsActivatable)
    manureSystem_overwrite.overwrittenFunction(LoadTrigger, "getAllowsActivation", inj_loadTrigger_getAllowsActivation)
    manureSystem_overwrite.overwrittenFunction(Placeable, "loadI3dFinished", inj_placeable_loadI3dFinished)
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
