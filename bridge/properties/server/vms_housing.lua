if (GetResourceState('vms_housing') ~= "started") then return end

function fetchVMSProperties(citizenId)
    local properties = {}
    local result = exports['vms_housing']:GetPlayerProperties(citizenId)
    if not result then return properties end

    for _, property in pairs(result) do
        local coords = nil
        if property.metadata and property.metadata.enter then
            coords = {
                x = property.metadata.enter.x,
                y = property.metadata.enter.y,
                z = property.metadata.enter.z
            }
        end

        table.insert(properties, {
            id = property.id,
            name = property.name,
            address = property.address,
            coords = coords
        })
    end

    return properties
end