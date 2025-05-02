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

    local query = [[
        CREATE TABLE IF NOT EXISTS ranks (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(20) NOT NULL,
            label VARCHAR(20) NOT NULL,
            perms JSON NOT NULL,
            author VARCHAR(100) NOT NULL,
            creation_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]]

    MySQL.query.await(query)
    MySQL.query.await('INSERT INTO ranks (name, label, perms, author) VALUES ("user", "Joueur", "{}", "CFX-ADMIN")')

    _debug('MySQL initialized')
end

initMySQL()

_ENV.mysql = mysql
