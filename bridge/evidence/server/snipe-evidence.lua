if (GetResourceState('snipe-evidence') ~= "started") then return end

function GetEvidenceStashId(identifier)
    if identifier then
        return "cs_"..identifier
    end
    return "unknown"
end

function fetchEvidenceLockers(data)
    local page = data.page
    local query = data.query or "" 
    local offset = (page - 1) * data.limit
    local queryCondition = ""
    local queryParams = {}
    local evidenceCases = {}
    local totalCount = 0
    if query ~= "" then
        queryCondition = "WHERE LOWER(name) LIKE LOWER(?) OR LOWER(cs_id) LIKE LOWER(?) "
        queryParams = {'%'..query..'%', '%'..query..'%'}
    end

    local mysqlQuery = "SELECT cs_id, name, description FROM snipe_evidence_crimescenes " .. queryCondition
    mysqlQuery = mysqlQuery .. " LIMIT 5 OFFSET ?"
    table.insert(queryParams, offset)

    local result = MySQL.query.await(mysqlQuery, queryParams)
    for _, row in ipairs(result) do   
        local evidenceData = {
            cs_id = row.cs_id,
            name = row.name,
            description = row.description,
        }
        table.insert(evidenceCases, evidenceData)
    end

    local countQueryParams = {}
    if query ~= "" then
        countQueryParams = {'%'..query..'%', '%'..query..'%'}  
    end
    
    local totalCountQuery = "SELECT COUNT(*) as totalCount FROM snipe_evidence_crimescenes " .. queryCondition
    local totalCountResult = MySQL.query.await(totalCountQuery, countQueryParams)
    totalCount = totalCountResult[1].totalCount

    return { cases = evidenceCases, totalCount = totalCount }
end

function formatMetadata(metadata)
    local data = {
        ["Weapon Label"] = metadata.weaponlabel or nil,
        ["Label"] = metadata.label or nil,
        ["Fingerprint"] = metadata.fingerprint or nil,
        ["ID"] = metadata.id or nil
    }
    return data
end