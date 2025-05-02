registerServerCallback({
    eventName = 'cfx-admin:hasPermission',
    eventCallback = function(source)
        local license = GetPlayerIdentifierByType(source, 'license')
        local hasPermission = hasPermission(license, 'open.admin')

        if not hasPermission then
            return false
        end

        return {
            ranks = ranks,
            players_rank = players_rank,
            perms = players_rank[license].perms,
            owner = hasPermission
        }
    end
})