if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
    for i = 1, #Config.Boss do
        TriggerEvent('esx_society:registerSociety', Config.Boss[i].Job, Config.Boss[i].Job, 'society_' .. Config.Boss[i].Job, 'society_' .. Config.Boss[i].Job, 'society_' .. Config.Boss[i].Job, { type = 'private' })
    end
end

AddEventHandler('onServerResourceStart', function(resourceName)
    if Config.Inventory == "ox" then
        if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
            for i = 1, #Config.Stashs do
                if Config.Stashs[i].Job then
                    exports.ox_inventory:RegisterStash(Config.Stashs[i].Name, Config.Stashs[i].Label, Config.Stashs[i].Slots, Config.Stashs[i].Weight, nil, { [Config.Stashs[i].Job] = 0 }, Config.Stashs[i].Coords)
                else
                    exports.ox_inventory:RegisterStash(Config.Stashs[i].Name, Config.Stashs[i].Label, Config.Stashs[i].Slots, Config.Stashs[i].Weight, nil, nil, Config.Stashs[i].Coords)
                end
            end
        end
    end
end)
