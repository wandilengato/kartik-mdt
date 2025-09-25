---@param data table -- Raw RCore_Dispatch notification data
---@return AlertData
local function ConvertRCoreToKartikMDTAlert(data)
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
    local job = data.job or 'police'
    if type(job) == 'table' then
        for i, job in ipairs(job) do
            jobs[job] = true
        end
    else
        jobs[job] = true
    end

    return {
        coords = coords,
        code = data.code or "Unknown",
        title = (data.blip and data.blip.text) or data.type,
        description = data.text or "No description",
        sound = data.custom_sound or "dispatch",
        type = "Alert",
        location = data.location,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        person = nil, -- no person info in rcore_dispatch structure
        weapon = nil, -- no weapon info
        vehicle = nil, -- no vehicle info
        blip = blipData,
        jobs = jobs
    }
end

RegisterNetEvent("rcore_dispatch:server:sendAlert",function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertRCoreToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
