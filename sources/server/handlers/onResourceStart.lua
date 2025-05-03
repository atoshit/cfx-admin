AddEventHandler('onResourceStart', function(resource)
    if (resource ~= core.resource) then
        return
    end

    Cache:create('admin_ranks')
    Cache:create('admin_staffs')

    local ranks = core.mysql.getAllRanks()
    local staffs = core.mysql.getAllStaffs()    

    for i = 1, #ranks do
        local rank = ranks[i]
        Cache:set('admin_ranks', rank.name, {
            label = rank.label,
            permissions = json.decode(rank.permissions),
            power = rank.power
        })
    end

    for i = 1, #staffs do
        local staff = staffs[i]
        Cache:set('admin_staffs', staff.license, {
            rank = staff.rank
        })
    end

    print('Admin ranks and staffs cached')
end)
