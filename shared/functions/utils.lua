---@class Utils
---@field isResourceActive fun(resource: string): boolean
local utils = {}

local moduleLoaded = {}

---@param resource string
---@return boolean
local function isResourceActive(resource)
    if not resource or type(resource) ~= 'string' then return end

    debug('Checking if resource is active ' .. resource)

    return GetResourceState(resource) == 'started'
end

---@param path string
---@return any
local function load_module(path)
    if moduleLoaded[path] then
        return moduleLoaded[path]
    end

    local module_path = ("%s.lua"):format(path)
    local module_file = LoadResourceFile(GetCurrentResourceName(), module_path)
    if not module_file then
        error("Impossible de chargé le module : "..path)
    end

    moduleLoaded[path] = load(module_file)()
    return moduleLoaded[path]
end

---@param path string
---@return any
local function call_module(path)
    path = path:gsub('%.', '/')
    local module = load_module(path)
    if not module then
        return error("Le module n'a pas charger : "..path)
    end
    return module
end

utils.isResourceActive = isResourceActive
utils.require = call_module

_ENV.utils = utils