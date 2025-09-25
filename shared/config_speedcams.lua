--- Note: this config only works when Config.Alerts['Speedcam'] is set to true and Config.Alerts['Speeding'] is set to false
--- Check dispatch_config.lua

Config.SpeedCamAlertChance = 50 -- in percentage out of 100

Config.SpeedCamClassBlacklist = {
    [15] = true, -- Helicopters
    [16] = true, -- Planes
}

Config.SpeedCams = {
    ['legionsquare'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(240.53, -1073.06, 29.0),
            vector3(249.87, -1026.83, 29.0),
            vector3(210.87, -1010.48, 29.0),
            vector3(196.13, -1055.29, 29.0),
        },
        thickness = 6.8,
    },
    ['powerstreet'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-56.45, -910.2, 29.0),
            vector3(-63.59, -959.16, 29.0),
            vector3(-21.05, -976.5, 29.0),
            vector3(1.78, -929.25, 29.0),
        },
        thickness = 6.8,
    },
    ['calaisave'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-481.43, -854.23, 30.0),
            vector3(-480.03, -819.5, 30.0),
            vector3(-522.04, -818.33, 30.0),
            vector3(-521.16, -855.64, 30.0),
        },
        thickness = 6.8,
    },
    ['palominoave'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-656.32, -679.46, 31.0),
            vector3(-656.42, -641.94, 31.0),
            vector3(-613.46, -641.35, 31.0),
            vector3(-616.66, -675.24, 31.0),
        },
        thickness = 6.8,
    },
   
    ['mirrorparkblvd'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(1182.56, -872.73, 54.0),
            vector3(1144.61, -861.92, 54.0),
            vector3(1158.63, -815.91, 54.0),
            vector3(1195.7, -829.54, 54.0),
        },
        thickness = 6.8,
    },
    ['mirrorparkblvd2'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(1045.32, -192.45, 70.0),
            vector3(1025.87, -222.47, 70.0),
            vector3(1001.47, -206.77, 70.0),
            vector3(1021.29, -178.87, 70.0),
        },
        thickness = 6.8,
    },
    ['vinewoodpd'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(666.51, 2.27, 84.0),
            vector3(688.81, 36.87, 84.0),
            vector3(717.47, 17.44, 84.0),
            vector3(698.33, -16.07, 84.0),
        },
        thickness = 6.8,
    },
    ['vinewoodstreet'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(192.9, 222.65, 105.0),
            vector3(180.99, 179.97, 105.0),
            vector3(210.07, 170.54, 105.0),
            vector3(231.8, 212.59, 105.0),
        },
        thickness = 6.8,
    },
    ['eclipseblvd'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-550.92, 274.23, 82.0),
            vector3(-524.15, 271.22, 82.0),
            vector3(-524.85, 236.23, 82.0),
            vector3(-562.16, 236.99, 82.0),
        },
        thickness = 6.8,
    },
    ['westeclipseblvd'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-1066.72, 285.03, 63.0),
            vector3(-1061.43, 240.59, 63.0),
            vector3(-1104.95, 237.72, 63.0),
            vector3(-1100.36, 289.92, 63.0),
        },
        thickness = 6.8,
    },
    ['northrockforddr'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-1596.08, -182.43, 54.0),
            vector3(-1563.55, -148.21, 54.0),
            vector3(-1518.74, -190.71, 54.0),
            vector3(-1556.85, -211.09, 54.0),
        },
        thickness = 6.8,
    },
    ['baycityave'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-1689.61, -580.34, 33.0),
            vector3(-1653.41, -541.57, 33.0),
            vector3(-1620.36, -575.75, 33.0),
            vector3(-1646.56, -611.8, 33.0),
        },
        thickness = 6.8,
    },
    ['delperrofwy'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-1817.26, -569.16, 11.0),
            vector3(-1837.78, -552.21, 11.0),
            vector3(-1865.93, -584.64, 11.0),
            vector3(-1843.23, -604.25, 11.0),
        },
        thickness = 6.8,
    },
    ['greanoceanhwy'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-3093.0, 755.88, 21.0),
            vector3(-3069.37, 777.46, 21.0),
            vector3(-3048.0, 748.51, 21.0),
            vector3(-3067.87, 733.06, 21.0),
        },
        thickness = 6.8,
    },
    ['greanoceanhwyzancudo'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-2737.92, 2307.62, 19.0),
            vector3(-2687.85, 2298.88, 19.0),
            vector3(-2701.48, 2266.38, 19.0),
            vector3(-2743.47, 2285.29, 19.0),
        },
        thickness = 6.8,
    },
    ['greanoceanhwynorthchumash'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-2247.17, 4229.39, 44.0),
            vector3(-2279.11, 4258.02, 43.0),
            vector3(-2238.27, 4316.47, 43.0),
            vector3(-2200.95, 4302.11, 43.0),
        },
        thickness = 6.8,
    },
    ['greanoceanhwypaletoforest'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-816.48, 5450.91, 33.0),
            vector3(-827.53, 5471.88, 33.0),
            vector3(-853.28, 5459.26, 33.0),
            vector3(-839.79, 5433.25, 33.0),
        },
        thickness = 6.8,
    },
    ['paletobay'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(-201.03, 6151.76, 31.0),
            vector3(-222.75, 6176.67, 31.0),
            vector3(-247.82, 6154.84, 31.0),
            vector3(-224.13, 6128.92, 31.0),
            vector3(-226.35, 6140.51, 31.0),
        },
        thickness = 6.8,
    },
    ['paletofuelstation'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(159.0, 6507.42, 31.0),
            vector3(131.79, 6530.77, 31.0),
            vector3(149.71, 6554.44, 31.0),
            vector3(174.73, 6520.39, 31.0),
            vector3(156.74, 6527.89, 31.0),
        },
        thickness = 6.8,
    },
    ['senorafwy'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(1570.25, 6394.79, 23.0),
            vector3(1591.51, 6446.8, 23.0),
            vector3(1557.85, 6459.88, 23.0),
            vector3(1537.08, 6408.13, 23.0),
        },
        thickness = 6.8,
    },
    ['unionrd'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(2652.91, 5132.8, 44.0),
            vector3(2661.21, 5109.3, 44.0),
            vector3(2598.53, 5090.31, 44.0),
            vector3(2588.47, 5116.96, 44.0),
        },
        thickness = 6.8,
    },
    ['senorafwy2'] = {
        speed = 100.0,
        flash = false,
        points = {
            vector3(2764.1, 4383.58, 48.0),
            vector3(2752.61, 4415.39, 48.0),
            vector3(2816.82, 4431.98, 48.0),
            vector3(2826.86, 4404.4, 48.0),
        },
        thickness = 6.8,
    },
}