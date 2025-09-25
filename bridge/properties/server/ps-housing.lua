if (GetResourceState('ps-housing') ~= "started") then return end

function fetchPSProperties(citizenId)
    local query = [[
        SELECT 
            property_id AS id,
            street AS label,
            door_data AS coords
        FROM properties
        WHERE owner_citizenid = ?;
    ]]

    local result = MySQL.query.await(query, { citizenId })
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