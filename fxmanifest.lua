fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Atoshi'
description 'Completely admin menu for FiveM'
version '0.0.1'

files {
    'bridge/esx/*.lua',
    'bridge/qbcore/*.lua',
    
    'locales/*.lua'
}

shared_scripts {
    'shared/configs/*.lua',

    'shared/functions/debug.lua',
    'shared/functions/utils.lua',
    'shared/functions/locale.lua',
    'shared/functions/callback.lua',

    'shared/bridge.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/mysql.lua'
}

client_scripts {
    'client/lib/init.lua',
    'client/lib/menu/RageUI.lua',
    'client/lib/menu/Menu.lua',
    'client/lib/menu/MenuController.lua',
    'client/lib/components/*.lua',
    'client/lib/menu/elements/*.lua',
    'client/lib/menu/items/*.lua',
    'client/lib/menu/panels/*.lua',
    'client/lib/menu/windows/*.lua',

    'client/menus/*.lua',
    'client/main.lua'
}