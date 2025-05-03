local LOCALE <const> = core.Require('modules.locale.shared')
local MAIN_MENU <const> = RageUI.AddMenu(LOCALE('menu.title'), LOCALE('menu.description'))

core.menus['main'] = MAIN_MENU

MAIN_MENU:IsVisible(function(Items)
    Items:Checkbox(LOCALE('menu.staffmode.title'), LOCALE('menu.staffmode.description'), core.staffMode, {}, {
        onChecked = function()
            core.staffMode = true
        end,
        onUnChecked = function()
            core.staffMode = false
        end
    })
end)

return MAIN_MENU