if GetResourceState('qs-inventory') ~= "started" then return end

function HasItem(item)
    local result = exports['qs-inventory']:Search(item)
    return (result and result > 0 ) or false
end

function OpenStash(stashId)
    TriggerServerEvent('kartik-mdt:server:loadEvidenceStashes', stashId)
end

function GetItemImage(name)
    return 'https://cfx-nui-qs-inventory/html/images/'..name..'.png'
end