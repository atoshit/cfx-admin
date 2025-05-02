local function hasPermission(permission)
    if owner then return true end

    if my_perms[permission] then return true end

    return false
end

_ENV.hasPermission = hasPermission
