function originExport(name, cb)
    AddEventHandler(('__cfx_export_origen_police_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

---@param data table -- tk_dispatch style alert data
---@return AlertData
---@param data table -- tk_dispatch or origen_police style alert data
---@return AlertData
local function ConvertOriginToKartikMDTAlert(data)
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local meta = data.metadata or {}

    return {
        coords = coords,
        title = data.title or "Unknown Code",
        code = data.code or data.dispatchCode or "Unknown Code",
        description = data.message or "No description available",
        sound = (data.alert and data.alert.sound) or "dispatch",
        type = data.type or "Alert",
        location = data.location or nil,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        person = (meta.name and {
            name = meta.name or "",
            phone = data.phoneNumber or "",
            citizenid = data.citizenid or ""
        }) or nil,

        weapon = (meta.weapon and {
            name = meta.weapon
        }) or nil,

        vehicle = (meta.model and {
            model = meta.model or "Unknown Model",
            plate = meta.plate or "Unknown Plate",
            color = type(meta.color) == "table" and table.concat(meta.color, ", ") or (meta.color or "Unknown Color"),
            doorCount = meta.doorCount or 0,
            heading = data.heading or "Unknown"
        }) or nil,

        blip = (data.alert and {
            radius = data.alert.radius or 0,
            sprite = data.alert.sprite or 0,
            color = data.alert.color or 0,
            scale = data.alert.scale or 1.0,
            length = data.alert.length or 1
        }) or nil,

        jobs = (function()
            local jobs = {}
            local rawJobs = data.jobs or (data.job and { data.job }) or { 'police' }

            for i, job in ipairs(rawJobs) do
                if job == 'leo' then
                    rawJobs[i] = 'police'
                end
            end

            for _, job in pairs(rawJobs) do
                jobs[job] = true
            end
            return jobs
        end)()
    }
end

originExport('SendAlert', function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertOriginToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)

RegisterNetEvent('SendAlert:police',function(data)
    if not data then return end
    local convertedData = ConvertOriginToKartikMDTAlert(data)
    if not convertedData then return end
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)