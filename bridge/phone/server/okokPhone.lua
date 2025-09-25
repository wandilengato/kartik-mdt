if (GetResourceState('okokPhone') ~= "started") then return end

function GetPhoneNumber(citizenId)
    local result = MySQL.query.await(
        'SELECT phone_number FROM okokphone_phones WHERE owner = ? ORDER BY created_at DESC LIMIT 1',
        { citizenId }
    )

    local phoneNumber = result[1] and result[1].phone_number
    return phoneNumber or 'unknown'
end
