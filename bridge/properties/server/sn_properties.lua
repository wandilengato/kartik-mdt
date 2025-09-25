if (GetResourceState('sn_properties') ~= "started") then return end

function fetchSNProperties(citizenId)
    local properties = {}
    local result = exports.sn_properties:getPlayerProperties(citizenId)
    if not result then return properties end

    for _, property in pairs(result) do
        table.insert(properties, {
            id = property.id,
            name = property.label,
            coords = property.coords and vec3(property.coords.x, property.coords.y, property.coords.z),
        })
    end

    return properties
end
