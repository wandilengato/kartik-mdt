if (GetResourceState('bnl-housing') ~= "started") then return end

function fetchBNLProperties(citizenId)
    local query = [[
        SELECT 
            p.id AS property_id,
            p.street_name AS label,
            p.entrance_location AS door_data
        FROM properties p
        JOIN property_key pk ON pk.property_id = p.id
        WHERE pk.player = ? AND pk.permission = 'owner' OR pk.player = ? AND pk.permission IN ('owner', 'member', 'renter')
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
