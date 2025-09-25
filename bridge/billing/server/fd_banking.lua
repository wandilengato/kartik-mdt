if (GetResourceState('fd_banking') ~= "started") then return end

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    exports['fd_banking']:issueInvoice(source, PlayerData.source, fine, "Invoice for fine", true)
    return {success = true} 
end