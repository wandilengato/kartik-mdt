if (GetResourceState('qb-houses') ~= "started") then return end

function fetchQBProperties(citizenId)
    -- local query = [[
    --     SELECT 
    --         hl.id AS house_id,
    --         hl.label,
    --         hl.coords
    --     FROM player_houses ph
    --     JOIN houselocations hl ON ph.house = hl.name
    --     WHERE ph.citizenid = ?;
    -- ]]
    local query = [[
        (
            SELECT 
                hl.id AS id,
                hl.label AS label,
                hl.coords AS coords
            FROM player_houses ph
            JOIN houselocations hl ON ph.house = hl.name
            WHERE ph.citizenid = ?
        )
        UNION ALL
        (
            SELECT 
                a.id AS id,
                a.label AS label,
                NULL AS coords
            FROM apartments a
            WHERE a.citizenid = ?
        );
    ]]

    local result = MySQL.query.await(query, { citizenId, citizenId })
    local properties = {}
    for _, property in ipairs(result) do
        local coords = property.coords and json.decode(property.coords)
        table.insert(properties, {
            id = property.id,
            name = property.label,
            coords = coords and vec3(coords.x, coords.y, coords.z),
        })
    end

    return properties
end
