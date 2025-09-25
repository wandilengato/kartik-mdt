if (GetResourceState('tk_jail') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        exports.tk_jail:jail(validPlayer.source, jailTime)
        return {success = true} -- return true when fined
    end
    return {success = false}
end