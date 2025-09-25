if (GetResourceState('qs-inventory') ~= "started") then
    return
end

function getStashItems(stashId)
    local stashItems = exports['qs-inventory']:GetStashItems("Stash_" .. stashId)
    return stashItems or {}
end

RegisterNetEvent('kartik-mdt:server:loadEvidenceStashes', function(stashId, owner)
    local src = source
    exports['qs-inventory']:RegisterStash(src, stashId, 50, 10000)
    exports['qs-inventory']:OpenInventory('stash', stashId, {
        maxWeight = 10000,
        maxSlots = 50
    }, src)
end)

exports['qs-inventory']:CreateUsableItem('tracker', function(source, item)
    local source = source
    local PlayerData = GetPlayerData(source)
    if not PlayerData or not PlayerData.citizenId then
        print("Error: PlayerData is nil or citizenId is missing for source: " .. tostring(source))
        return
    end

    local label = PlayerData.name
    local job = PlayerData.jobData.name
    if Config.Sprites.Job[job] then
        TogglePlayer(source, label, job, PlayerData.citizenId)
    end
end)

AddEventHandler('qb-inventory:client:itemRemoved', function(source, item, amount, totalAmount)
    if item == "tracker" then
        TriggerServerEvent('kartik-mdt:server:removePlayerBlip')
    end
end) 