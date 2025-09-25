if (GetResourceState('cs_billing') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        exports['cs_billing']:createBill({playerID = PlayerData.source, society = societyName, society_name = 'LSPD',  amount = fine, title = 'Invoice for fine' })
        return {success = true}  
    else
        return {success = false} 
    end
end

