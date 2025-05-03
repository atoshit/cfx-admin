TESTMENU = RageUI.AddMenu("test", "test")

local staff_mode = false
TESTMENU:IsVisible(function(Items)
    Items:Checkbox("test", "test", staff_mode, {}, {
        onChecked = function()
            print('checked')
            staff_mode = true
        end,
        onUnChecked = function()
            print('unchecked')
            staff_mode = false
        end
    })
end)

return TESTMENU