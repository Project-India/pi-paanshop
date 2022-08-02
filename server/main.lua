local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("pi-paanshop:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'paan' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('pi-paanshop:server:get:ingredientMasalaPaan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local supari = Player.Functions.GetItemByName("supari")
    local tobacco = Player.Functions.GetItemByName("tobacco")
    local mint = Player.Functions.GetItemByName("mint")
    local mukhwass = Player.Functions.GetItemByName("mukhwass")
    local paan = Player.Functions.GetItemByName("paan-leaves")
    local chuna = Player.Functions.GetItemByName("chuna")
    if supari ~= nil and tobacco ~= nil and mint ~= nil and mukhwass ~= nil and paan ~= nil and chuna ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('pi-paanshop:server:get:ingredientSweetPaan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local gulkand = Player.Functions.GetItemByName("gulkand")
    local cherry = Player.Functions.GetItemByName("cherry")
    local mint = Player.Functions.GetItemByName("mint")
    local mukhwass = Player.Functions.GetItemByName("mukhwass")
    local paan = Player.Functions.GetItemByName("paan-leaves")
    local chuna = Player.Functions.GetItemByName("chuna")
    if gulkand ~= nil and cherry ~= nil and mint ~= nil and mukhwass ~= nil and paan ~= nil and chuna ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('pi-paanshop:server:get:ingredientChocolatePaan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chocolate = Player.Functions.GetItemByName("chocolate")
    local cherry = Player.Functions.GetItemByName("cherry")
    local mint = Player.Functions.GetItemByName("mint")
    local vanilla = Player.Functions.GetItemByName("vanilla-essence")
    local paan = Player.Functions.GetItemByName("paan-leaves")
    local chuna = Player.Functions.GetItemByName("chuna")
    if chocolate ~= nil and cherry ~= nil and mint ~= nil and vanilla ~= nil and paan ~= nil and chuna ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('pi-paanshop:server:get:ingredientPaanPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local masala = Player.Functions.GetItemByName("masala-paan")
    local sweet = Player.Functions.GetItemByName("sweet-paan")
    local chocolate = Player.Functions.GetItemByName("chocolate-paan")
    if masala ~= nil and sweet ~= nil and chocolate ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateUseableItem("paan-pack", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("pi-paanshop:PaanPack", source, item.name)
end)
