core.staffMode = false

RegisterCommand('admin', function()
    core.LoadMenu('_main')

    core.menus['main']:Toggle()
end)
