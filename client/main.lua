RegisterCommand('admin', function()
    triggerServerCallback({
        eventName = "hasPermission",
        args = {{test = "test", test2 = 1, test3 = true}, "TESTT"}, 
        timeout = 5,
        callback = function(hasPermission)
            print(hasPermission)
        end
    })
end)
