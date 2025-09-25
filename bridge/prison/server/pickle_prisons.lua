if (GetResourceState('pickle_prisons') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        exports.pickle_prisons:JailPlayer(validPlayer.source, jailTime, "default")
        return {success = true} -- return true when fined
    end
    return {success = false}
end