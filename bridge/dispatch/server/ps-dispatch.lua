---@param data table -- ps-dispatch style alert data
---@return AlertData
local function ConvertPSToKartikMDTAlert(data)
    if type(data) ~= "table" then
        print("^1[ERROR]^0 ConvertPSToKartikMDTAlert: 'data' is not a table")
        return false
    end
    local alert = type(data.alert) == "table" and data.alert or {}
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local function normalizeJobs(raw)
        local jobs = {}
        raw = type(raw) == "table" and raw or { "police" }
        for _, job in pairs(raw) do
            if type(job) == "string" then
                local normalized = job == "leo" and "police" or job
                jobs[normalized] = true
            end
        end
        return jobs
    end

    return {
        coords = coords,
        title = data.message or "Unknown Code",
        code = data.code or data.dispatchCode or "Unknown Code",
        description = data.message or "No description available",
        sound = alert.sound or "dispatch",
        type = "Alert",
        x = coords.x or 0.0,
        y = coords.y or 0.0,
        z = coords.z or 0.0,
        person = (data.name and type(data.name) == "string") and {
            name = data.name,
            phone = data.phone or "",
            citizenid = data.citizenid or ""
        } or nil,

        weapon = data.automaticGunfire and {
            name = "Automatic Gunfire"
        } or nil,

        vehicle = (type(data.vehicle) == "table") and {
            model = data.vehicle.model or "Unknown Model",
            plate = data.plate or "Unknown Plate",
            color = data.color or "Unknown Color",
            doorCount = tonumber(data.doorCount) or 0,
            heading = data.heading or "Unknown"
        } or nil,

        blip = (data.alert or data.sprite) and {
            radius = tonumber(alert.radius or data.radius) or 0,
            sprite = tonumber(alert.sprite or data.sprite) or 0,
            color = tonumber(alert.color or data.color) or 0,
            scale = tonumber(alert.scale or data.scale) or 1.0,
            length = tonumber(alert.length or data.length) or 1
        } or nil,
        jobs = normalizeJobs(data.jobs)
    }
end

RegisterNetEvent('ps-dispatch:server:notify',function(data)
    if not data then return end
    local convertedData = ConvertPSToKartikMDTAlert(data)
    if not convertedData then return end
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)