local SERVICE <const> = (IsDuplicityVersion() and 'server') or 'client'

if utils.isResourceActive('es_extended') then
    bridge = utils.require('bridge.esx.' .. SERVICE)
    info('ESX bridge loaded')
elseif utils.isResourceActive('qb-core') then
    bridge = utils.require('bridge.qb.' .. SERVICE)
    info('QBCore bridge loaded')
else
    error('No compatible framework found')
end

_ENV.bridge = bridge