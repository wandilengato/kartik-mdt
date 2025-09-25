if (GetResourceState('qs-smartphone-pro') ~= "started") then return end

function GetPhoneNumber(citizenId)
    return exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(citizenId, true) or "Unknown"
end
