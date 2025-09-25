function Hunting()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Hunting",
        code = '10-13',
        location = street,
        description = "Possible Hunting Violation",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        weapon = {
            name = GetWeaponName(),
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 141,
            color = 2,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('Hunting', Hunting)

function VehicleTheft(vehicle)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local vehicleData = GetVehicleData(vehicle or cache.vehicle)

    local dispatchData = {
        title = "Vehicle Theft",
        code = '10-13',
        location = street,
        description = "Vehicle Theft",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        vehicle = {
            model = vehicleData.name,
            plate = vehicleData.plate,
            color = vehicleData.color,
            class = vehicleData.class,
            doors = vehicleData.doors,
            heading = vehicleData.heading,
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 595,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('VehicleTheft', VehicleTheft)

function Shooting()
    local coords = tempShotCoords or GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = "Shooting",
        message = "Discharge of a firearm",
        code = '10-11',
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        weapon = {
            name = GetWeaponName()
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 110,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('Shooting', Shooting)

function VehicleShooting(vehicle)
    local coords = tempShotCoords or GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local vehicleData = GetVehicleData(vehicle or cache.vehicle)

    local dispatchData = {
        title = "Vehicle Shooting",
        code = '10-13',
        location = street,
        description = "Vehicle Shooting",
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        vehicle = {
            model = vehicleData.name,
            plate = vehicleData.plate,
            color = vehicleData.color,
            class = vehicleData.class,
            doors = vehicleData.doors,
            heading = vehicleData.heading,
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 119,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('VehicleShooting', VehicleShooting)

function Fight()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = "Fight in progress",
        code = '10-10',
        description = "Fight in progress",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 685,
            color = 69,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('Fight', Fight)

function CarJacking(vehicle)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local vehicleData = GetVehicleData(vehicle or cache.vehicle)

    local dispatchData = {
        title = "Car Jacking",
        code = '10-35',
        description = "Car Jacking",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        vehicle = {
            model = vehicleData.name,
            plate = vehicleData.plate,
            color = vehicleData.color,
            class = vehicleData.class,
            doors = vehicleData.doors,
            heading = vehicleData.heading,
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 595,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('CarJacking', CarJacking)

function Explosion()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = "Explosion Reported",
        code = '10-80',
        description = "Explosion Reported",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 436,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('Explosion', Explosion)

function OfficerDown()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "Officer is down",
        code = '10-99',
        description = playerName.." is down",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true,
            ems = true
        },
        blip = {
            radius = 0,
            sprite = 526,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('OfficerDown', OfficerDown)

function EmsDown()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "EMS down",
        code = '10-99',
        description = playerName.." down",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true,
            ems = true
        },
        blip = {
            radius = 0,
            sprite = 110,
            color = 3,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('EmsDown', EmsDown)

function InjuriedPerson()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "Person is injured",
        code = '10-69',
        description = playerName.." is injured",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = {
            ems = true
        }
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('InjuriedPerson', InjuriedPerson)

function SpeedingVehicle(vehicle)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local vehicleData = GetVehicleData(vehicle or cache.vehicle)

    local dispatchData = {
        title = "Reckless driving",
        code = '10-11',
        description = "Reckless driving",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        vehicle = {
            model = vehicleData.name,
            plate = vehicleData.plate,
            color = vehicleData.color,
            class = vehicleData.class,
            doors = vehicleData.doors,
            heading = vehicleData.heading,
        },
        jobs = { 
            police = true
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('SpeedingVehicle', SpeedingVehicle)

function PrisonBreak()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Prison Break",
        code = '10-90',
        location = street,
        description = "Prison Break In Progress",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 189,
            color = 59,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('PrisonBreak', PrisonBreak)

function StoreRobbery(camId)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Store Robbery",
        code = '10-90',
        location = street,
        description = "Store Robbery In Progress " .. (camId and "Camera ID: " .. camId or ""),
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 52,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('StoreRobbery', StoreRobbery)

function FleecaBankRobbery(camId)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Fleeca Robbery",
        code = '10-90',
        location = street,
        description = "Fleeca Robbery In Progress " .. (camId and "Camera ID: " .. camId or ""),
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 500,
            color = 2,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('FleecaBankRobbery', FleecaBankRobbery)

function PaletoBankRobbery(camId)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Paleto Bank Robbery",
        code = '10-90',
        location = street,
        description = "Paleto Bank Robbery In Progress " .. (camId and "Camera ID: " .. camId or ""),
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 500,
            color = 12,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('PaletoBankRobbery', PaletoBankRobbery)

function PacificBankRobbery(camId)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Pacific Bank Robbery",
        code = '10-90',
        location = street,
        description = "Pacific Bank Robbery In Progress " .. (camId and "Camera ID: " .. camId or ""),
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 500,
            color = 5,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('PacificBankRobbery', PacificBankRobbery)

function VangelicoRobbery(camId)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Vangelico Robbery",
        code = '10-90',
        location = street,
        description = "Vangelico Robbery In Progress " .. (camId and "Camera ID: " .. camId or ""),
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 434,
            color = 5,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('VangelicoRobbery', VangelicoRobbery)

function HouseRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "House Robbery",
        code = '10-90',
        location = street,
        description = "House Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 40,
            color = 5,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('HouseRobbery', HouseRobbery)

function YachtHeist()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Yacht Heist",
        code = '10-65',
        location = street,
        description = "Yacht Heist In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 455,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('YachtHeist', YachtHeist)

function DrugSale()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Suspicious Handoff",
        code = '10-13',
        location = street,
        description = "Suspicious Handoff In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 469,
            color = 52,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('DrugSale', DrugSale)

function SuspiciousActivity()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Suspicious Activity",
        code = '10-66',
        location = street,
        description = "Suspicious Activity In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 66,
            color = 37,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('SuspiciousActivity', SuspiciousActivity)

function DeceasedPerson()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Civilian Bled Out",
        code = '10-69',
        location = street,
        description = "Civilian Bled Out",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 126,
            color = 3,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('DeceasedPerson', DeceasedPerson)

function OfficerBackup()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "Officer needs backup",
        code = '10-32',
        description = playerName.." needs help",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true,
            ems = true
        },
        blip = {
            radius = 0,
            sprite = 526,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('OfficerBackup', OfficerBackup)

function OfficerInDistress()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "Officer in distress",
        code = '10-32',
        description = playerName.." in distress",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true,
            ems = true
        },
        blip = {
            radius = 0,
            sprite = 526,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('OfficerInDistress', OfficerInDistress)

function ArtGalleryRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Art Gallery Robbery",
        code = '10-90',
        location = street,
        description = "Art Gallery Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 269,
            color = 59,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('ArtGalleryRobbery', ArtGalleryRobbery)

function HumaneRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Humane Labs Robbery",
        code = '10-90',
        location = street,
        description = "Humane Labs Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 499,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('HumaneRobbery', HumaneRobbery)

function TrainRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Train Robbery",
        code = '10-90',
        location = street,
        description = "Train Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 667,
            color = 78,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('TrainRobbery', TrainRobbery)

function VanRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Security Van Robbery",
        code = '10-90',
        location = street,
        description = "Security Van Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 67,
            color = 59,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('VanRobbery', VanRobbery)

function UndergroundRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Bunker Robbery",
        code = '10-90',
        location = street,
        description = "Bunker Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 486,
            color = 59,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('UndergroundRobbery', UndergroundRobbery)

function DrugBoatRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Suspicious Boat",
        code = '10-90',
        location = street,
        description = "Suspicious Boat In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 427,
            color = 26,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('DrugBoatRobbery', DrugBoatRobbery)

function UnionRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    
    local dispatchData = {
        title = "Union Depository Robbery",
        code = '10-90',
        location = street,
        description = "Union Depository Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 500,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('UnionRobbery', UnionRobbery)

function CarBoosting(vehicle)
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local vehicleData = GetVehicleData(vehicle or cache.vehicle)

    local dispatchData = {
        title = "Car Boosting",
        code = '10-50',
        location = street,
        description = "Car Boosting In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        vehicle = {
            model = vehicleData.name,
            plate = vehicleData.plate,
            color = vehicleData.color,
            class = vehicleData.class,
            doors = vehicleData.doors,
            heading = vehicleData.heading,
        },
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 595,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('CarBoosting', CarBoosting)

function SignRobbery()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = "Sign Robbery",
        code = '10-10',
        location = street,
        description = "Sign Robbery In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 358,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('SignRobbery', SignRobbery)

function BobcatSecurityHeist()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = "Bobcat Security Heist",
        code = '10-90',
        location = street,
        description = "Bobcat Security Heist In Progress ",
        type = "Alert",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sound = "dispatch",
        jobs = { 
            police = true
        },
        blip = {
            radius = 0,
            sprite = 358,
            color = 60,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('BobcatSecurityHeist', BobcatSecurityHeist)

function PanicButton()
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local playerName = PlayerData.name or "Unknown"

    local dispatchData = {
        title = "Officer in distress",
        code = '10-32',
        description = playerName.." in distress",
        location = street,
        type = "Alert",
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        jobs = { 
            police = true,
            ems = true
        },
        blip = {
            radius = 0,
            sprite = 526,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        }
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end

exports('PanicButton', PanicButton)

RegisterNetEvent("kartik-mdt:client:PanicButton",function(data)
    PanicButton()
end)

RegisterNetEvent("kartik-mdt:client:customAlert",function(data)
    CustomAlert(data)
end)

---@class WeaponData
---@field name string -- Weapon name

---@class PersonData
---@field name string -- Person name
---@field phone string -- Person phone number
---@field citizenid string -- Person citizen ID

---@class BlipData
---@field radius number -- Blip radius (default: 0)
---@field sprite number -- Blip sprite (default: 0)
---@field color number -- Blip color (default: 0)
---@field scale number -- Blip scale (default: 1.0)
---@field length number -- Blip length (default: 0) (time in minutes for how long this will stay)

---@class AlertData
---@field coords vector3 -- (optional)
---@field vehicle number -- (optional) Vehicle Entity Id
---@field title string -- Alert Title
---@field code string -- Alert Code
---@field description string -- Alert Description
---@field sound string -- Sound to play (fileName from sounds/ folder) (default: "dispatch")
---@field type string -- Alert Type (default: "Alert") ("Call", "Alert")
---@field person PersonData -- Person data (optional)
---@field weapon WeaponData -- Weapon data (optional)
---@field blip BlipData -- Blip data (optional)
---@field jobs table -- Jobs to notify (optional) Example: { police = true, ems = true }

---Custom Alert function
---@param data AlertData
function CustomAlert(data)
    local coords = data and data.coords or GetEntityCoords(cache.ped)
    local streetName, _ = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local vehicle = nil
    if data and data.vehicle then
        if type(data.vehicle) == "table" then
            vehicle = data.vehicle
        elseif type(data.vehicle) == "number" then
            vehicle = GetVehicleData(data.vehicle) 
        end
    end
    local dispatchData = {
        title = (data and data.title) or "",
        code = (data and data.code) or "",
        description = (data and data.description) or "",
        location = street,
        sound = (data and data.sound) or "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        type = (data and data.type) or "Alert",
        person = (data and data.person) or nil,
        weapon = (data and data.weapon) or nil,
        vehicle = vehicle or nil,
        blip = (data and data.blip) or nil,
        jobs = (data and data.jobs) or nil
    }

    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end


exports('CustomAlert', CustomAlert)

RegisterNetEvent("kartik-mdt:client:sendCall", function(message, anonymous, job, codeType)
    if not PlayerData.citizenid then return end
    local coords = GetEntityCoords(cache.ped)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)

    local dispatchData = {
        title = anonymous and "Anonymous Call" or "Call",
        code = codeType,
        description = message,
        location = street,
        sound = "dispatch",
        x = coords.x,
        y = coords.y,
        z = coords.z,
        type = "Call",
        person = {
            name = anonymous and "Anonymous" or (PlayerData.name or "Unknown"),
            phone = anonymous and "Private Number" or (PlayerData.phone or "No Number"),
            citizenid = PlayerData.citizenid -- Just to get his source, if he crashes
        },
        blip = {
            radius = 2.0,
            sprite = 480,
            color = 1,
            scale = 1.5,
            length = 2, -- time in minutes for how long this will stay
        },
        jobs = job
    }
    TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
end)