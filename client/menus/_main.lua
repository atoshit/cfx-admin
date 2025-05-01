MAIN_ADMIN_MENU = RageUI.AddMenu(locale("admin_menu_title"), locale("admin_menu_description"))

MAIN_ADMIN_MENU:IsVisible(function(Items)
    Items:Button("Test", "test", {}, true, {
        onSelected = function()
            print('test')
        end
    })
end)

RegisterCommand('test', function()
    MAIN_ADMIN_MENU:Toggle()
end)