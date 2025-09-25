if (GetResourceState('frkn-prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        TriggerEvent("frkn-prison:jailPlayer", {
            playerIdentifier = citizenId, 
            playerId = source,
            playerName = validPlayer.name,
            crimeType = "Theft",
            severity = "Medium",
            jailTime = 1000, 
            notes = "Stole a police vehicle",
            -- playerPhoto = GetMugShotBase64(playerId)
        })
        return {success = true} -- return true when fined
    end
    return {success = false}
end