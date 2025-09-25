if not detectCore('ox_core') then return end

local Ox = require '@ox_core.lib.init'

local function formatPlayerData(player)
    local activeGroup = player.get('activeGroup')
     if not activeGroup then return end
    local grade = player.getGroup(activeGroup)
    local group = GlobalState['group.' .. activeGroup]
    local bossLevel = (group and #group.grades) or 1
    return {
        source = player.source,
        citizenId = player.stateId,
        firstName = player.get('firstName'),
        lastName =  player.get('lastName'),
        name = player.get('name'),
        phone = (GetPhoneNumber and GetPhoneNumber(player.stateId, player.source)) or player.get('phoneNumber'),
        licences = player.getLicenses(), ---@TODO Check licenses format (Ref: https://coxdocs.dev/ox_core/Classes/Server/OxPlayer#oxplayergetlicenses)
        jobData = {
            name = group and group.name,
            label = group and group.label,
            grade = {
                name = (group and group.grades[grade].label) or ('Level '..grade),
                level = grade
            },
            isBoss = (bossLevel == grade)
        }
    }
end

function setJob(citizenId, department, rank)
    local player = GetPlayerByCitizenId(citizenId) or GetOfflinePlayerByCitizenId(citizenId)
    if not player then return false end
    return player.setGroup(department, rank)
end

function removeBankMoney(citizenId, amount)
    local player = GetPlayerByCitizenId(citizenId)
    if not player then return false end
    local account = player.getAccount()
    local result = account.removeBalance({ amount = amount, overdraw = false })
    return result and result.success
end

function getWeaponDisplayName(hash)
    return (getItemName and getItemName(hash)) or hash
end

function GetPlayerByCitizenId(citizenid)
    local player = Ox.GetPlayerFromFilter({ stateId = citizenid })
    if not player then return false end
    return formatPlayerData(player)
end

function GetOfflinePlayerByCitizenId(citizenid)
    local player = Ox.GetPlayerFromFilter({ stateId = citizenid })
    if not player then return false end
    return formatPlayerData(player)
end

function GetPlayerData(source)
    local player = Ox.GetPlayer(source)
    if not player then return false end
    return formatPlayerData(player)
end

function UpdateLicense(citizenId, licenseType, Status)
    local player = Ox.GetPlayerFromFilter({ stateId = citizenId })
    if not player then return end
    if not GlobalState['license.'..licenseType] then return false end
    local value = (Status == "approved") and 1 or 0
    if player.getLicense(licenseType) then
        return player.updateLicense(licenseType, 'issued', value)
    else
        return player.addLicense(licenseType)
    end
end

function SetPlayerName(citizenId, firstName, lastName)
    if not citizenId or not firstName or not lastName then return false end
    local player = Ox.GetPlayerFromFilter({ stateId = citizenId })
    if player then
        player.set('name', firstName .. " " .. lastName, true);
        player.set('firstName', firstName, true);
        player.set('lastName', lastName, true);
        return true
    end
    local result = MySQL.single.await('SELECT firstName, lastName FROM characters WHERE stateId = ?', { citizenId })
    if result and result.firstName and result.lastName then
        result.firstName = firstName
        result.lastName = lastName
        local update = MySQL.update.await('UPDATE characters SET firstName = ?, lastName = ? WHERE stateId = ?', {firstName, lastName, citizenId})
        return update and update > 0
    end

    return false
end