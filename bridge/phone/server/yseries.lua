if (GetResourceState('yseries') ~= "started") then return end

function GetPhoneNumber(citizenId)
    local result = MySQL.query.await(
        'SELECT phone_imei as phoneImei FROM yphone_holders WHERE holder_identifier = ? LIMIT 1',
        { citizenId }
    )

    local phoneImei = result[1]?.phoneImei
    if not phoneImei then
        return 'unknown'
    end

    local numberResult = MySQL.query.await(
        'SELECT sim_number as number FROM yphone_sim_cards WHERE phone_imei = ? LIMIT 1',
        { phoneImei }
    )

    local phoneNumber = numberResult[1]?.number
    if phoneNumber then
        return phoneNumber
    else
        return 'unknown'
    end
end