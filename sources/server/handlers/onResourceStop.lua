AddEventHandler('onResourceStop', function(resource)
    if (resource ~= core.resource) then
        return
    end

    core.mysql.saveCachedData(Cache:get('admin_ranks'), Cache:get('admin_staffs'))
end)
