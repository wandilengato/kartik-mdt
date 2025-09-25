if (GetResourceState('p_policejob') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        local sent = exports['p_policejob']:JailPlayer(source, { player = validPlayer.source, jail = jailTime, fine = 0, reason = 'MDT REPORT' }) -- fine is set to 0
        if sent then
            return {success = true} -- return true when fined
        end
    end
    return {success = false}
end