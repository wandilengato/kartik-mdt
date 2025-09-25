if (GetResourceState('kartik-banking') ~= "started") then return end


function FinePerson(source, citizenId, fine)
    local officer = GetPlayerData(source) -- Assuming this returns the officer/player object
    if not officer then return { success = false, error = "Invalid officer source" } end

    local criminal = GetPlayerByCitizenId(citizenId)
    if not criminal then return { success = false, error = "Invalid criminal citizen ID" } end

    local societyName = officer.jobData.name
    local result = false
    local societyAccount = exports['kartik-banking']:GetAccountDataByOwner(societyName, "company", "fleeca")
    if not societyAccount then return { success = result } end

    local criminalAccount = exports['kartik-banking']:GetAccountDataByOwner(citizenId, "personal", "fleeca")
    if not criminalAccount then return { success = result } end

    result = exports['kartik-banking']:GenerateBill({
        owner = criminalAccount.accountNumber,
        title = "Fine",
        issuer_account_number= societyAccount.accountNumber, -- optional
        frequency = "custom",
        custom_frequency_days = 0,
        amount = fine,
        metadata = {
            type = "one-time",
    
        }
    })
    return { success = result }
end
