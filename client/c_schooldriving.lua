CreateThread(function()
    for i = 1, #Config.Boss do
        Target():AddBoxZone('driving_boss', Config.Boss[i].Coords, 1.5, 1.5, {
            name = 'driving_boss',
            heading = Config.Boss[i].Coords.w,
            debugPoly = false,
            minZ = Config.Boss[i].Coords.z - 1.0,
            maxZ = Config.Boss[i].Coords.z + 1.0
        }, {
            options = {
                {
                    label = Config.Boss[i].Target_Label,
                    job = Config.Boss[i].Job,
                    icon = Config.Boss[i].Target_Icon,
                    canInteract = function()
                        return true
                    end,
                    action = function()
                        OpenBossMenu(Config.Boss[i].Job)
                    end
                }
            },
            distance = 1.5
        })
    end
    for i = 1, #Config.Stashs do
        Target():AddBoxZone('driving_stash', Config.Stashs[i].Coords, 1.5, 1.5, {
            name = 'driving_stash',
            heading = Config.Stashs[i].Coords.w,
            debugPoly = false,
            minZ = Config.Stashs[i].Coords.z - 1.0,
            maxZ = Config.Stashs[i].Coords.z + 1.0
        }, {
            options = {
                {
                    label = Config.Stashs[i].Target_Label,
                    job = Config.Stashs[i].Job,
                    icon = Config.Stashs[i].Target_Icon,
                    canInteract = function()
                        return true
                    end,
                    action = function()
                        OpenStash(Config.Stashs[i].Name)
                    end
                }
            },
            distance = 1.5
        })
    end
    Target():Player({
        options = {
            {
                label = 'Donner une license',
                job = 'drivingschool',
                icon = 'fas fa-car',
                canInteract = function()
                    return true
                end,
                action = function()
                    local player = ESX.Game.GetClosestPlayer()
                    local LicenseType = {}
                    for _, license in ipairs(Config.LicenseType) do
                        table.insert(LicenseType, {
                            value = license.name,
                            label = license.label
                        })
                    end

                    local input = lib.inputDialog('Give Licenses', {
                        {
                            type = 'select',
                            label = 'Licenses',
                            options = LicenseType,
                            description = 'Sélectionner une license',
                            required = true,
                            placeholder = 'Sélectionner une license',
                            icon = 'fas fa-car',
                        },
                    })

                    if not input then return end

                    local license = input[1]
                    
                    if license then
                        TriggerServerEvent('driving_school:addLicense', license, GetPlayerServerId(player))
                        ESX.ShowNotification('Vous avez donnée une license ! ' .. license)
                    end
                end
            },
            {
                label = 'Donner une facture',
                job = 'drivingschool',
                icon = 'fas fa-car',
                canInteract = function()
                    return true
                end,
                action = function()
                    local input = lib.inputDialog('Donner une facture', { 'Amount' })

                    if input then
                        local amount = tonumber(input[1])

                        if amount == nil or amount < 0 then
                            ESX.ShowNotification('Montant invalide')
                        else
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 4.0 then
                                ESX.ShowNotification('Aucun joueur')
                            else
                                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_drivingschool', 'Permis conduire', amount)
                            end
                        end
                    end
                end
            }
        }
    })
end)
