local function hasPermission(identifier, permission)
    if not identifier or not permission then
        return false
    end

    local player_rank = players_rank[identifier]
    if not player_rank then
        return false
    end

    for i = 1, #config.owners do 
        if config.owners[i] == identifier then
            return "owner"
        end
    end

    if player_rank.perms[permission] then
        return true
    end

    return false
end

_ENV.hasPermission = hasPermission


