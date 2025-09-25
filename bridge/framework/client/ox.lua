if not detectCore('ox_core') then return end

local Ox = require '@ox_core.lib.init'
local player = Ox.GetPlayer()

PlayerData = {}
Jobs = {}

local function updatePlayerData()
    local activeGroup = player.get('activeGroup')
    if not activeGroup then return end
    local grade = player.getGroup(activeGroup)
    local group = GlobalState['group.' .. activeGroup]
    local bossLevel = (group and #group.grades) or 1
    PlayerData = {
        name = player.get('name'),
        phone = (GetPhoneNumber and GetPhoneNumber(player.stateId)) or player.get('phoneNumber'),
        gender = player.get('gender'),
        citizenid = player.stateId,
        jobData = {
            name = group and group.name,
            label = group and group.label,
            grade = {
                name = (group and group.grades[grade].label) or ('Level ' .. grade),
                level = grade
            },
            isBoss = (bossLevel == grade),
            onDuty = false
        }
    }
end

local function getJobs()
    for _, jobCategories in pairs(Config.Jobs) do
        for _, jobName in pairs(jobCategories) do
            local jobData = GlobalState['group.' .. jobName]
            if jobData then
                local roles = {}
                for grade, data in pairs(jobData.grades) do
                    roles[grade] = { name = data.label }
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
    updatePlayerData()
    setupMDTData()
end)

RegisterNetEvent('ox:playerLoaded', function()
    Wait(1500)
    updatePlayerData()
    createZones()
    setupMDTData()
end)

RegisterNetEvent('ox:setGroup', function()
    updatePlayerData()
    setupMDTData()
end)

function getCurrentJob()
    if not PlayerData or not PlayerData.jobData then return false end
    return {
        job = PlayerData.jobData.name,
        jobLabel = PlayerData.jobData.jobLabel
    }
end

function getCurrentJobRank()
    if not PlayerData or not PlayerData.jobData then return false end
    return {
        rankLabel = PlayerData.jobData.grade.name or '',
        rank = PlayerData.jobData.grade.level
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
    local displayName = Ox.GetVehicleData(hash)?.name
    if not displayName then return GetDisplayNameFromVehicleModel(hash) end
    return displayName
end

function getWeaponDisplayName(hash)
    return (getItemName and getItemName(hash)) or hash
end

RegisterNetEvent('kartik-mdt:client:updatePlayerDuty', function()
    PlayerData.jobData.onDuty = not PlayerData.jobData.onDuty
    ToggleDuty(PlayerData.jobData.onDuty)
end)

player.on('activeGroup', function(data)
    if Config.Permissions[data.name] then
        ToggleDuty(true)
    end
end)

CreateThread(function()
    getJobs()
end)
