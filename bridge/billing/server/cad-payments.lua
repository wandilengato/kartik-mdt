if (GetResourceState('cad-payments') ~= "started") then return end

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        exports['cad-payments']:ChargeMoney(PlayerData.source, fine, "Invoice for fine")
        return {success = true} 
    else
        return {success = false} 
    end
end