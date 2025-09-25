if (GetResourceState('tgiann-house') ~= "started") then return end

function fetchTgiannProperties(citizenId)
    local query = [[
        SELECT 
            name AS label
        FROM tgiann_house
        WHERE owner = ?;
    ]]

    local result = MySQL.query.await(query, { citizenId })
    local properties = {}
    for index, property in ipairs(result) do
        table.insert(properties, {
            id = index,
            name = property.label
        })
    end
    return properties
end