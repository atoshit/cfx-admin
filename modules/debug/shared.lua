local DEBUG <const> = core.LoadConfig('debug')

---@param type string
---@param message string
local function debug(type, message)
    local level = DEBUG.levels[type]

    if not level then
        return print(message)
    end

    if type == 'debug' and not DEBUG.debug then
        return
    end

    return print(("[%scfx-admin:%s^7] %s"):format(level.color, level.prefix, message))
end

return {
    warn = function(message)
        return debug('warn', message)
    end,
    info = function(message)
        return debug('info', message)
    end,
    debug = function(message)
        return debug('debug', message)
    end
}