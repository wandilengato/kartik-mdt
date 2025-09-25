function tkExport(name, cb)
    AddEventHandler(('__cfx_export_tk_dispatch_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

---@param data table -- tk_dispatch style alert data
---@return AlertData
local function ConvertTkToKartikMDTAlert(data)
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    return {
        coords = coords,
        title = data.title or "Unknown Code",  -- Default value if missing
        code = data.code or data.dispatchCode or "Unknown Code",  -- Default value
        description = data.message or "No description available",  -- Default value
        sound = data.alert and data.alert.sound or "dispatch",
        type = "Alert",
        location = data.location,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        person = (data.person and {
            name = data.person,
            phone = data.phoneNumber or "",  -- Ensure phone is not nil
            citizenid = data.citizenid or ""  -- Ensure citizenid is not nil
        }) or nil,
        weapon = (data.weapon and {
            name = data.weapon
        }) or nil,
        vehicle = (data.vehicle and {
            model = data.vehicle.model or "Unknown Model",  -- Default value for vehicle model
            plate = data.plate or "Unknown Plate",  -- Default value for vehicle plate
            color = data.color or "Unknown Color",  -- Default value for color
            doorCount = data.doorCount or 0,  -- Default value for doorCount]
            heading = data.heading or "Unknown" -- Default value for heading
        }) or nil,
        blip = data.alert and {
            radius = data.alert.radius or 0,
            sprite = data.alert.sprite or 0,
            color = data.alert.color or 0,
            scale = data.alert.scale or 1.0,
            length = data.alert.length or 1
        } or nil,
        jobs = (function()
            local jobs = {}
            local rawJobs = data.jobs or {'police'}
        
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

tkExport('addCall', function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertTkToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
