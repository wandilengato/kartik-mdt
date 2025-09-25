if (GetResourceState('snipe-evidence') ~= "started") then return end

hasCustomEvidence = true

function GetEvidenceStashId(identifier)
    if identifier then
        return "cs_"..identifier
    end
    return "unknown"
end