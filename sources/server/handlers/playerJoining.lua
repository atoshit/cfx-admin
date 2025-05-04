AddEventHandler('playerJoining', function(oldId)
    while not GetPlayerPed(source) do
        Wait(100)
    end

    TriggerClientEvent('cache:admin_staffs:updateBulk', source, Cache:get('admin_staffs'))
    TriggerClientEvent('cache:admin_ranks:updateBulk', source, Cache:get('admin_ranks'))

    local license = GetPlayerIdentifierByType(source, 'license')

    if Cache:get('admin_staffs')[license] then
        TriggerClientEvent('core:admin:setStaff', source, license, Cache:get('admin_staffs')[license].rank)
    end
end)
