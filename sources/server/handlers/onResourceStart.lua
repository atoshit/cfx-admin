AddEventHandler('onResourceStart', function(resource)
    if (resource ~= core.resource) then
        return
    end

    Cache:create('admin_ranks')
    Cache:create('admin_staffs')

    local ranks = core.mysql.getAllRanks()
    local staffs = core.mysql.getAllStaffs()    

    local admin_ranks = {}
    for i = 1, #ranks do
        local rank = ranks[i]
        admin_ranks[rank.name] = {
            label = rank.label,
            permissions = json.decode(rank.permissions),
            power = rank.power
        }
    end

    local admin_staffs = {}
    for i = 1, #staffs do
        local staff = staffs[i]
        admin_staffs[staff.license] = {
            rank = staff.rank
        }
    end

    Cache:set('admin_ranks', admin_ranks)
    Cache:set('admin_staffs', admin_staffs)

    local LOG <const> = core.Require('modules.debug.shared')

    LOG.debug('Admin ranks and staffs cached')

    for i = 1, #GetPlayers() do
        local id = GetPlayers()[i]
        local license = GetPlayerIdentifierByType(id, 'license')

        if Cache:get('admin_staffs')[license] then
            TriggerClientEvent('core:admin:setStaff', id, license, Cache:get('admin_staffs')[license].rank)
        end
    end
end)

RegisterCommand('getcache', function()
    print(json.encode(Cache:get('admin_ranks')))
    print(json.encode(Cache:get('admin_staffs')))
end)