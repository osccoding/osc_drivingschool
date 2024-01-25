RegisterNetEvent('driving_school:addLicense')
AddEventHandler('driving_school:addLicense', function(type, target)
    if type == nil or target == nil then return end 

    TriggerEvent('esx_license:addLicense', target, type, function()
        TriggerClientEvent('esx:showNotification', target, "Vous avez recu " .. type)
    end)
end)
