if (GetResourceState('nolag_properties') ~= "started") then return end

function fetchNolagProperties(citizenId)
    local properties = {}
    local result = exports.nolag_properties:GetAllProperties(citizenId, 'user')
    if not result then return properties end

    for _, v in pairs(result) do
        if v then
            local coords = v.coords
            table.insert(properties, {
                id = v.id,
                name = v.label,
                coords = coords and vec3(coords.x, coords.y, coords.z),
            })
        end
    end
    return properties
end
