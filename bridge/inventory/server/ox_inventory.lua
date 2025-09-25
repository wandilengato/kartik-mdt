if (GetResourceState('ox_inventory') ~= "started") then return end

function getStashItems(stashId)
    exports.ox_inventory:RegisterStash(stashId, stashId, 50, 100000, owner, false)
    local stashItems = exports.ox_inventory:GetInventoryItems(stashId)
    return stashItems or {}
end

RegisterNetEvent('kartik-mdt:server:loadEvidenceStashes', function(stashId, owner)
	exports.ox_inventory:RegisterStash(stashId, stashId, 50, 100000, owner, false)
end)

function getItemName(hash)
    return exports.ox_inventory:Items(hash)?.label
end

exports.ox_inventory:registerHook('buyItem', function(payload)
    if not string.find(payload.itemName, "WEAPON_") then return true end
    CreateThread(function()
        local owner = GetPlayerData(payload.source).citizenId
        if not owner or not payload.metadata.serial then return end
        local imageurl = ("https://cfx-nui-ox_inventory/web/images/%s.png"):format(payload.itemName)
        local itemName = getWeaponDisplayName(payload.itemName)
        local success, result = pcall(function()
            return CreateWeaponInfo(payload.metadata.serial, imageurl, owner, itemName)
        end)

        if not success then
            print("Error in creating weapon info in MDT: " .. result)
        end
    end)
    return true
end, {})

exports('useTracker', function(event, _, inventory, _, _)
    if event == 'usingItem' then
        local source = inventory.id
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
        return
    end
end)