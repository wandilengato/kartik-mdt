if (GetResourceState('lh34-jail') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        exports['lh34-jail']:jailPlayer(validPlayer.source, true, jailTime)
        return {success = true} -- return true when fined
    end
    return {success = false}
end