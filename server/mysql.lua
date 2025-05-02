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
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(20) NOT NULL,
            label VARCHAR(20) NOT NULL,
            perms JSON NOT NULL,
            author VARCHAR(100) NOT NULL,
            creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]]
    
    local QUERY_PLAYERS_RANK <const> = [[
        CREATE TABLE IF NOT EXISTS players_rank (
            id INT AUTO_INCREMENT PRIMARY KEY,
            license VARCHAR(255) NOT NULL,
            rank_name VARCHAR(20) NOT NULL,
            rank_label VARCHAR(20) NOT NULL,
            author VARCHAR(100) NOT NULL,
            creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]]

    MySQL.query.await(QUERY_RANKS)
    MySQL.query.await(QUERY_PLAYERS_RANK)
    
    local result = MySQL.query.await('SELECT COUNT(*) as count FROM ranks WHERE name = "user"')
    if result and result[1] and result[1].count == 0 then
        MySQL.query.await('INSERT INTO ranks (name, label, perms, author) VALUES ("user", "Joueur", "{}", "CFX-ADMIN")')
        _debug('Rank "user" created')
    end

    _debug('MySQL initialized')
end

initMySQL()

_ENV.mysql = mysql