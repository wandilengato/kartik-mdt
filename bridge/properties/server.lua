local propertyScripts = {
    ['bcs_housing'] = function(citizenId)
        return fetchBCSProperties and fetchBCSProperties(citizenId) or {}
    end,
    ['bnl-housing'] = function(citizenId)
        return fetchBNLProperties and fetchBNLProperties(citizenId) or {}
    end,
    ['nolag_properties'] = function(citizenId)
        return fetchNolagProperties and fetchNolagProperties(citizenId) or {}
    end,
    ['origen_housing'] = function(citizenId)
        return fetchOrigenProperties and fetchOrigenProperties(citizenId) or {}
    end,
    ['ps-housing'] = function(citizenId)
        return fetchPSProperties and fetchPSProperties(citizenId) or {}
    end,
    ['qb-houses'] = function(citizenId)
        return fetchQBProperties and fetchQBProperties(citizenId) or {}
    end,
    ['qbx_properties'] = function(citizenId)
        return fetchQBXProperties and fetchQBXProperties(citizenId) or {}
    end,
    ['qs-housing'] = function(citizenId)
        return fetchQSProperties and fetchQSProperties(citizenId) or {}
    end,
    ['sn_properties'] = function(citizenId)
        return fetchSNProperties and fetchSNProperties(citizenId) or {}
    end,
    ['tk_housing'] = function(citizenId)
        return fetchTKProperties and fetchTKProperties(citizenId) or {}
    end,
    ['brutal_housing'] = function(citizenId)
        return fetchBrutalProperties and fetchBrutalProperties(citizenId) or {}
    end,
    ['tgiann-house'] = function(citizenId)
        return fetchTgiannProperties and fetchTgiannProperties(citizenId) or {}
    end,
    ['vms_housing'] = function(citizenId)
        return fetchVMSProperties and fetchVMSProperties(citizenId) or {}
    end,
}

function fetchCitizenProperties(citizenId)
    local allProperties = {}

    for scriptName, fetchFunction in pairs(propertyScripts) do
        local success, properties = pcall(fetchFunction, citizenId)
        if success and properties then
            for _, property in ipairs(properties) do
                table.insert(allProperties, property)
            end
        end
    end

    return allProperties
end
