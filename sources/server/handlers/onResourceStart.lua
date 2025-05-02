AddEventHandler('onResourceStart', function(resource)
    if (resource ~= core.resource) then
        return
    end
end)
