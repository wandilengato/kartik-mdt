Config = {}

Config.Debug = false

lib.locale()

Config.TabletTheme = false

Config.MinimumDutyMinutes = 20 -- Minimum time (in minutes) required to log a duty record

Config.Jobs = {
    ["police"] = {               -- job category ( dispatch notification will be sent to this category)
        "police", "bcso", "sasp" -- job names
    },
    ["ems"] = {
        "ambulance"
    },
    ["lawyer"] = {
        "lawyer"
    },
}

Config.Exports = {
    ["bcso"] = {
        label = "BCSO",
        warrantTemplateUrl = "bcso_template.png",
    },
    ["sasp"] = {
        label = "SASP",
        warrantTemplateUrl = "sasp_template.png",
    },
    ["lspd"] = {
        label = "LSPD",
        warrantTemplateUrl = "lspd_template.png",
    },
    ["ambulance"] = {
        label = "EMS",
        warrantTemplateUrl = "lspd_template.png",
    },
}

Config.CriminalCodeCategory = {
    "Infraction",
    "Misdemeanor",
    "Felony"
}

Config.Licenses = {
    { label = "Driver's License", type = "driver" },
    { label = "Firearms License", type = "firearms" },
    { label = "ID Card",          type = "id" },
    { label = "Weapon License",   type = "weapon" },
    { label = "Hunting License",  type = "hunting" },
    { label = "Fishing License",  type = "fishing" },
    { label = "Wildlife License", type = "wildlife" },
    { label = "Pilot License",    type = "pilot" },
    { label = "Business License", type = "business" },
}

Config.Utils = {
    mdt = {
        command = "mdt",
        useByCommand = true,
        itemRequired = false,
        item = "mdt",
        enableKeybind = false,
        keybind = "F5"
    },
    bodycam = {
        command = "bodycam",
        useByCommand = true,
        itemRequired = true,
        item = "bodycam",
        enableKeybind = false,
        keybind = "F6"
    },
    dispatch = {
        command = "opendispatch",
        useByCommand = true,
        itemRequired = false,
        item = "dispatch",
        enableKeybind = false,
        keybind = "F7"
    },
}

Config.Logo = {
    { label = "Ambulance", type = "ambulance", logo = "emslogo.png" },
    { label = "Police",    type = "police",    logo = "lspdlogo.webp" },
    { label = "BCSO",      type = "bcso",      logo = "bcsologo.png" },
    { label = "SASP",      type = "sasp",      logo = "sasplogo.png" },
    { label = "Lawyer",    type = "lawyer",    logo = "dojlogo.png" },
}

Config.OfficerTags = {
    { label = "Field Training Officer", shortname = "FTO",  color = "green" },
    { label = "K9 Unit",                shortname = "K9",   color = "blue" },
    { label = "SWAT Team",              shortname = "SWAT", color = "red" },
    { label = "Traffic Enforcement",    shortname = "TE",   color = "yellow" },
    { label = "Crisis Negotiation",     shortname = "CNT",  color = "purple" },
    { label = "Bomb Squad",             shortname = "BS",   color = "orange" },
    { label = "Homicide Detective",     shortname = "HD",   color = "black" },
    { label = "Forensic Specialist",    shortname = "FS",   color = "gray" },
}

Config.Courtrooms = {
    "Courtroom 10A",
    "Courtroom 11A",
    "Courtroom 12B",
    "Courtroom 13A",
    "Courtroom 14C",
    "Courtroom 15B",
}

Config.VehicleStrikePoints = 30