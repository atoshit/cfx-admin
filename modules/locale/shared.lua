local LANG <const> = core.LoadConfig('locale')
local DATA <const> = core.Require('locales.' .. LANG.locale)

---@param key string
---@return string
local function getLocale(key)
    if not DATA then
        print('Locale file not found for ' .. LANG.locale .. ' locale')
        return key
    end

    if not DATA[key] then
        print('Locale key "' .. key .. '" not found for ' .. LANG.locale .. ' locale')
        return key
    end

    return DATA[key]
end

return getLocale