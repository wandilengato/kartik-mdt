if (GetResourceState('ps-banking') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local PlayerData = GetPlayerByCitizenId(citizenId)
    if not PlayerData then return { success = false, error = "Invalid source" } end
    if PlayerData.source then
        exports["ps-banking"]:createBill({
            identifier = citizenId, 
            description = "Fine for crime", 
            type = "Expense",
            amount = fine,
        })
        return {success = true} 
    else
        return {success = false} 
    end
end