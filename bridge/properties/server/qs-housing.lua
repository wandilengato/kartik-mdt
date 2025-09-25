if (GetResourceState('qs-housing') ~= "started") then return end

function fetchQSProperties(citizenId)
    local query = [[
        SELECT 
            hl.id AS id,
            hl.label AS label,
            hl.coords AS coords
        FROM player_houses ph
        JOIN houselocations hl ON ph.house = hl.name
        WHERE ph.citizenid = ?;
    ]]

    local result = MySQL.query.await(query, { citizenId })
    local properties = {}
    for _, property in ipairs(result) do
        local rawCoords = property.coords and json.decode(property.coords)
        local enter = rawCoords and rawCoords.enter
        table.insert(properties, {
            id = property.id,
            name = property.label,
            coords = enter and vec3(enter.x, enter.y, enter.z) or nil,
        })
    end

    return properties
end
