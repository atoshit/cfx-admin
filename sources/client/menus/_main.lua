local LOCALE <const> = core.Require('modules.locale.shared')
core.menus["main"] = RageUI.AddMenu(LOCALE('menu.title'), LOCALE('menu.description'))

core.menus["main"]:IsVisible(function(Items)
    Items:Checkbox(LOCALE('menu.staffmode.title'), LOCALE('menu.staffmode.description'), core.staffMode, {}, {
        onChecked = function()
            core.staffMode = true
        end,
        onUnChecked = function()
            core.staffMode = false
        end
    })

    if not core.staffMode then return end

    Items:Separator(LOCALE('menu.separator.moderation'))

    Items:Button(LOCALE('menu.players_gestion.title'), LOCALE('menu.players_gestion.description'), {}, true, {}, core.menus['players_gestion'])

    Items:Separator(LOCALE('menu.separator.gestion'))

end)

return core.menus["main"]