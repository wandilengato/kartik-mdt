if (GetResourceState('bcs_housing') ~= "started") then return end

function fetchBCSProperties(citizenId)
    local properties = exports.bcs_housing:GetOwnedHomeKeys(citizenId)
    local houses = {}
    for i, property in pairs(properties) do
        local coords = property.complex == 'Flat' and property.data.flat.coords or property.entry
        table.insert(houses, {
            id = property.id or i,
            label = property.name,
            coords = coords and vec3(coords.x, coords.y, coords.z),
        })
    end
    return houses
end