if not Config.Alerts['Speedcam'] then return end

CreateThread(function()
    for radarId, data in pairs(Config.SpeedCams) do
        lib.zones.poly({
            points = data.points,
            thickness = data.thickness,
            onEnter = function()
                WaitTimer('Speedcam', function()
                    if not cache.vehicle then return end
                    if cache.seat ~= -1 then return end
                    local class = GetVehicleClass(cache.vehicle)
                    if not shouldTriggerNotification() then return end
                    if Config.SpeedCamClassBlacklist[class] then return end
                    if math.random(1, 100) > Config.SpeedCamAlertChance then return end
                    local vehSpeed = math.ceil(GetEntitySpeed(cache.vehicle) * 2.23694)
                    if vehSpeed > data.speed then
                        if data.flash then SetFlash(0, 0, 80, 500, 80) end
                        exports['kartik-mdt']:SpeedingVehicle(cache.vehicle)
                    end
                end)                
            end
        })
    end
end)
