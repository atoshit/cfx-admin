RegisterCommand(config.menu.openCommand, function()
    MAIN_ADMIN_MENU:Toggle()
end)

RegisterKeyMapping(config.menu.openCommand, locale('admin_menu_title'), 'keyboard', config.menu.openKey)