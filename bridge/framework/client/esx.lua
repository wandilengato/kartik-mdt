if not detectCore('es_extended') then return end

PlayerData = {}
Jobs = {}

local function updatePlayerData(data)
    if not data or not next(data) then return false end
    PlayerData = {
        name = data.firstName .. " " .. data.lastName,
        phone = (GetPhoneNumber and GetPhoneNumber(data.identifier)) or "0000000000",
        gender = data.gender == 1 and "Female" or "Male",
        citizenid = data.identifier,
        jobData = {
            name = data.job.name,
            label = data.job.label,
            grade = {
                name = data.job.grade_name,
                level = data.job.grade
            },
            isBoss = data.job.isBoss or false,
            onDuty = data.job.onduty
        }
    }
end

local function getJobs()
    local response = lib.callback.await("kartik-mdt:server:getESXFrameworkJobs", false)
    if response then
        Jobs = response
    end
end

CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(1000)
    end
    updatePlayerData(ESX.GetPlayerData())
    setupMDTData()
end)

RegisterNetEvent('esx:playerLoaded', function()
    Wait(1500)
    updatePlayerData(ESX.GetPlayerData())
    createZones()
    setupMDTData()
end)

RegisterNetEvent('esx:setJob', function(job, lastJob)
    Wait(2500)
    updatePlayerData(ESX.GetPlayerData())
    setupMDTData()
end)

function getCurrentJob()
    if not PlayerData or not PlayerData.jobData then return false end
    local job = PlayerData.jobData
    return {
        job = job.name,
        jobLabel = job.label,
    }
end

function getCurrentJobRank()
    if not PlayerData then return false end
    local job = PlayerData.jobData.grade
    return {
        rankLabel = job.name,
        rank = job.level,
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
    return GetDisplayNameFromVehicleModel(hash)
end

function getWeaponDisplayName(hash)
    local displayName = ESX.GetWeaponLabel(hash)
    return displayName or hash
end

RegisterNetEvent('kartik-mdt:client:updatePlayerDuty', function()
    PlayerData.jobData.onDuty = not PlayerData.jobData.onDuty 
    ToggleDuty(PlayerData.jobData.onDuty)
end)

CreateThread(function()
    Wait(10000)
    getJobs()
end)