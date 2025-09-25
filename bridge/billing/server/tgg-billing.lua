if (GetResourceState('tgg-billing') ~= "started") then return end

local societyName = "police"

function FinePerson(source, citizenId, fine)
    local officer = GetPlayerData(source) -- Assuming this returns the officer/player object
    if not officer then return { success = false, error = "Invalid officer source" } end

    local criminal = GetPlayerByCitizenId(citizenId)
    if not criminal then return { success = false, error = "Invalid criminal citizen ID" } end

    local invoiceData = {
        items = {
            {
                key = "fine",
                label = "Fine",
                price = fine,
                quantity = 1,
                priceChange = false,
                quantityChange = false
            }
        },
        total = fine,
        sender = societyName, 
        senderId = officer.citizenId,
        senderName = officer.name,
        recipientId = citizenId,
        recipientName = criminal.name,
        taxPercentage = 10,
        senderCompanyName = "Police Department" 
    }

    exports["tgg-billing"]:CreateInvoice(invoiceData)
    return { success = true }
end
