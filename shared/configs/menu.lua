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
    formatColor = "purple", -- color of the menu
    showHeader = true, -- if true, the header will be displayed
    displayGlare = false, -- if true, the glare will be displayed
    displaySubtitle = true, -- if true, the subtitle will be displayed
    displayBackground = true, -- if true, the background will be displayed
    displayNavigationBar = true, -- if true, the navigation bar will be displayed
    displayInstructionalButton = true, -- if true, the instructional button will be displayed
    displayPageCounter = true, -- if true, the page counter will be displayed
    titleFont = 6, -- font of the titles
    textureDictionary = "commonmenu", -- texture dictionary of the menu
    textureName = "interaction_bgd", -- texture name of the menu
    color = {
        R = 0, -- red color
        G = 0, -- green color
        B = 0, -- blue color
        A = 10 -- alpha color
    }
}

_ENV.menu = MENU