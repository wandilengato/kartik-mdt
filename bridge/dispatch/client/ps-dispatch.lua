function psExport(name, cb)
    AddEventHandler(('__cfx_export_ps-dispatch_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

---@param data table -- ps-dispatch style alert data
---@return AlertData
local function ConvertPSToKartikMDTAlert(data)
    if type(data) ~= "table" then
        print("^1[ERROR]^0 ConvertPSToKartikMDTAlert: 'data' is not a table")
        return false
    end
    local alert = type(data.alert) == "table" and data.alert or {}
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local function normalizeJobs(raw)
        local jobs = {}
        raw = type(raw) == "table" and raw or { "police" }
        for _, job in pairs(raw) do
            if type(job) == "string" then
                local normalized = job == "leo" and "police" or job
                jobs[normalized] = true
            end
        end
        return jobs
    end

    return {
        coords = coords,
        title = data.message or "Unknown Code",
        code = data.code or data.dispatchCode or "Unknown Code",
        description = data.message or "No description available",
        sound = alert.sound or "dispatch",
        type = "Alert",

        person = (data.name and type(data.name) == "string") and {
            name = data.name,
            phone = data.phone or "",
            citizenid = data.citizenid or ""
        } or nil,

        weapon = data.automaticGunfire and {
            name = "Automatic Gunfire"
        } or nil,

        vehicle = (type(data.vehicle) == "table") and {
            model = data.vehicle.model or "Unknown Model",
            plate = data.plate or "Unknown Plate",
            color = data.color or "Unknown Color",
            doorCount = tonumber(data.doorCount) or 0,
            heading = data.heading or "Unknown"
        } or nil,

        blip = (data.alert or data.sprite) and {
            radius = tonumber(alert.radius or data.radius) or 0,
            sprite = tonumber(alert.sprite or data.sprite) or 0,
            color = tonumber(alert.color or data.color) or 0,
            scale = tonumber(alert.scale or data.scale) or 1.0,
            length = tonumber(alert.length or data.length) or 1
        } or nil,
        jobs = normalizeJobs(data.jobs)
    }
end

psExport('CustomAlert', function(data)
    if not data then
        print("Error: No data received for CustomAlert.")
        return
    end
    local convertedData = ConvertPSToKartikMDTAlert(data)
    if not convertedData then return end
    exports['kartik-mdt']:CustomAlert(convertedData)
end)


psExport('VehicleTheft', function()
    exports['kartik-mdt']:VehicleTheft()
end)

psExport('Shooting', function()
    exports['kartik-mdt']:shooting()
end)

psExport('Hunting', function()
    exports['kartik-mdt']:Hunting()
end)

psExport('VehicleShooting', function()
    exports['kartik-mdt']:VehicleShooting()
end)

psExport('SpeedingVehicle', function()
    exports['kartik-mdt']:SpeedingVehicle()
end)

psExport('PrisonBreak', function()
    exports['kartik-mdt']:PrisonBreak()
end)

psExport('StoreRobbery', function(camId)
    exports['kartik-mdt']:StoreRobbery(camId)
end)

psExport('FleecaBankRobbery', function(camId)
    exports['kartik-mdt']:FleecaBankRobbery(camId)
end)

psExport('PaletoBankRobbery', function(camId)
    exports['kartik-mdt']:PaletoBankRobbery(camId)
end)

psExport('PacificBankRobbery', function(camId)
    exports['kartik-mdt']:PacificBankRobbery(camId)
end)

psExport('VangelicoRobbery', function(camId)
    exports['kartik-mdt']:VangelicoRobbery(camId)
end)

psExport('HouseRobbery', function()
    exports['kartik-mdt']:HouseRobbery()
end)

psExport('YachtHeist', function()
    exports['kartik-mdt']:YachtHeist()
end)

psExport('DrugSale', function()
    exports['kartik-mdt']:DrugSale()
end)

psExport('SuspiciousActivity', function()
    exports['kartik-mdt']:SuspiciousActivity()
end)

psExport('CarJacking', function(vehicle)
    exports['kartik-mdt']:CarJacking(vehicle)
end)

psExport('InjuriedPerson', function()
    exports['kartik-mdt']:InjuriedPerson()
end)

psExport('DeceasedPerson', function()
    exports['kartik-mdt']:DeceasedPerson()
end)

psExport('OfficerDown', function()
    exports['kartik-mdt']:OfficerDown()
end)

RegisterNetEvent("ps-dispatch:client:officerdown", function() 
    exports['kartik-mdt']:OfficerDown()
end)

psExport('OfficerBackup', function()
    exports['kartik-mdt']:OfficerBackup()
end)

RegisterNetEvent("ps-dispatch:client:officerbackup", function() 
    exports['kartik-mdt']:OfficerBackup()
end)

psExport('OfficerInDistress', function()
    exports['kartik-mdt']:OfficerInDistress()
end)

psExport('EmsDown', function()
    exports['kartik-mdt']:EmsDown()
end)

psExport('Explosion', function()
    exports['kartik-mdt']:Explosion()
end)

psExport('ArtGalleryRobbery', function()
    exports['kartik-mdt']:ArtGalleryRobbery()
end)

psExport('HumaneRobbery', function()
    exports['kartik-mdt']:HumaneRobbery()
end)

psExport('TrainRobbery', function()
    exports['kartik-mdt']:TrainRobbery()
end)

psExport('VanRobbery', function()
    exports['kartik-mdt']:VanRobbery()
end)

psExport('UndergroundRobbery', function()
    exports['kartik-mdt']:UndergroundRobbery()
end)

psExport('DrugBoatRobbery', function()
    exports['kartik-mdt']:DrugBoatRobbery()
end)

psExport('UnionRobbery', function()
    exports['kartik-mdt']:UnionRobbery()
end)

psExport('CarBoosting', function(vehicle)
    exports['kartik-mdt']:CarBoosting(vehicle)
end)

psExport('SignRobbery', function()
    exports['kartik-mdt']:SignRobbery()
end)

psExport('BobcatSecurityHeist', function()
    exports['kartik-mdt']:BobcatSecurityHeist()
end)