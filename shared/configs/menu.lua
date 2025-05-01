---@class MenuConfig
---@field formatColor string
---@field showHeader boolean
---@field displayGlare boolean
---@field displaySubtitle boolean
---@field displayBackground boolean
---@field displayNavigationBar boolean
---@field displayInstructionalButton boolean
---@field displayPageCounter boolean
---@field titles string
---@field titleFont number
---@field textureDictionary string
---@field textureName string
---@field color table<string, number>
local MENU <const> = {
    formatColor = "purple",
    showHeader = true,
    displayGlare = false,
    displaySubtitle = true,
    displayBackground = true,
    displayNavigationBar = true,
    displayInstructionalButton = true,
    displayPageCounter = true,
    titleFont = 6,
    textureDictionary = "commonmenu",
    textureName = "interaction_bgd",
    color = {
        R = 0,
        G = 0,
        B = 0,
        A = 10
    }
}

_ENV.menu = MENU