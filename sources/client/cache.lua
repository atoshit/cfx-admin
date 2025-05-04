RegisterNetEvent('cache:admin_ranks:updateBulk', function(data)
    if not core.adminRanks then
        core.adminRanks = {}
    end

    for k, v in pairs(data) do
        core.adminRanks[k] = v
    end

    print(json.encode(core.adminRanks))
end)

RegisterNetEvent('cache:admin_ranks:update', function(key, value)
    if not core.adminRanks then
        core.adminRanks = {}
    end

    core.adminRanks[key] = value

    print(json.encode(core.adminRanks))
end)

RegisterNetEvent('cache:admin_staffs:updateBulk', function(data)
    if not core.adminStaffs then
        core.adminStaffs = {}
    end

    for k, v in pairs(data) do
        core.adminStaffs[k] = v
    end

    print(json.encode(core.adminStaffs))
end)

RegisterNetEvent('cache:admin_staffs:update', function(key, value)
    if not core.adminStaffs then
        core.adminStaffs = {}
    end

    core.adminStaffs[key] = value

    print(json.encode(core.adminStaffs))
end)

core.myData = {
    license = nil,
    rank = nil
}

RegisterNetEvent('core:admin:setStaff', function(license, rank)
    core.myData = {
        license = license,
        rank = rank
    }

    print(json.encode(core.myData))
end)

RegisterCommand('getcache', function()
    print(json.encode(core.myData))
    print(json.encode(core.adminRanks))
    print(json.encode(core.adminStaffs))
end)