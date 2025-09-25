local function ConvertCDToKartikMDTAlert(data)
    if not data then return false end
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
        code = data.title and data.title:sub(1, data.title:find(' - ') - 1) or "10-15",
        title = data.title and data.title:sub(data.title:find(' - ') + 3) or "Alert",
        description = data.message or "No description",
        sound = data.sound or "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        location = data.location,
        type = "Alert",
        person = nil, -- no person info in cd_dispatch structure
        weapon = nil, -- no weapon info
        vehicle = nil, -- no vehicle info
        blip = blipData,
        jobs = jobs
    }
end

RegisterNetEvent("cd_dispatch:AddNotification",function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertCDToKartikMDTAlert(data)
    if not convertedData then return end
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
