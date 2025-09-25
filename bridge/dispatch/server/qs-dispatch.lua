---@param data table -- Raw QS-Dispatch notification data
---@return AlertData
local function ConvertQSToKartikMDTAlert(data)
    local coords = data.callLocation or vec3(0.0, 0.0, 0.0)
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
    local job = data.job_table or {'police'}
    for i, job in ipairs(job) do
        jobs[job] = true
    end

    return {
        coords = coords,
        code = data.callCode and data.callCode.code or "Unknown" ,
        title = data.callCode and data.callCode.snippet or "Alert",
        description = data.message or "No description",
        sound = data.sound or "dispatch",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        location = data.location,
        person = nil, -- no person info in qs-dispatch structure
        weapon = nil, -- no weapon info
        vehicle = nil, -- no vehicle info
        blip = blipData,
        jobs = jobs
    }
end

RegisterNetEvent("qs-dispatch:server:CreateDispatchCall",function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertQSToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
