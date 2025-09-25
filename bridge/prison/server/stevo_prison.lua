if (GetResourceState('stevo_prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        export.stevo_prison:sentence(source, validPlayer.source, jailTime, "Crime")
        return {success = true} -- return true when fined
    end
    return {success = false}
end