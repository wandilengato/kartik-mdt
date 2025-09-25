if not detectCore('es_extended') then
    return
end

local function formatPlayerData(PlayerData)
    if not PlayerData or not next(PlayerData) then
        return false
    end
    return {
        source = PlayerData.source,
        citizenId = PlayerData.identifier,
        firstName = PlayerData.variables.firstName,
        lastName = PlayerData.variables.lastName,
        name = PlayerData.variables.firstName .. " " .. (PlayerData.variables.lastName or ""),
        phone = (GetPhoneNumber and GetPhoneNumber(PlayerData.identifier, PlayerData.source)) or "0000000000",
        metadata = PlayerData.metadata,
        licences = PlayerData.metadata.licences,
        jobData = {
            name = PlayerData.job.name,
            label = PlayerData.job.label,
            grade = {
                name = PlayerData.job.grade_name,
                level = PlayerData.job.grade
            },
            isBoss = PlayerData.job.isBoss or false
        }
    }
end

function setJob(citizenId, department, rank)
    local player = ESX.GetPlayerFromIdentifier(citizenId)
    if player then
        player.setJob(department, rank, true)
    end

    local sharedJobData = Jobs[department]
    if not sharedJobData then
        return
    end
    local sharedGradeData = sharedJobData.roles[rank]
    if not sharedGradeData then
        return
    end
    return MySQL.update.await("update users set job = @job, job_grade = @job_grade where identifier = @citizenid", {
        job = department,
        job_grade = rank,
        citizenid = citizenId
    })
end

function removeBankMoney(citizenId, amount)
    local player = ESX.GetPlayerFromIdentifier(citizenId)
    if player then
        player.removeAccountMoney('bank', amount)
        return true
    else
        return false
    end
end

function GetPlayerByCitizenId(citizenid)
    local player = ESX.GetPlayerFromIdentifier(citizenid)
    if not player then
        return false
    end
    return formatPlayerData(player)
end

function GetOfflinePlayerByCitizenId(citizenid)
    local player = ESX.GetPlayerFromIdentifier(citizenid)
    if not player then
        return false
    end
    return formatPlayerData(player)
end

function GetPlayerData(source)
    local player = ESX.GetPlayerFromId(source)
    if not player then
        return false
    end
    return formatPlayerData(player)
end

function UpdateLicense(citizenId, licenseType, Status)
    if Status == "approved" then
        MySQL.insert('INSERT INTO user_licenses (type, owner) VALUES (?, ?)', {licenseType, citizenId},
            function(rowsChanged)
                if rowsChanged then
                    return true
                end
            end)
    else
        MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ?', {licenseType, citizenId}, function(rowsChanged)
            if rowsChanged then
                return true
            end
        end)
    end
end

function getWeaponDisplayName(hash)
    local displayName = ESX.GetWeaponLabel(hash)
    return displayName or (getItemName and getItemName(hash)) or hash
end

lib.callback.register("kartik-mdt:server:getESXFrameworkJobs", function(source, citizenId)
    if Jobs then
        return Jobs
    else
        return {}
    end
end)

function GetJobs()
    local sharedJobs = ESX.GetJobs()
    if not sharedJobs then
        return
    end
    for _, jobCategories in pairs(Config.Jobs) do
        for _, jobName in pairs(jobCategories) do
            local jobData = sharedJobs[jobName]
            if jobData and jobData.grades then
                local roles = {}
                for grade, data in pairs(jobData.grades) do
                    roles[grade] = {
                        name = data.name
                    }
                end
                Jobs[jobName] = {
                    id = jobName,
                    label = jobData.label or jobName,
                    roles = roles
                }
            end
        end
    end
    return Jobs
end

function SetPlayerName(identifier, firstName, lastName)
    if not identifier or not firstName or not lastName then return false end

    local player = ESX.GetPlayerFromIdentifier(identifier)
    if player then
        player.set('firstName', firstName)
        player.set('lastName', lastName)
        MySQL.update.await('UPDATE users SET firstname = ?, lastname = ? WHERE identifier = ?', {
            firstName,
            lastName,
            identifier
        })
        return true
    else
        local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { identifier })
        if result then
            local update = MySQL.update.await('UPDATE users SET firstname = ?, lastname = ? WHERE identifier = ?', {
                firstName,
                lastName,
                identifier
            })
            return update and update > 0
        end
    end
    return false
end

CreateThread(function()
    Wait(6000)
    GetJobs()
end)