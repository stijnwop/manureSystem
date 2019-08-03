ManureSystemUtil = {}

ManureSystemUtil.MAX_PROJECT_THRESHOLD = 0.95
ManureSystemUtil.MIN_PROJECT_THRESHOLD = 0.05

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

function ManureSystemUtil:renderHelpTextOnNode(node, actionText, inputBinding)
    if node ~= nil then
        local worldX, worldY, worldZ = localToWorld(node, 0, 0.1, 0)
        local x, y, z = project(worldX, worldY, worldZ)

        if x < ManureSystemUtil.MAX_PROJECT_THRESHOLD and y < ManureSystemUtil.MAX_PROJECT_THRESHOLD and z < 1 and x > ManureSystemUtil.MIN_PROJECT_THRESHOLD and y > ManureSystemUtil.MIN_PROJECT_THRESHOLD and z > 0 then
            local textSize = getCorrectTextSize(0.02)
            setTextAlignment(RenderText.ALIGN_CENTER)
            setTextColor(1, 1, 1, 1)
            renderText(x, y + 0.01, textSize, inputBinding)
            renderText(x, y - 0.02, textSize, actionText)
            setTextAlignment(RenderText.ALIGN_LEFT)
        end
    end
end