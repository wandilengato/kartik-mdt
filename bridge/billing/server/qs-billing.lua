if (GetResourceState('qs-billing') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        exports['qs-billing']:ServerCreateInvoice(source, 'police', 'Invoice for fine', fine, true, false, true, true, societyName)
        return {success = true} 
    else
        return {success = false} 
    end
end