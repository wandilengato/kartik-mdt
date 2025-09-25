if GetResourceState('codem-inventory') ~= "started" then return end

function HasItem(item)
    return exports['codem-inventory']:HasItem(item)
end

function OpenStash(stashId)
    TriggerServerEvent('codem-inventory:server:openstash', stashId,  50,  100000, 'Police Evidence #'..stashId)
end

function GetItemImage(name)
     return 'https://cfx-nui-codem-inventory/html/itemimages/'..name..'.png'
end