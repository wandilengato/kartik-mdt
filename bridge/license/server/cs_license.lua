if (GetResourceState('cs_license') ~= "started") then return end

function UpdateBridgeLicense(citizenId, licenseType, status, playerId)
    if not playerId then return end
    if status then
        exports['cs_license']:RegisterCard(playerId, licenseType, 30, nil)  -- Register card through cs_license (30 days expiry, no item)
    else
        exports['cs_license']:RevokeCard(playerId, licenseType) -- Revoke
    end
end