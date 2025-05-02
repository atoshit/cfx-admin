local mysql = {}

local function initMySQL()
    if not utils.isResourceActive('oxmysql') then 
        error('oxmysql is not found')
        return 
    end

    if not MySQL or not mysql then 
        error('MySQL is not found')
        return 
    end

    local QUERY_RANKS <const> = [[
        CREATE TABLE IF NOT EXISTS ranks (
            name VARCHAR(20) NOT NULL,
            label VARCHAR(20) NOT NULL,
            perms JSON NOT NULL
        )
    ]]
    
    local QUERY_PLAYERS_RANK <const> = [[
        CREATE TABLE IF NOT EXISTS players_rank (
            license VARCHAR(255) NOT NULL,
            rank VARCHAR(20) NOT NULL
        )
    ]]

    MySQL.query.await(QUERY_RANKS)
    MySQL.query.await(QUERY_PLAYERS_RANK)
    
    local result = MySQL.query.await('SELECT COUNT(*) as count FROM ranks WHERE name = "user"')
    if result and result[1] and result[1].count == 0 then
        MySQL.query.await('INSERT INTO ranks (name, label, perms) VALUES (@name, @label, @perms)', {
            name = 'user',
            label = 'Joueur',
            perms = json.encode({})
        })
        _debug('Rank "user" created')
    end

    _debug('MySQL initialized')
end

initMySQL()

local function getAllRanks()
    return MySQL.query.await('SELECT * FROM ranks')
end

mysql.getAllRanks = getAllRanks

local function getAllPlayersRank()
    return MySQL.query.await('SELECT * FROM players_rank')
end

mysql.getAllPlayersRank = getAllPlayersRank

---@param data table
local function updatePlayersRankCache(data)
    if not data or type(data) ~= 'table' or not next(data) then
        return
    end

    for k, v in pairs(data) do
        local queries = {
            {
                query = 'DELETE FROM players_rank WHERE license = @license',
                values = { license = k }
            },
            {
                query = 'INSERT INTO players_rank (license, rank) VALUES (@license, @rank)',
                values = { license = k, rank = v.rank }
            }
        }
        
        MySQL.transaction(queries)
    end
end

mysql.updatePlayersRankCache = updatePlayersRankCache

---@param data table
local function updatePlayersRankCache(data)
    if not data or type(data) ~= 'table' or not next(data) then
        return
    end

    for k, v in pairs(data) do
        
        local queries = {
            {
                query = 'DELETE FROM players_rank WHERE license = @license',
                values = { license = k }
            },
            {
                query = 'INSERT INTO players_rank (license, rank) VALUES (@license, @rank)',
                values = { license = k, rank = v.rank }
            }
        }
        
        MySQL.transaction(queries)
    end
end

mysql.updatePlayersRankCache = updatePlayersRankCache

local function updateRanksCache(data)
    if not data or type(data) ~= 'table' or not next(data) then
        return
    end
    
    for k, v in pairs(data) do
        local queries = {
            {
                query = 'DELETE FROM ranks WHERE name = @name',
                values = { name = k }
            },
            {
                query = 'INSERT INTO ranks (name, label, perms) VALUES (@name, @label, @perms)',
                values = { name = k, label = v.label, perms = json.encode(v.perms) }
            }
        }
        
        MySQL.transaction(queries)
    end
end

mysql.updateRanksCache = updateRanksCache

_ENV.mysql = mysql