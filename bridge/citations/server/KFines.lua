if (GetResourceState('KFines') ~= "started") then return end

function fetchCitizenCitations(citizenId)
    local result = MySQL.query.await(
        'SELECT * FROM kfines WHERE citizenIdentifier = ?',
        { citizenId }
    )
    local citations = {}
    if result and #result > 0 then
        for k,v in pairs(result) do
            local data = {
                id = v.id,
                issueDate = v.date,
                issuingOfficer = v.copName,
                officerId = v.copBadge,
                violation = v.reason,
                fineAmount = v.fine,
                dueDate = v.payUntil,
                status = v.paid and "paid" or v.afterTime and "overdue" or "pending",
                location = "Not Defined",
                notes = "N.A",
            }
            table.insert(citations, data)
        end
        return citations
    else
        return {}
    end
end