if (GetResourceState('rcore_prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        exports['rcore_prison']:Jail(validPlayer.source, jailTime, 'Crime')
        return {success = true} -- return true when fined
    end
    return {success = false}
end