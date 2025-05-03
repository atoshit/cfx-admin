local QUERIES <const> = {
    getAllRanks = 'SELECT * FROM admin_ranks',
    getAllStaffs = 'SELECT * FROM admin_staffs',
    createRank = 'INSERT INTO admin_ranks (name, label, permissions, power) VALUES (@name, @label, @permissions, @power)',
    createStaff = 'INSERT INTO admin_staffs (license, rank) VALUES (@license, @rank)',
    deleteRank = 'DELETE FROM admin_ranks WHERE name = @name',
    deleteStaff = 'DELETE FROM admin_staffs WHERE license = @license'
}

local function getAllRanks()
    return MySQL.query.await(QUERIES.getAllRanks)
end

core.mysql.getAllRanks = getAllRanks

local function getAllStaffs()
    return MySQL.query.await(QUERIES.getAllStaffs)
end

core.mysql.getAllStaffs = getAllStaffs

---@param admin_ranks table
---@param admin_staffs table
local function saveCachedData(admin_ranks, admin_staffs)
    if not admin_ranks or type(admin_ranks) ~= 'table' or not next(admin_ranks) or not admin_staffs or type(admin_staffs) ~= 'table' or not next(admin_staffs) then
        return
    end

    for k, v in pairs(admin_ranks) do
        local queries = {
            {
                query = QUERIES.deleteRank,
                values = { name = k }
            },
            {
                query = QUERIES.createRank,
                values = { name = k, label = v.label, permissions = json.encode(v.permissions), power = v.power }
            }
        }
        
        MySQL.transaction(queries)
    end

    for k, v in pairs(admin_staffs) do
        local queries = {
            {
                query = QUERIES.deleteStaff,
                values = { license = k }
            },
            {
                query = QUERIES.createStaff,
                values = { license = k, rank = v.rank }
            }
        }
        
        MySQL.transaction(queries)
    end
end

core.mysql.saveCachedData = saveCachedData
