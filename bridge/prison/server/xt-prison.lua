if (GetResourceState('xt-prison') ~= "started") then return end

function JailPerson(source, citizenId, jailTime)
    local validPlayer = GetPlayerByCitizenId(citizenId)
    if validPlayer then
        local sent = lib.callback.await('xt-prison:client:enterJail', validPlayer.source, jailTime)
        if sent then
            return {success = true} -- return true when fined
        end
    end
    return {success = false}
end