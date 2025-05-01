---@class Config
---@field debug boolean
---@field locale string
local CONFIG <const> = {
    debug = true,
    locale = 'fr' -- language (fr, en ...)
}

_ENV.config = CONFIG
