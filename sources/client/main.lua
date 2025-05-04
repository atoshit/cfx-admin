local MENU <const> = core.LoadConfig('menu')
local LOCALE <const> = core.Require('modules.locale.shared')

core.staffMode = false

RegisterCommand(MENU.command, function()
    if core.adminRanks[core.myData.rank].permissions["open.menu"] or core.LoadConfig('owners')[core.myData.license] then
        local menu = core.LoadMenu('_main')

        return menu:Toggle()
    end
end)

RegisterKeyMapping(MENU.command, LOCALE('menu.title'), 'keyboard', MENU.key)