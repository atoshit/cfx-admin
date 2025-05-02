MAIN_ADMIN_MENU = RageUI.AddMenu(locale("admin_menu_title"), locale("admin_menu_description"))

MAIN_ADMIN_MENU:IsVisible(function(Items)
    Items:Checkbox(locale("staff_mode_title"), locale("staff_mode_description"), staff_mode, {}, {
        onChecked = function()
            staff_mode = true
        end,
        onUnChecked = function()
            staff_mode = false
        end
    })

    if staff_mode then
        Items:Separator(locale("separator_main_options"))

        if hasPermission("reports.manage") then
            Items:Button(locale("reports_title"):format(#reports), locale("reports_description"), {}, true, {
                onSelected = function()
                    print('test')
                end
            })
        end

        if hasPermission("personal.manage") then
            Items:Button(locale("personal_options_title"), locale("personal_options_description"), {}, true, {
                onSelected = function()
                    print('test')
                end
            })
        end

        if hasPermission("players.manage") then
            Items:Button(locale("players_title"):format(#players), locale("players_description"), {}, true, {
                onSelected = function()
                    print('test')
                end
            })
        end

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if hasPermission("vehicle.manage") then
                Items:Button(locale("vehicle_title"), locale("vehicle_description"), {}, true, {
                    onSelected = function()
                        print('test')
                    end
                })
            end
        end

        Items:Separator(locale("separator_advanced_options"))

        if hasPermission("server.manage") then
            Items:Button(locale("server_title"), locale("server_description"), {}, true, {
                onSelected = function()
                    print('test')
                end
            })
        end

        if hasPermission("ranks.manage") then
            Items:Button(locale("ranks_title"), locale("ranks_description"), {}, true, {
                onSelected = function()
                    print('test')
                end
            })
        end
    end
end)

RegisterCommand('test', function()
    MAIN_ADMIN_MENU:Toggle()
end)