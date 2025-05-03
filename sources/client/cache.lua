RegisterNetEvent('cache:admin_ranks:updateBulk', function(data)
    if not core.adminRanks then
        core.adminRanks = {}
    end

    for k, v in pairs(data) do
        core.adminRanks[k] = v
    end
end)

RegisterNetEvent('cache:admin_ranks:update', function(key, value)
    if not core.adminRanks then
        core.adminRanks = {}
    end

    core.adminRanks[key] = value
end)

RegisterNetEvent('cache:admin_staffs:updateBulk', function(data)
    if not core.adminStaffs then
        core.adminStaffs = {}
    end

    for k, v in pairs(data) do
        core.adminStaffs[k] = v
    end
end)

RegisterNetEvent('cache:admin_staffs:update', function(key, value)
    if not core.adminStaffs then
        core.adminStaffs = {}
    end

    core.adminStaffs[key] = value
end)