local inventoryName = nil
if (GetResourceState('qb-inventory') == "started") then inventoryName = 'qb-inventory' end
if (GetResourceState('ps-inventory') == "started") then inventoryName = 'ps-inventory' end
if (GetResourceState('lj-inventory') == "started") then inventoryName = 'lj-inventory' end
if not inventoryName then return end

local QBCore = exports['qb-core']:GetCoreObject()

if Config.Utils.mdt.itemRequired then
    QBCore.Functions.CreateUseableItem(Config.Utils.mdt.item, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent('kartik-mdt:client:openMDT', source)
    end)
end

if Config.Utils.dispatch.itemRequired then
    QBCore.Functions.CreateUseableItem(Config.Utils.dispatch.item, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent('kartik-mdt:client:openDispatch', source)
    end)
end

if Config.Utils.bodycam.itemRequired then
    QBCore.Functions.CreateUseableItem(Config.Utils.bodycam.item, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent('kartik-mdt:client:ToggleBodycam', source)
    end)
end

QBCore.Functions.CreateUseableItem("tracker", function(source, item)
    local PlayerData = GetPlayerData(source)
    local label = PlayerData.name
    local job = PlayerData.jobData.name
    if Config.Sprites.Job[job] then
        local citizenId = PlayerData.citizenId
        TogglePlayer(source, label, job, citizenId)
    end
end)

function getStashItems(stashId)
    local stashItems = exports['qb-inventory']:GetInventory(stashId)
    return stashItems and stashItems.items or {}
end

RegisterNetEvent('kartik-mdt:server:loadEvidenceStashes', function(stashId)
    local data = { label = 'Police Evdidence #'..stashId, maxweight = 100000, slots = 50 }
    exports['qb-inventory']:OpenInventory(source, stashId, data)
end)
