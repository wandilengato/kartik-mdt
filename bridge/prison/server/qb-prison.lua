if (GetResourceState('qb-prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        local playerSource = validPlayer.source
        TriggerClientEvent('prison:client:Enter', playerSource, jailTime)
        return {success = true}
    end
    return {success = false}
end