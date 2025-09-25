if (GetResourceState('tk_housing') ~= "started") then return end

function fetchTKProperties(citizenId)
    local properties = {}
    local result = exports.tk_housing:getPropertiesByIdentifier(citizenId)
    if not result then return properties end

    for _, property in pairs(result) do
        table.insert(properties, {
            id = property.id,
            name = property.name or property.address,
            coords = nil, -- property.coords and json.decode(property.coords),
        })
    end

    return properties
end
