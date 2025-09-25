if (GetResourceState('gksphone') ~= "started") then return end

function GetPhoneNumber(citizenId)
    local uniqueID = MySQL.Sync.fetchScalar([[
        SELECT
            unique_id
        FROM
            gksphone_settings
        WHERE
            setup_owner = ?
    ]], {citizenId})

    if not uniqueID then
        return "Unknown"
    end

    local phoneNumber = MySQL.Sync.fetchScalar([[
        SELECT
            phone_number
        FROM
            gksphone_esim
        WHERE
            phone_id = ? AND is_active = 1
    ]], {uniqueID})

    return phoneNumber or "Unknown"
end
