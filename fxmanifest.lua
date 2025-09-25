fx_version 'cerulean'
game 'gta5'

name 'MDT by Kartik'
version '1.8.69'
lua54 'yes'
fxv2_oal 'yes'

ui_page 'web/index.html'

shared_scripts {
    -- '@es_extended/imports.lua', -- Import ESX functions and PlayerData
    -- '@es_extended/locale.lua', -- Import the Locale system
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/dispatch_config.lua',
    'shared/config_speedcams.lua',
    'shared/config_evidence.lua',
    'shared/security_cameras_config.lua',
    'shared/permissions.lua',
    'shared/config_animation.lua',
    'shared/config_reports.lua',
    'shared/config_duty_blips.lua',
    'shared/config_templates.lua',
    'shared/config_keybinds.lua',
    'shared/config_bodycam.lua',
    'shared/config_collaboration.lua',
    'shared/config_mugshot.lua',
    'shared/config_civilian_mdt.lua'
}

client_scripts {
    'client/***/**/*',
    'bridge/**/client.lua',
    'bridge/**/client/*.lua',
    '@qbx_core/modules/playerdata.lua', -- For QBOX
}

server_scripts {
    'shared/server_config.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/***/**/*',
    'bridge/**/server.lua',
    'bridge/**/server/*.lua',
}

files {
	'web/index.html',
	'web/**/*',
    'locales/*.json'
}

dependencies {
    'ox_lib',
    'oxmysql'
}

escrow_ignore {
    'shared/*.lua',
    'server/open/*.lua',
    'client/open/*.lua',
    'bridge/**/**/*',
}
dependency '/assetpacks'