if (GetResourceState('high_phone') ~= "started") then return end

function GetPhoneNumber(citizenId, source)
    return exports.high_phone:getPlayerPhoneNumber(source) or "Unknown"
end
