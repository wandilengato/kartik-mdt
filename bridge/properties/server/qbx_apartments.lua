if (GetResourceState('qbx_apartments') ~= "started") then return end

function fetchQBXProperties(citizenId)
    local query = [[
        SELECT id, name, label FROM apartments WHERE citizenid = ?
    ]]

    local result = MySQL.query.await(query, { citizenId })
    local properties = {}
    for _, property in ipairs(result) do
        local coords = property.coords and json.decode(property.coords)
        table.insert(properties, {
            id = property.id,
            name = property.name,
            address = property.label,
        })
    end

    return properties
end
