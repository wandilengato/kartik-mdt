if (GetResourceState('m-Insurance') ~= "started") then return end

function fetchHomeInsurance(citizenId)
    local query = [[
        SELECT 
            id,
            expire_date,
            owner_name
        FROM 
            m_insurance_home
        WHERE
            citizenid = @citizenId
    ]]

    local result = MySQL.query.await(query, { citizenId = citizenId })
    local insurances = {}

    for _, row in ipairs(result) do
        table.insert(insurances, {
            id = row.id,
            type = "home",
            expiryDate = row.expire_date,
            ownerName = row.owner_name
        })
    end

    return insurances
end


function fetchHealthInsurance(citizenId)
    local query = [[
        SELECT 
            id,
            expire_date,
            owner_name
        FROM 
            m_insurance_health
        WHERE
            citizenid = @citizenId
    ]]

    local result = MySQL.query.await(query, { citizenId = citizenId })
    local insurances = {}

    for _, row in ipairs(result) do
        table.insert(insurances, {
            id = row.id,
            type = "health",
            expiryDate = row.expire_date,
            ownerName = row.owner_name
        })
    end

    return insurances
end


function fetchVehicleInsurance(citizenId)
    local query = [[
        SELECT 
            id,
            plate,
            model,
            expire_date,
            owner_name
        FROM 
            m_insurance_vehicles
        WHERE
            citizenid = @citizenId
    ]]

    local result = MySQL.query.await(query, { citizenId = citizenId })
    local insurances = {}

    for _, row in ipairs(result) do
        table.insert(insurances, {
            id = row.id,
            type = "vehicle",
            expiryDate = row.expire_date,
            ownerName = row.owner_name,
            plate = row.plate,
            model = row.model
        })
    end

    return insurances
end

function fetchVehicleRegistration(citizenId)
    local query = [[
        SELECT 
            id,
            plate,
            model,
            expire_date
        FROM 
            m_insurance_registration
        WHERE
            citizenid = @citizenId
    ]]

    local result = MySQL.query.await(query, { citizenId = citizenId })
    local insurances = {}

    for _, row in ipairs(result) do
        table.insert(insurances, {
            id = row.id,
            type = "vehicle_registration",
            expiryDate = row.expire_date,
            plate = row.plate,
            model = row.model
        })
    end

    return insurances
end
