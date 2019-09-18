----------------------------------------------------------------------------------------------------
-- ManureSystemUtil
----------------------------------------------------------------------------------------------------
-- Purpose: ManureSystemUtil utility.
--
-- Copyright (c) Wopster, 2018
----------------------------------------------------------------------------------------------------

---@class ManureSystemUtil
ManureSystemUtil = {}

---Gets the spec table for the given spec.
---@param vehicle table
---@param name string
---@return table
function ManureSystemUtil.getSpecTable(vehicle, name)
    local modName = g_manureSystem.modName
    local spec = vehicle["spec_" .. modName .. "." .. name]
    if spec ~= nil then
        return spec
    end

    return vehicle["spec_" .. name]
end
