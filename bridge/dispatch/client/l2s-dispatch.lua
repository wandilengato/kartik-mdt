function l2sDispatch(name, cb)
    AddEventHandler(('__cfx_export_l2s-dispatch_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

l2sDispatch('GetPlayerData', function()
    local ped = cache.ped
    if not ped then return end
    local coords = GetEntityCoords(ped)
    local weaponName = GetWeaponName()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local isInVehicle = vehicle ~= 0
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = (GetStreetNameFromHashKey(streetName) or "Unknown") .. " , " .. (GetStreetNameFromHashKey(crossingRoad) or "Unknown")
    local data = {
        sex = PlayerData.gender or "Unknown",
        gun = weaponName or "None",
        ped = ped,
        coords = {x = math.floor(coords.x), y = math.floor(coords.y)},
        name = PlayerData.name or "Unknown",
        GetVehicleIn = vehicle or 0,
        isInVehicle = isInVehicle,
        source = GetPlayerServerId(PlayerId()),
        street = street
    }
    return data
end)