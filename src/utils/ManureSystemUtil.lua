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

function ManureSystemUtil:getIsPlayerInConnectorRange(vehicle)
    local player = g_currentMission.player

    if player == nil then
        return false, nil
    end

    if not g_currentMission.accessHandler:canPlayerAccess(vehicle) then
        return false, nil
    end

    local playerTrans = { getWorldTranslation(player.rootNode) }
    local playerDistanceSequence = 1.3

    for id, connector in ipairs(vehicle:getConnectors()) do
        if connector ~= nil and connector.isConnected then
            local trans = { getWorldTranslation(connector.node) }
            local distance = MathUtil.vector3Length(trans[1] - playerTrans[1], trans[2] - playerTrans[2], trans[3] - playerTrans[3])

            playerDistanceSequence = Utils.getNoNil(connector.inRangeDistance, playerDistanceSequence)

            if distance < playerDistanceSequence then
                playerDistanceSequence = distance

                return true, id
            end
        end
    end

    return false, nil
end
