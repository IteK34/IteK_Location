ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('IteK:achatAsbo')
AddEventHandler('IteK:achatAsbo', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 250
    local money = xPlayer.getMoney()

    if money >= prix then
        xPlayer.removeMoney(price)
        SetVehicleNumberPlateText(CreateVehicle(GetHashKey("asbo"), -309.3480, -897.6269, 31.0806, 347.9820, true, false), "LOCATION")
        TriggerClientEvent('esx:showNotification', _source, "Achat effectué !")
    else
        TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d\'argent")
    end
end)

RegisterNetEvent('IteK:achatClub')
AddEventHandler('IteK:achatClub', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 125
    local money = xPlayer.getMoney()

    if money >= price then
        xPlayer.removeMoney(price)
        SetVehicleNumberPlateText(CreateVehicle(GetHashKey("club"), -312.9246, -896.8875, 31.0752, 347.5302, true, false), "LOCATION")
        TriggerClientEvent('esx:showNotification', _source, "Achat effectué !")
    else
        TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d\'argent")
    end
end)

RegisterNetEvent('IteK:achatBMX')
AddEventHandler('IteK:achatBMX', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    local money = xPlayer.getMoney()

    if money >= price then
        xPlayer.removeMoney(price)
        SetVehicleNumberPlateText(CreateVehicle(GetHashKey("bmx"), -285.7448, -887.2358, 31.0806, 171.4600, true, false), "LOCATION")
        TriggerClientEvent('esx:showNotification', _source, "Achat effectué !")
    else
        TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d\'argent")
    end
end)