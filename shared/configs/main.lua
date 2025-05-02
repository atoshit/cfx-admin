---@class Config
---@field debug boolean
---@field locale string
local CONFIG <const> = {
    debug = true, -- if true, all logs will be displayed in the console
    locale = 'fr', -- language (fr, en ...)
    deferrals = true, -- if true, the player will be redirected to the deferrals menu in connection

    -- Menu 
    menu = {
        openKey = 'f10', -- key to open the menu
        openCommand = 'admin' -- command to open the menu
    },

    owners = {
        'license:2d74177955920fe1366d4cd9b4e6a9f5d95dca14', -- license of the owners
        -- add more owners here
    }
}

_ENV.config = CONFIG
