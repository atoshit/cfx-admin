local main = RageUI.AddMenu("Test", "Test")

main:IsVisible(function(Items)
    Items:Button("Test", "test", {}, true, {
        onSelected = function()
            print('test')
        end
    })
end)

RegisterCommand('test', function()
    main:Toggle()
end)