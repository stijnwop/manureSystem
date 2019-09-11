----------------------------------------------------------------------------------------------------
-- ManureSystemLagoon
----------------------------------------------------------------------------------------------------
-- Purpose: Lagoon placeable
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

ManureSystemLagoon = {}
local ManureSystemLagoon_mt = Class(ManureSystemLagoon, Placeable)

InitObjectClass(ManureSystemLagoon, "ManureSystemLagoon")

function ManureSystemLagoon:new(isServer, isClient)
    local instance = Placeable:new(isServer, isClient, ManureSystemLagoon_mt)
    return instance
end

function ManureSystemLagoon:delete()
    local storageSystem = g_currentMission.storageSystem
    storageSystem:removeStorage(self.storage)

    -- delete storage later to avoid access to already deleted storage
    self.storage:delete()

    unregisterObjectClassName(self)

    ManureSystemLagoon:superClass().delete(self)
end

function ManureSystemLagoon:load(xmlFilename, x, y, z, rx, ry, rz, initRandom)
    if not ManureSystemLagoon:superClass().load(self, xmlFilename, x, y, z, rx, ry, rz, initRandom) then
        return false
    end

    local xmlFile = loadXMLFile("manureSystemLagoon", xmlFilename)

    local storageKey = string.format("placeable.manureSystemLagoon.storage")

    local storageNode = I3DUtil.indexToObject(self.nodeId, getXMLString(xmlFile, storageKey .. "#node"))
    if storageNode ~= nil then
        local storage = Storage:new(self.isServer, self.isClient)
        if storage:load(storageNode, xmlFile, storageKey) then
            storage.ownerFarmId = 1
            self.storage = storage
        end
    else
        g_logManager:xmlWarning(xmlFilename, "Missing 'node' for storage '%s'!", storageKey)
        return false
    end

    self.planeNode = I3DUtil.indexToObject(self.nodeId, getXMLString(xmlFile, "placeable.manureSystemLagoon#planeNode"))

    if self.planeNode ~= nil then
        self.planeMoveMinY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeMinY"), 0)
        self.planeMoveMaxY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeMaxY"), 0)
        self.planeOffsetY = Utils.getNoNil(getXMLFloat(xmlFile, "placeable.manureSystemLagoon#planeOffsetY"), 0)
    end

    delete(xmlFile)

    self.lagoonDirtyFlag = self:getNextDirtyFlag()

    registerObjectClassName(self, "ManureSystemLagoon")

    return true
end

function ManureSystemLagoon:readStream(streamId, connection)
    ManureSystemLagoon:superClass().readStream(self, streamId, connection)
    if connection:getIsServer() then
        local storageId = NetworkUtil.readNodeObjectId(streamId)
        self.storage:readStream(streamId, connection)
        g_client:finishRegisterObject(self.storage, storageId)
    end
end

function ManureSystemLagoon:writeStream(streamId, connection)
    ManureSystemLagoon:superClass().writeStream(self, streamId, connection)
    if not connection:getIsServer() then
        NetworkUtil.writeNodeObjectId(streamId, NetworkUtil.getObjectId(self.storage))
        self.storage:writeStream(streamId, connection)
        g_server:registerObjectInStream(connection, self.storage)
    end
end


function ManureSystemLagoon:readUpdateStream(streamId, timestamp, connection)
    ManureSystemLagoon:superClass().readUpdateStream(self, streamId, timestamp, connection)

    if connection:getIsServer() then
        if streamReadBool(streamId) then
            self:updateFillPlaneHeight(self:getFillUnitFillLevel())
        end
    end
end

function ManureSystemLagoon:writeUpdateStream(streamId, connection, dirtyMask)
    ManureSystemLagoon:superClass().writeUpdateStream(self, streamId, connection, dirtyMask)

    if not connection:getIsServer() then
        streamWriteBool(streamId, bitAND(dirtyMask, self.lagoonDirtyFlag) ~= 0)
    end
end

function ManureSystemLagoon:loadFromXMLFile(xmlFile, key, resetVehicles)
    if not ManureSystemLagoon:superClass().loadFromXMLFile(self, xmlFile, key, resetVehicles) then
        return false
    end

    local storageKey = string.format("%s.storage", key)
    if not self.storage:loadFromXMLFile(xmlFile, storageKey) then
        return false
    end

    self:updateFillPlaneHeight(self:getFillUnitFillLevel())

    return true
end

function ManureSystemLagoon:saveToXMLFile(xmlFile, key, usedModNames)
    ManureSystemLagoon:superClass().saveToXMLFile(self, xmlFile, key, usedModNames)

    local storageKey = string.format("%s.storage", key)
    self.storage:saveToXMLFile(xmlFile, storageKey, usedModNames)
end

function ManureSystemLagoon:finalizePlacement()
    ManureSystemLagoon:superClass().finalizePlacement(self)

    local storageSystem = g_currentMission.storageSystem

    self.storage:setOwnerFarmId(self:getOwnerFarmId(), true)
    storageSystem:addStorage(self.storage)
    self.storage:register(true)
end

function ManureSystemLagoon:onSell()
    ManureSystemLagoon:superClass().onSell(self)
end

function ManureSystemLagoon:getFillUnitFillType(unitIndex)
    if self.storage ~= nil then
        for fillType, _ in pairs(self.storage.fillTypes) do
            return fillType -- only support first
        end
    end

    return FillType.UNKNOWN
end

function ManureSystemLagoon:getFillUnitAllowsFillType(_, fillType)
    return self.storage:getIsFillTypeSupported(fillType)
end

function ManureSystemLagoon:getFillUnitFillLevel(unitIndex)
    local fillType = self:getFillUnitFillType()
    return self.storage:getFillLevel(fillType)
end

function ManureSystemLagoon:getFillUnitCapacity(unitIndex)
    return self.storage.capacityPerFillType
end

function ManureSystemLagoon:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData)
    local movedFillLevel = 0

    if self.storage:getIsFillTypeSupported(fillTypeIndex) and self:getIsToolTypeAllowed(toolType) then

        if self:hasFarmAccessToStorage(farmId, self.storage) then
            if self.storage:getFreeCapacity(fillTypeIndex) > 0 then
                local oldFillLevel = self.storage:getFillLevel(fillTypeIndex)
                self.storage:setFillLevel(oldFillLevel + fillLevelDelta, fillTypeIndex)
                local newFillLevel = self.storage:getFillLevel(fillTypeIndex)

                movedFillLevel = movedFillLevel + (newFillLevel - oldFillLevel)

                if self.isServer then
                    self:updateFillPlaneHeight(newFillLevel)
                    self:raiseDirtyFlags(self.lagoonDirtyFlag)
                end
            end

            if movedFillLevel >= fillLevelDelta - 0.001 then
                movedFillLevel = fillLevelDelta
            end

        end
    end

    return movedFillLevel
end

function ManureSystemLagoon:getIsToolTypeAllowed(toolType)
    return true
end

function ManureSystemLagoon:hasFarmAccessToStorage(farmId, storage)
    if self.hasStoragePerFarm then
        return farmId == storage:getOwnerFarmId()
    end

    return g_currentMission.accessHandler:canFarmAccess(farmId, storage)
end

function ManureSystemLagoon:updateFillPlaneHeight(fillLevel)
    if self.planeNode ~= nil then
        local x, _, z = getTranslation(self.planeNode)
        local y = self.planeMoveMinY + (self.planeMoveMaxY - self.planeMoveMinY) * fillLevel / self:getFillUnitCapacity()
        setTranslation(self.planeNode, x, y, z)
    end
end

function ManureSystemLagoon:isUnderFillPlane(x, y, z)
    if self.planeNode == nil then
        return true
    end

    local _, py, _ = getWorldTranslation(self.planeNode)
    py = py + self.planeOffsetY

    return py >= y
end

function ManureSystemLagoon.loadSpecValueVolume(xmlFile, customEnvironment)
    return getXMLInt(xmlFile, "placeable.manureSystemLagoon.storage#capacityPerFillType")
end

function ManureSystemLagoon.getSpecValueVolume(storeItem, realItem)
    if storeItem.specs.siloVolume == nil then
        return nil
    end

    return g_i18n:formatVolume(storeItem.specs.siloVolume)
end
