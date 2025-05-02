
local ranks = {}
local players_rank = {}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    while not mysql or not MySQL.ready do
        Wait(100)
    end

    local rank_result = mysql.getAllRanks()

    if rank_result and #rank_result > 0 then
        local loaded = 0
        for i = 1, #rank_result do
            local rank = rank_result[i]
            ranks[rank.name] = {
                label = rank.label,
                perms = json.decode(rank.perms)
            }

            loaded += 1
        end

        _debug(loaded .. ' ranks loaded')
    end

    local player_rank_result = mysql.getAllPlayersRank()

    if player_rank_result and #player_rank_result > 0 then
        local loaded = 0

        for i = 1, #player_rank_result do
            local player_rank = player_rank_result[i]

            local perms = ranks[player_rank.rank].perms

            players_rank[player_rank.license] = {
                rank = player_rank.rank,
                perms = perms
            }

            loaded += 1
        end

        _debug(loaded .. ' players ranks loaded')
    end
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local tempId = source

    local license = GetPlayerIdentifierByType(tempId, 'license')

    if not players_rank[license] then
        if config.deferrals then
            deferrals.defer()
            Wait(100)
            deferrals.update(locale('deferrals_no_rank'))
            Wait(5000)
        end

        players_rank[license] = {
            rank = 'user',
            perms = {}
        }

        while not players_rank[license] do
            Wait(100)
        end

        if config.deferrals then
            deferrals.done()
            return CancelEvent()
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    mysql.updatePlayersRankCache(players_rank)
    mysql.updateRanksCache(ranks)
end)

_ENV.ranks = ranks
_ENV.players_rank = players_rank