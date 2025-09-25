if (GetResourceState('origen_housing') ~= "started") then return end

function fetchOrigenProperties(citizenId)
    local properties = {}
    local result = exports.origen_housing:getOwnedHouses(citizenId)
    if not result then return properties end

    for _, propertyId in pairs(result) do
        local property = exports.origen_housing:getHouse(propertyId)
        if property then
            local coords = property.positions.entry or property.positions.garage
            table.insert(properties, {
                id = property.id,
                name = property.name,
                coords = vec3(coords.x, coords.y, coords.z),
            })
        end
    end

    return properties
end
