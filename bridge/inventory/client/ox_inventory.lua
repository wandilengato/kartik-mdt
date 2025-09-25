if GetResourceState('ox_inventory') ~= "started" then return end

function HasItem(item)
    return exports.ox_inventory:GetItemCount(item) > 0
end

function OpenStash(stashId)
    if not exports.ox_inventory:openInventory('stash', stashId) then
        TriggerServerEvent('kartik-mdt:server:loadEvidenceStashes', stashId)
        exports.ox_inventory:openInventory('stash', stashId)
    end
end

function GetItemImage(name)
    return 'https://cfx-nui-ox_inventory/web/images/'..name..'.png'
end

function getItemName(hash)
    return exports.ox_inventory:Items(hash)?.label
end
