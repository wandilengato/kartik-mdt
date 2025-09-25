if not detectCore('qb-core') then return end

QBCore = exports["qb-core"]:GetCoreObject()

local function formatPlayerData(PlayerData)
    if not PlayerData or not next(PlayerData) then return false end
    return {
        source = PlayerData.source,
        citizenId = PlayerData.citizenid,
        firstName = PlayerData.charinfo.firstname,
        lastName =  PlayerData.charinfo.lastname,
        name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname,
        phone = (GetPhoneNumber and GetPhoneNumber(PlayerData.citizenid, PlayerData.source)) or PlayerData.charinfo.phone,
        metadata = PlayerData.metadata,
        licences = PlayerData.metadata.licences,
        jobData = {
            name = PlayerData.job.name,
            label = PlayerData.job.label,
            grade = {
                name = PlayerData.job.grade.name,
                level = PlayerData.job.grade.level
            },
            isBoss = PlayerData.job.isBoss
        }
    }
end

function setJob(citizenId, department, rank)
    local player = QBCore.Functions.GetPlayerByCitizenId(citizenId)
    if player then
        player.Functions.SetJob(department, tonumber(rank))
    end

    local sharedJobData = QBCore.Shared.Jobs[department]
    if not sharedJobData then
        return
    end

    local sharedGradeData = sharedJobData.grades[rank]
    if not sharedGradeData then
        return
    end

    return MySQL.update.await("update players set job = @jobData where citizenid = @citizenid", {
        jobData = json.encode({
            label = sharedJobData.label,
            name = department,
            isboss = sharedGradeData.isboss or false,
            onduty = sharedJobData.defaultDuty,
            payment = sharedGradeData.payment,
            grade = {
                name = sharedGradeData.name,
                level = rank
            }
        }),
        citizenid = citizenId
    })
end

function setMetadata(citizenId, licenseTable)
    local player = QBCore.Functions.GetPlayerByCitizenId(citizenId)
    if player then
        return player.Functions.SetMetaData('licences', licenseTable)
    end
end

function removeBankMoney(citizenId, amount)
    local player = QBCore.Functions.GetPlayerByCitizenId(citizenId)
    if player then
        player.Functions.RemoveMoney('bank', amount)
        return true
    else
        return false
    end
end

function GetPlayerByCitizenId(citizenid)
    local player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    if not player then
        return false
    end
    return formatPlayerData(player.PlayerData)
end

function GetOfflinePlayerByCitizenId(citizenid)
    local player = QBCore.Functions.GetOfflinePlayerByCitizenId(citizenid)
    if not player then
        return false
    end
    return formatPlayerData(player.PlayerData)
end

function GetPlayerData(source)
    local player = QBCore.Functions.GetPlayer(source)
    if not player then
        return false
    end
    return formatPlayerData(player.PlayerData)
end

function getWeaponDisplayName(hash)
    local displayName = QBCore.Shared.Weapons[hash]?.label
    return displayName or (getItemName and getItemName(hash)) or hash
end

function UpdateLicense(citizenId, licenseType, Status)
    if Status == "approved" then
        Status = true
    else
        Status = false
    end
    local player = GetPlayerByCitizenId(citizenId)
    if player then
        local licenseTable = player.licences
        licenseTable[licenseType] = Status
        if UpdateBridgeLicense then
            UpdateBridgeLicense(citizenId, licenseType, Status, player.source)
        end
        return setMetadata(citizenId, licenseTable)
    else
        local offlinePlayer = GetOfflinePlayerByCitizenId(citizenId)
        if not offlinePlayer then
            return
        end
        local metadata = offlinePlayer.metadata
        local licenseTable = offlinePlayer.licences
        licenseTable[licenseType] = Status
        metadata.licences = licenseTable
        local metadataJson = json.encode(metadata)
        if UpdateBridgeLicense then
            UpdateBridgeLicense(citizenId, licenseType, Status, false)
        end
        return MySQL.update.await("UPDATE players SET metadata = ? WHERE citizenid = ?", {
            metadataJson,
            citizenId
        })
    end
end

function SetPlayerName(citizenId, firstName, lastName)
    if not citizenId or not firstName or not lastName then return false end
    local player = QBCore.Functions.GetPlayerByCitizenId(citizenId)
    if player then
        local charInfo = player.PlayerData?.charinfo
        if charInfo then
            charInfo.firstname = firstName
            charInfo.lastname = lastName
            player.Functions.SetPlayerData('charinfo', charInfo)
            return true
        end
        return false
    end
    local result = MySQL.single.await('SELECT charinfo FROM players WHERE citizenid = ?', { citizenId })
    if result and result.charinfo then
        local charInfo = json.decode(result.charinfo)
        if type(charInfo) ~= "table" then return false end
        charInfo.firstname = firstName
        charInfo.lastname = lastName
        local update = MySQL.update.await('UPDATE players SET charinfo = ? WHERE citizenid = ?', {
            json.encode(charInfo),
            citizenId
        })
        return update and update > 0
    end

    return false
end