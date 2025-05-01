---@param message string
---@return void
local function debug(message)
    if not message or type(message) ~= 'string' or not config.debug then
        return
    end

    return print('^6Debug: ' .. message .. ' ^7')
end

---@param message string
---@return void
local function info(message)
    if not message or type(message) ~= 'string' then
        return
    end

    return print('^4Info: ' .. message .. ' ^7')
end

_ENV._debug = debug
_ENV._info = info