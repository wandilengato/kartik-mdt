if not detectCore('qbx_core') then return end

PlayerData = {}
Jobs = {}


local function updatePlayerData(data)
    if not data or not next(data) then return false end
    PlayerData = {
        name = data.charinfo.firstname .. " " .. data.charinfo.lastname,
        phone = (GetPhoneNumber and GetPhoneNumber(data.citizenid)) or data.charinfo.phone,
        gender = data.charinfo.gender == 1 and "Female" or "Male",
        citizenid = data.citizenid,
        jobData = {
            name = data.job.name,
            label = data.job.label,
            grade = {
                name = data.job.grade.name,
                level = data.job.grade.level
            },
            isBoss = data.job.isBoss,
            onDuty = data.job.onduty
        }
    }
end

local function getJobs()
    local sharedJobs = exports.qbx_core:GetJobs()
    for _, jobCategories in pairs(Config.Jobs) do
        for _, jobName in pairs(jobCategories) do
            local jobData = sharedJobs[jobName]
            if jobData then
                local roles = {}
                for grade, data in pairs(jobData.grades) do
                    roles[grade] = { name = data.name }
                end
                Jobs[jobName] = {
                    id = jobName,
                    label = jobData.label,
                    roles = roles
                }
            end
        end
    end
end

CreateThread(function()
    updatePlayerData(QBX.PlayerData)
    setupMDTData()
    createZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1500)
    updatePlayerData(QBX.PlayerData)
    createZones()
    setupMDTData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    updatePlayerData(QBX.PlayerData)
    setupMDTData()
end)

function getCurrentJob()
    if not PlayerData or not PlayerData.jobData then return false end
    local job = PlayerData.jobData
    return {
        job = job.name,
        jobLabel = job.label
    }
end

function getCurrentJobRank()
    if not PlayerData then return false end
    local job = PlayerData.jobData.grade
    return {
        rankLabel = job.name,
        rank = job.level
    }
end

function hasManagePermission()
    if not PlayerData then return false end
    local job = getCurrentJob().job
    local permissions = Config.Permissions[job]
    return permissions 
        and permissions['management_rank'] 
        and getCurrentJobRank().rank >= permissions['management_rank']
end

function getVehicleDisplayName(hash)
    local displayName = exports.qbx_core:GetVehiclesByHash(hash)?.name
    if not displayName then return GetDisplayNameFromVehicleModel(hash) end
    return displayName
end

function getWeaponDisplayName(hash)
    local displayName = exports.qbx_core:GetWeapons(hash)?.label
    return displayName or "Unknown Weapon"
end

RegisterNetEvent('kartik-mdt:client:updatePlayerDuty', function()
    TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(state)
    local jobData = getCurrentJob()
    if not jobData then return end
    if Config.Permissions[jobData.job] then
        PlayerData.jobData.onDuty = state -- To sync MDT and QBCore Duty
        ToggleDuty(state)
    end
end)

CreateThread(function()
    getJobs()
end)