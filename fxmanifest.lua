--- @author Atoshi (discord: atoshic17)
--- Created at 2025-05-02
--- Copyright (c) Atoshi - All Rights Reserved

-- Resource metadata (https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/)
fx_version 'cerulean'
game 'gta5'

lua54 'yes' -- (https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#lua54)
use_experimental_fxv2_oal 'yes' -- (https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#use_experimental_fxv2_oal)

author 'Atoshi'
description 'A complete administration menu made with RageUI library with several dynamic system like rank management, player management and many other amazing features !'
version '0.0.1'

-- Resource dependency
dependency 'oxmysql'

files {
    'configs/*.lua',
    'bridge/**/*.lua',
    'modules/**/shared.lua',
    'sources/client/menus/*.lua',
    'locales/*.lua'
}

shared_scripts {
    'init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'sources/server/classes/*.lua',
    'sources/server/mysql/*.lua',
    'sources/server/handlers/*.lua',
}

client_scripts {
    -- RageUI library
    'lib/init.lua',
    'lib/menu/RageUI.lua',
    'lib/menu/Menu.lua',
    'lib/menu/MenuController.lua',
    'lib/components/*.lua',
    'lib/menu/elements/*.lua',
    'lib/menu/items/*.lua',
    'lib/menu/panels/*.lua',
    'lib/menu/windows/*.lua',

    'sources/client/cache.lua',
    'sources/client/main.lua'
}