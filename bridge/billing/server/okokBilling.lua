if (GetResourceState('okokBilling') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        TriggerServerEvent("okokBilling:CreateCustomInvoice", PlayerData.source, fine, "Fine for crime", "Govt.", true, societyName)
        return {success = true} 
    else
        return {success = false} 
    end
end