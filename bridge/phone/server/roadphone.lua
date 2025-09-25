if (GetResourceState('roadphone') ~= "started") then return end

function GetPhoneNumber(citizenId)
    return exports['roadphone']:getNumberFromIdentifier(citizenId) or "unknown"
end
