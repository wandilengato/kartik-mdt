if (GetResourceState('codem-billing') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        exports['codem-billing']:createBilling(source, PlayerData.source, fine, "Invoice for fine", societyName)
        return {success = true}  
    else
        return {success = false} 
    end
end