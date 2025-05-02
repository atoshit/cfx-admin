local function initDatabase()
    while not MySQL do
        Wait(100)
    end

    ---@class MySQL
    core.mysql = {}


    local ADMIN_RANKS_QUERY <const> = [[
        CREATE TABLE IF NOT EXISTS admin_ranks (
            name VARCHAR(20) NOT NULL PRIMARY KEY,
            label VARCHAR(20) NOT NULL,
            permissions TEXT NOT NULL,
            power INT(100) NOT NULL DEFAULT '50'
        )
    ]]

    local ADMIN_STAFFS_QUERY <const> = [[
        CREATE TABLE IF NOT EXISTS admin_staffs (
            license VARCHAR(100) NOT NULL PRIMARY KEY,
            rank VARCHAR(20) NOT NULL
        )
    ]]

    
    MySQL.query.await(ADMIN_RANKS_QUERY)
    MySQL.query.await(ADMIN_STAFFS_QUERY)
end

initDatabase()