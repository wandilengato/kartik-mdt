if (GetResourceState('qb-target') ~= "started") then
    return
end

local Target = exports["qb-target"]

if Config.Evidence then
    for k, v in pairs(Config.Evidence) do
        Target:AddBoxZone("evidence" .. k, vector3(v.coords.x, v.coords.y, v.coords.z), 1.5, 1.5, {
            name = "evidence" .. k,
            heading = 12.0,
            debugPoly = false,
            minZ = v.minZ,
            maxZ = v.maxZ
        }, {
            options = {{
                num = 1,
                type = "client",
                icon = 'fas fa-database',
                label = 'Evidence Locker Room',
                targeticon = 'fas fa-database',
                action = function(entity)
                    openEvidenceLocker()
                end,
                canInteract = function(entity, distance, data)
                    return HasJobAuth(v.group)
                end
            }},
            distance = 2.5
        })
    end
end

if Config.BodycamLocations then
    for k, v in pairs(Config.BodycamLocations) do
        Target:AddBoxZone("bodycam" .. k, vector3(v.coords.x, v.coords.y, v.coords.z), 1.5, 1.5, {
            name = "bodycam" .. k,
            heading = 12.0,
            debugPoly = false,
            minZ = v.minZ,
            maxZ = v.maxZ
        }, {
            options = {{
                num = 1,
                type = "client",
                icon = 'fas fa-database',
                label = 'Bodycam List',
                targeticon = 'fas fa-database',
                action = function(entity)
                    openBodycamList()
                end,
                canInteract = function(entity, distance, data)
                    return HasJobAuth(v.group)
                end
            }},
            distance = 2.5
        })
    end
end

CreateThread(function()
    for i, loc in pairs(Config.Mugshot.Locations) do
        Target:AddBoxZone('mugshot_' .. i, loc.TargetCoords, 0.1, 0.3, {
            name = "mugshot_" .. i,
            heading = 0,
            debugPoly = false,
            minZ = loc.TargetCoords.z - 1.5,
            maxZ = loc.TargetCoords.z + 1.5,
        }, {
            options = {{
                icon = "fas fa-clipboard-list",
                label = "Take Shot",
                action = function(entity)
                    openMugshot(i)
                end,
                canInteract = function(entity, distance, data)
                    return HasJobAuth(loc.group)
                end,
                locationIndex = i
            }},
            distance = 1.5
        })
    end
end)

if Config.CivilianMDTLocations then
    for k, v in pairs(Config.CivilianMDTLocations) do
        Target:AddBoxZone("civilian_mdt" .. k, vector3(v.coords.x, v.coords.y, v.coords.z), 1.5, 1.5, {
            name = "civilian_mdt" .. k,
            heading = 12.0,
            debugPoly = false,
            minZ = v.minZ,
            maxZ = v.maxZ
        }, {
            options = {{
                num = 1,
                type = "client",
                icon = 'fas fa-database',
                label = "Access Civilian MDT",
                targeticon = 'fas fa-database',
                action = function(entity)
                    openCivilianMDT()
                end,
                canInteract = function(entity, distance, data)
                    return true
                end
            }},
            distance = 2.5
        })
    end
end