local inventoryName = nil
if (GetResourceState('qb-inventory') == "started") then inventoryName = 'qb-inventory' end
if (GetResourceState('ps-inventory') == "started") then inventoryName = 'ps-inventory' end
if (GetResourceState('lj-inventory') == "started") then inventoryName = 'lj-inventory' end
if not inventoryName then return end

function HasItem(item)
    return exports[inventoryName]:HasItem(item)
end

RegisterNetEvent('kartik-mdt:client:openMDT', function()
    exports['kartik-mdt']:openMDT()
end)

RegisterNetEvent('kartik-mdt:client:openDispatch', function()
    exports['kartik-mdt']:openDispatch()
end)

RegisterNetEvent('kartik-mdt:client:ToggleBodycam', function()
    exports['kartik-mdt']:ToggleBodycam()
end)

function OpenStash(stashId)
    TriggerServerEvent('kartik-mdt:server:loadEvidenceStashes', stashId) 
end

function GetItemImage(name)
     return 'https://cfx-nui-qb-inventory/html/images/'..name..'.png'
end