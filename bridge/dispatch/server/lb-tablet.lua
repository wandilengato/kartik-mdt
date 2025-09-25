function LBExport(name, cb)
    AddEventHandler(('__cfx_export_lb-tablet_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

local function ConvertLBDispatchToKartikAlert(data)
    local coords = vec3(
        data.location and data.location.coords and data.location.coords.x or 0.0,
        data.location and data.location.coords and data.location.coords.y or 0.0,
        0.0 -- LB dispatch doesn't provide z
    )

    -- Parse known fields from `fields` array
    local person, weapon, vehicle = nil, nil, nil

    if data.fields then
        person = {}
        vehicle = {}

        for _, field in ipairs(data.fields) do
            local label = field.label:lower()
            local value = field.value or ""

            if label == "name" then person.name = value end
            if label == "phone" then person.phone = value end
            if label == "citizen id" then person.citizenid = value end

            if label == "weapon" then weapon = { name = value } end

            if label == "plate" then vehicle.plate = value end
            if label == "model" then vehicle.model = value end
            if label == "color" then vehicle.color = value end
        end

        -- If vehicle wasn't populated at all, remove it
        if not next(vehicle) then vehicle = nil end
        if not next(person) then person = nil end
    end

    return {
        coords = coords,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        title = data.title or "Unknown Title",
        code = data.code or "Unknown Code",
        description = data.description or "No Description",
        location = data.location and data.location.label or "Unknown Location",
        sound = (data.sound ~= false and data.sound) or "dispatch",
        type = "Alert",
        person = person,
        weapon = weapon,
        vehicle = vehicle,
        blip = data.blip and {
            radius = 0,
            sprite = data.blip.sprite or 0,
            color = data.blip.color or 0,
            scale = data.blip.size or 1.0,
            length = data.time or 30
        } or nil,
        jobs = {
            [data.job or "police"] = true
        }
    }
end


LBExport('AddDispatch', function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertTkToKartikMDTAlert(data)
    TriggerEvent("kartik-mdt:server:sendDispatchNotification", convertedData)
end)
