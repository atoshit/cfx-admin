local SERVICE <const> = (IsDuplicityVersion() and 'server') or 'client'

local module_loaded = {}

---@param path string
---@return any
local function loadModule(path)
    if module_loaded[path] then
        return module_loaded[path]
    end

    local module_path = ("%s.lua"):format(path)
    local module_file = LoadResourceFile(GetCurrentResourceName(), module_path)
    if not module_file then
        error("Failed to find module: "..path)
    end

    module_loaded[path] = load(module_file)()
    return module_loaded[path]
end

---@param path string
---@return any
local function callModule(path)
    path = path:gsub('%.', '/')
    local module = loadModule(path)
    if not module then
        return error("Failed to load module: "..path)
    end
    return module
end

---@param path string
---@return any
local function loadConfig(file)
    return callModule('configs.' .. file)
end

---@param resource string
---@return boolean
local function isResourceStarted(resource)
    if not resource or type(resource) ~= 'string' then return end

    return GetResourceState(resource) == 'started'
end

local CORE_METADATA <const> = {
    -- Variables
    service = SERVICE,

    -- Functions
    LoadConfig = loadConfig,
    Require = callModule,
    IsResourceStarted = isResourceStarted
}

---@class Core
---@field LoadConfig fun(file: string): any
---@field Require fun(path: string): any
---@field IsResourceStarted fun(resource: string): boolean
---@field service string
local core = {}

setmetatable(core, {
    __index = CORE_METADATA,
    __newindex = function(self, key, value)
        rawset(self, key, value)
    end
})