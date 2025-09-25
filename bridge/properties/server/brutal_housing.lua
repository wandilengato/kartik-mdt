if (GetResourceState('brutal_housing') ~= "started") then return end

function fetchBrutalProperties(citizenId)
    local query = [[
        SELECT id, label, coords, address FROM brutal_housing WHERE owner = ?
    ]]

    local result = MySQL.query.await(query, { citizenId })
    local properties = {}
    for _, property in ipairs(result) do
        local coords = property.coords and json.decode(property.coords)
        local doorCoords = coords and coords.door and {
            x = coords.door.x,
            y = coords.door.y,
            z = coords.door.z
        }

        table.insert(properties, {
            id = property.id,
            name = property.label,
            address = property.address,
            coords = doorCoords,
        })
    end

    return properties
end