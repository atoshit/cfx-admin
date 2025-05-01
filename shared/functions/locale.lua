local DATA <const> = utils.require('locales.' .. config.locale)

---@param key string
---@return string
local function locale(key)
    if not type(key) == 'string' then
       return  error('Locale key must be a string')
    end

    if not DATA then return key end

    if not DATA[key] then return key end

    return DATA[key]
end

_ENV.locale = locale