function cdExport(name, cb)
    AddEventHandler(('__cfx_export_cd_dispatch_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end


---@param data table -- Raw CD_Dispatch notification data
---@return AlertData
local function ConvertCDToKartikMDTAlert(data)
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local blipData = nil
    if data.blip then
        blipData = {
            radius = data.blip.radius or 0,
            sprite = data.blip.sprite or 0,
            color = data.blip.colour or 0,
            scale = data.blip.scale or 1.0,
            length = data.blip.time or 1
        }
    end

    local jobs = {}
    local jobTable = data.job_table or {'police'}
    for i, job in ipairs(jobTable) do
        jobs[job] = true
    end

    return {
        coords = coords,
        code = data.title:sub(1, data.title:find(' - ') - 1) or "10-15",
        title = data.title:sub(data.title:find(' - ') + 3) or "Alert",
        description = data.message or "No description",
        sound = data.sound or "dispatch",
        type = "Alert",
        person = nil, -- no person info in cd_dispatch structure
        weapon = nil, -- no weapon info
        vehicle = nil, -- no vehicle info
        blip = blipData,
        jobs = jobs
    }
end

cdExport('GetPlayerInfo', function()
    local ped = cache.ped
    if not ped then return end
    local coords = GetEntityCoords(ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local data = {
        ped = ped,
        coords = coords,
        street_1 = GetStreetNameFromHashKey(streetName) or "Unknown",
        street_2 = GetStreetNameFromHashKey(crossingRoad) or "Unknown",
        street = (GetStreetNameFromHashKey(streetName) or "Unknown") .. " , " .. (GetStreetNameFromHashKey(crossingRoad) or "Unknown"),
        sex = PlayerData.gender or "Unknown"
    }
    return data
end)

RegisterNetEvent("cd_dispatch:AddNotification",function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertCDToKartikMDTAlert(data)
    exports['kartik-mdt']:CustomAlert(convertedData)
end)
