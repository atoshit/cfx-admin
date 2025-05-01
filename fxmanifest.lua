fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Atoshi'
description 'Completely admin menu for FiveM'
version '0.0.1'

shared_scripts {
    'shared/configs/*.lua',

    'shared/functions/debug.lua',
    'shared/functions/utils.lua',

    'shared/bridge.lua'
}

client_scripts {
    'bridge/**/client.lua',
}

server_scripts {
    'bridge/**/server.lua',
}
