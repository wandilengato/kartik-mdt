if (GetResourceState('dynyx_prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        TriggerEvent('dynyx_prison:addprisoner', validPlayer.source, jailTime, "MDT Jailed", false, 'prison')
        return {success = true}
    end
    return {success = false}
end