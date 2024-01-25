if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
end

Target = function()
    if Config.Target == "qtarget" then
        return exports['qtarget']
    end
    if Config.Target == "ox_target" then
        return exports['qtarget']
    end
end

OpenStash = function(stash)
    if Config.Inventory == "ox" then
        exports.ox_inventory:openInventory('stash', stash)
    elseif Config.Inventory == "quasar" then
        local data = nil
        for _, stashData in pairs(Config.Stashs) do
            if stashData.name == stash then
                data = stashData
                break
            end
        end
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
            maxweight = data.Weight,
            slots = data.Slots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "chezza" then
        TriggerEvent('inventory:openStorage', "Stash", "stash"..stash, 100, 1000, nil)
    end
end

OpenBossMenu = function(job)
    if Config.BossMenu == "esx_society" then
        TriggerEvent('esx_society:openBossMenu', job, function(data, menu)
        end, { wash = false })
    end
end