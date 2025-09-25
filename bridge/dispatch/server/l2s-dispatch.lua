---@param data table -- Raw L2S-Dispatch notification data
---@return AlertData
local function ConvertL2sToKartikMDTAlert(data)
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
    local jobTable = data.departments or {'police'}
    for i, job in ipairs(jobTable) do
        jobs[job] = true
    end

    return {
        coords = coords,
        code = data.title:sub(1, data.title:find(' - ') - 1) or data.title,
        title = data.title:sub(data.title:find(' - ') + 3) or "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z or 0.0,
        description = data.message or "No description",
        sound = data.sound or "dispatch",
        location = data.street, 
        type = "Alert",
        person = nil, -- no person info in l2s-dispatch structure
        weapon = nil, -- no weapon info
        vehicle = nil, -- no vehicle info
        blip = blipData,
        jobs = jobs
    }
end

RegisterNetEvent("l2s-dispatch:server:AddNotification",function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertL2sToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
