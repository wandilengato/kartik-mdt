if (GetResourceState('ox_target') ~= "started") then
    return
end

local Target = exports["ox_target"]

if Config.Evidence then
    for k, v in pairs(Config.Evidence) do
        Target:addBoxZone({
            name = "evidence" .. k,
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = false,
            options = {{
                icon = "fa-solid fa-database",
                label = "Evidence Locker Room",
                onSelect = function()
                    openEvidenceLocker()
                end,
                canInteract = function(entity, distance, coords, name)
                    return HasJobAuth(v.group)
                end
            }}
        })
    end
end

if Config.BodycamLocations then
    for k, v in pairs(Config.BodycamLocations) do
        Target:addBoxZone({
            name = "bodycam" .. k,
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = false,
            options = {{
                icon = "fa-solid fa-database",
                label = "Bodycam list",
                onSelect = function()
                    openBodycamList()
                end,
                canInteract = function(entity, distance, coords, name)
                    return HasJobAuth(v.group)
                end
            }}
        })
    end
end

CreateThread(function()
    for i, loc in pairs(Config.Mugshot.Locations) do
        Target:addBoxZone({
            name = "mugshot_" .. i,
            coords = loc.TargetCoords,
            size = loc.size,
            rotation = loc.rotation,
            debug = false,
            options = {{
                icon = "fa-solid fa-clipboard-list",
                label = "Take Shot",
                onSelect = function()
                    openMugshot(i)
                end,
                canInteract = function(entity, distance, coords, name)
                    return HasJobAuth(loc.group)
                end
            }}
        })
    end
end)

if Config.CivilianMDTLocations then
    for k, v in pairs(Config.CivilianMDTLocations) do
        Target:addBoxZone({
            name = "civilian_mdt" .. k,
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = false,
            options = {{
                icon = "fa-solid fa-database",
                label = "Access Civilian MDT",
                onSelect = function()
                    openCivilianMDT()
                end,
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }}
        })
    end
end