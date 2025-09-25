if (GetResourceState('lb-phone') ~= "started") then return end

function GetPhoneNumber(citizenId)
    local result = MySQL.query.await(
        'SELECT phone_number FROM phone_phones WHERE owner_id = ? LIMIT 1',
        { citizenId }
    )

    local phoneNumber = result[1]?.phone_number
    return phoneNumber or 'unknown'
end