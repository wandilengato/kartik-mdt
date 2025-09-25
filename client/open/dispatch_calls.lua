inNoDispatchZone = false
timer = {}

function WaitTimer(name, action, ...)
    if not Config.Alerts[name] then return end

    if not timer[name] then
        timer[name] = true
        action(...)
        Wait(10000)
        timer[name] = false
    end
end

function isPedAWitness(witnesses, ped)
    for k, v in pairs(witnesses) do
        if v == ped then
            return true
        end
    end
    return false
end

function disableAlerts(disable)
    if disable then
        inNoDispatchZone = true
    else
        inNoDispatchZone = false
    end
end

exports('disableAlerts', disableAlerts)

function BlacklistedWeapon(ped)
	for i = 1, #Config.WeaponWhitelist do
		local weaponHash = joaat(Config.WeaponWhitelist[i])
		if GetSelectedPedWeapon(ped) == weaponHash then
			return true -- Is a whitelisted weapon
		end
	end
	return false -- Is not a whitelisted weapon
end

function createZones()
    for k, v in pairs(Config.inNoDispatchZone) do
        local box = lib.zones.box({
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = false,
            inside = inside,
            onEnter = function()
                inNoDispatchZone = true
            end,
            onExit = function()
                inNoDispatchZone = false
            end,
        })
    end

end

AddEventHandler('CEventGunShot', function(witnesses, ped)
    if IsPedCurrentWeaponSilenced(cache.ped) then return end
    if inNoDispatchZone then return end
    if BlacklistedWeapon(cache.ped) then return end

    WaitTimer('Shooting', function()
        if cache.ped ~= ped then return end 
     
        if not shouldTriggerNotification() then return end

        if witnesses and not isPedAWitness(witnesses, ped) then return end
        if cache.vehicle then
            VehicleShooting()
        else
            Shooting()
        end
    end)
end)

AddEventHandler('CEventShockingSeenMeleeAction', function(witnesses, ped)
    WaitTimer('Melee', function()
        if cache.ped ~= ped then return end
        if witnesses and not isPedAWitness(witnesses, ped) then return end
        if not IsPedInMeleeCombat(ped) then return end

        Fight()
    end)
end)

AddEventHandler('CEventPedJackingMyVehicle', function(_, ped)
    WaitTimer('Autotheft', function()
        if cache.ped ~= ped then return end
        local vehicle = GetVehiclePedIsUsing(ped, true)
        CarJacking(vehicle)
    end)
end)

AddEventHandler('CEventShockingCarAlarm', function(_, ped)
    WaitTimer('Autotheft', function()
        if cache.ped ~= ped then return end
        local vehicle = GetVehiclePedIsUsing(ped, true)
        VehicleTheft(vehicle)
    end)
end)

AddEventHandler('CEventExplosionHeard', function(witnesses, ped)
    if witnesses and not isPedAWitness(witnesses, ped) then return end
    WaitTimer('Explosion', function()
        Explosion()
    end)
end)

AddEventHandler('gameEventTriggered', function(name, args)
    if name ~= 'CEventNetworkEntityDamage' then return end
    local victim = args[1]
    local isDead = args[6] == 1
    if not victim or victim ~= cache.ped then return end
    if not isDead then return end
    forceCloseUI()
    WaitTimer('PlayerDowned', function()
        local department = getDepartmentCategory(getCurrentJob().job)
        if department == 'police' then
            OfficerDown()
        elseif department == 'ems' then
            EmsDown()
        else
            InjuriedPerson()
        end
    end)
end)

SpeedTrigger = 0

AddEventHandler('CEventShockingCarChase', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end
    
        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingDrivingOnPavement', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingBicycleOnPavement', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingMadDriverBicycle', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingMadDriverExtreme', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end
        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingEngineRevved', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

AddEventHandler('CEventShockingInDangerousVehicle', function(witnesses, ped)
    WaitTimer('Speeding', function()
        local currentTime = GetGameTimer()
        if currentTime - SpeedTrigger < 10000 then
            return
        end
        if cache.ped ~= ped then return end
        if not shouldTriggerNotification() then return end

        local vehicleClass = GetVehicleClass(cache.vehicle)
        if Config.SpeedCamClassBlacklist[vehicleClass] then return end

        if GetEntitySpeed(cache.vehicle) * 3.6 < (Config.SpeedingConfig.minSpeed + math.random(0, 20)) then return end

        if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

        SpeedingVehicle()
        SpeedTrigger = GetGameTimer()
    end)
end)

