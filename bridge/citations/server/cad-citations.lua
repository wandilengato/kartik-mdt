if (GetResourceState('cad-citations') ~= "started") then return end

function fetchCitizenCitations(citizenId)
    local result = MySQL.query.await('SELECT * FROM citations WHERE citizen_id = ?', { citizenId })
    local citations = {}
    if result and #result > 0 then
        for k,v in pairs(result) do
            local data = {
                id = v.id,
                issueDate = v.created_at,
                issuingOfficer = v.officer_name,
                officerId = v.officer_callsign,
                violation = v.violations,
                fineAmount = v.fine_amount,
                dueDate = nil,
                status = (v.deleted == 'Y') and 'paid' or 'pending',
                location = v.street_name,
                notes = v.comments or 'N/A',
            }
            table.insert(citations, data)
        end
        return citations
    else
        return {}
    end
end