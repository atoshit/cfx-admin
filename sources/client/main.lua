RegisterNetEvent('cache:ranks:update', function(key, value)
    print(key, json.encode(value))
end)

RegisterNetEvent('cache:ranks:updateBulk', function(values)
    print(json.encode(values))
end)

RegisterCommand('admin', function()
    core.LoadMenu('_main')

    TESTMENU:Toggle()
end)
