if (GetResourceState('r_prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        local sent = exports.r_prison:JailPlayer(validPlayer.source, jailTime, 0) -- bail is set to 0
        if sent then
            return {success = true} -- return true when fined
        end
    end
    return {success = false}
end