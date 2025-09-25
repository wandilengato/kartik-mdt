if (GetResourceState('wk_wars2x') ~= "started") then return end

RegisterNetEvent("wk:onPlateScanned", function(cam, plate, index)
    local src = source
    local PlayerData = GetPlayerData(src)
    local vehicleOwner = GetVehicleOwner(plate)
    local bolo = GetBoloStatus(plate)
    local warrant = GetWarrantStatus(PlayerData.citizenid)
    local driversLicense = PlayerData['licences'].driver

    if bolo then
        TriggerClientEvent('ox_lib:notify', src, {
            id = 'plate_bolo_' .. plate,
            title = 'BOLO ALERT',
            description = 'Plate: ' .. plate .. '\nOwner: ' .. vehicleOwner,
            duration = 5000,
            position = 'top-right',
            type = 'error',
            icon = 'fa-solid fa-triangle-exclamation',
            iconColor = '#ff0000',
            iconAnimation = 'shake'
        })
    end

    if warrant then
        TriggerClientEvent('ox_lib:notify', src, {
            id = 'plate_wanted_' .. plate,
            title = 'WANTED VEHICLE',
            description = 'Plate: ' .. plate .. '\nOwner: ' .. vehicleOwner,
            duration = 5000,
            position = 'top-right',
            type = 'error',
            icon = 'fa-solid fa-handcuffs',
            iconColor = '#ff0000',
            iconAnimation = 'pulse'
        })
    end

    if driversLicense == false and vehicleOwner then
        TriggerClientEvent('ox_lib:notify', src, {
            id = 'plate_license_' .. plate,
            title = 'NO DRIVERS LICENSE',
            description = 'Plate: ' .. plate .. '\nOwner: ' .. vehicleOwner,
            duration = 5000,
            position = 'top-right',
            type = 'warning',
            icon = 'fa-solid fa-id-card',
            iconColor = '#ffa500',
            iconAnimation = 'beat'
        })
    end

    if bolo or warrant or (not driversLicense and vehicleOwner) then
        TriggerClientEvent("wk:togglePlateLock", src, cam, true, 1)
    end
end)
