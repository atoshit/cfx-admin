RegisterCommand(config.menu.openCommand, function()
    local results = triggerServerCallback({
        eventName = 'cfx-admin:hasPermission'
    })

    if not results then 
        return
    end

    ranks = results.ranks
    players_rank = results.players_rank
    my_perms = results.perms
    owner = results.owner == "owner"
    
    return MAIN_ADMIN_MENU:Toggle()
end)

RegisterKeyMapping(config.menu.openCommand, locale('admin_menu_title'), 'keyboard', config.menu.openKey)
