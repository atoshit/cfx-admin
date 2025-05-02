---@class Config
---@field debug boolean
---@field locale string
local CONFIG <const> = {
    debug = true,
    locale = 'fr', -- language (fr, en ...)
    deferrals = true,

    -- Menu 
    menu = {
        openKey = 'f10',
        openCommand = 'admin'
    },

    owners = {
       -- 'steam:110000100000000',
       -- 'c7f113abad30c55e970fdd23e075edf7bcb29cc2'
    }
}

_ENV.config = CONFIG
