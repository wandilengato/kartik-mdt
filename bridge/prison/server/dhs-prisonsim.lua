if (GetResourceState('DHS-PrisonSim') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        exports['DHS-PrisonSim']:SendPlayerToPrison(validPlayer.source , "med", jailTime)
        return {success = true} -- return true when fined
    end
    return {success = false}
end