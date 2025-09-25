if (GetResourceState('qbx_properties') ~= "started") then return end

function fetchQBXProperties(citizenId)
    local query = [[
        SELECT id, property_name, coords FROM properties WHERE owner = ?
    ]]

    local result = MySQL.query.await(query, { citizenId })
    local properties = {}
    for _, property in ipairs(result) do
        local coords = property.coords and json.decode(property.coords)
        table.insert(properties, {
            id = property.id,
            name = property.property_name,
            coords = coords and vec3(coords.x, coords.y, coords.z),
        })
    end

    return properties
end
