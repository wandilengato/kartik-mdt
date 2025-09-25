
Config.Bodycam = {
    -- Natives used: AttachCamToPedBone, SetCamFov
    boneIndex = 46240,
    xOffset = 0.1,
    yOffset = 0.025,
    zOffset = 0.1,
    fov = 100.0
}

Config.BodycamRecordTime = 10 -- Max record time in seconds

Config.BodycamLocations = {
    [1] = {
        label = "LSPD", 
        coords = vector3(447.9970, -973.3964, 30.6896), 
        size = vec3(1, 1, 1),
        rotation = 45,
        minZ = 30.0, -- for qb-target
        maxZ = 35.5, -- for qb-target
        group = "police"
    },
}