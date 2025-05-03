local MENU <const> = core.LoadConfig('menu')
local LOCALE <const> = core.Require('modules.locale.shared')

core.staffMode = false

RegisterCommand(MENU.command, function()
    core.LoadMenu('_main')

    core.menus['main']:Toggle()
end)

RegisterKeyMapping(MENU.command, LOCALE('menu.title'), 'keyboard', MENU.key)