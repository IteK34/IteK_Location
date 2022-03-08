ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('IteK:achat')
AddEventHandler('IteK:achat', function(vehicleName)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = xPlayer.getMoney()

    if money >= Config[vehicleName].price then
        xPlayer.removeMoney(Config[vehicleName].price)
        SetVehicleNumberPlateText(CreateVehicle(Config[vehicleName].hash, Config[vehicleName].spawn, true, false), "LOCATION")
        TriggerClientEvent('esx:showNotification', _source, "Achat effectué !")
    else
        TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d\'argent")
    end
end)
