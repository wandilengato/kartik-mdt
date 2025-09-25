if not detectCore('qbx_core') then return end

local function formatPlayerData(PlayerData)
    if not PlayerData or not next(PlayerData) then return false end
    return {
        source = PlayerData.source,
        citizenId = PlayerData.citizenid,
        firstName = PlayerData.charinfo.firstname,
        lastName =  PlayerData.charinfo.lastname,
        name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname,
        phone = (GetPhoneNumber and GetPhoneNumber(PlayerData.citizenid, PlayerData.source)) or PlayerData.charinfo.phone,
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
    return exports["qbx_core"]:SetJob(citizenId, department, rank)
end

function removeBankMoney(citizenId, amount)
    local player = exports["qbx_core"]:GetPlayerByCitizenId(citizenId)
    if player then
        player.Functions.RemoveMoney('bank', amount)
        return true
    else
        return false
    end    
end

function getWeaponDisplayName(hash)
    local displayName = exports.qbx_core:GetWeapons(hash)?.label
    return displayName or (getItemName and getItemName(hash)) or hash
end

function setMetadata(citizenId, metadata, value)
    return exports["qbx_core"]:SetMetadata(citizenId, metadata, value)
end

function GetPlayerByCitizenId(citizenid)
    local player = exports.qbx_core:GetPlayerByCitizenId(citizenid)
    if not player then return false end
    return formatPlayerData(player.PlayerData)
end

function GetOfflinePlayerByCitizenId(citizenid)
    local player = exports.qbx_core:GetOfflinePlayer(citizenid)
    if not player then return false end
    return formatPlayerData(player.PlayerData)
end

function GetPlayerData(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return false end
    return formatPlayerData(player.PlayerData)
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
            UpdateBridgeLicense(citizenId, licenseType, Status, player.source )
        end
        return setMetadata(citizenId, 'licences', licenseTable)
    else
        local offlinePlayer = GetOfflinePlayerByCitizenId(citizenId)
        if not offlinePlayer then
            return
        end
        local result = MySQL.single.await('SELECT metadata FROM players WHERE citizenid = ?', { citizenId })
        if not result then return end
        local metadata = json.decode(result.metadata)
        local licenseTable = metadata.licences
        licenseTable[licenseType] = Status
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
    local player = exports.qbx_core:GetPlayerByCitizenId(citizenId)
    if player then
        local PlayerData = player.PlayerData
        if PlayerData and PlayerData.charinfo then
            PlayerData.charinfo.firstname = firstName
            PlayerData.charinfo.lastname = lastName
            player.Functions.SetPlayerData('charinfo', PlayerData.charinfo)
            return true
        end
        return false
    end
    local result = MySQL.single.await('SELECT charinfo FROM players WHERE citizenid = ?', { citizenId })
    if result and result.charinfo then
        local success, charInfo = pcall(json.decode, result.charinfo)
        if not success or type(charInfo) ~= "table" then return false end

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

