ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('{ IteK#0905 }:buyCar')
AddEventHandler('{ IteK#0905 }:buyCar', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(250)
end)