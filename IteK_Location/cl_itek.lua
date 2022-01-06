ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    while (true) do
        
        local coords = GetEntityCoords(PlayerPedId())

        if GetDistanceBetweenCoords(coords, -778.48, -600.19, 30.27, true) < 1.8 then
			ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour louer un véhicule !')
            if IsControlJustPressed(1, 38)  then
                if true then
					TriggerServerEvent('{ IteK#0905 }:buyCar')
					TriggerEvent('esx:showAdvancedNotification', 'TokyoCity', 'Location', 'Vous avez loué un véhicule.~n~~r~ -250¥', 'CHAR_BANK_MAZE', 2)
					Citizen.Wait(1)
					ESX.Game.SpawnVehicle('panto', vector3(-767.41, -592.71, 31.12), 358.63, function(vehicle)
						SetEntityAsMissionEntity(vehicle, true, true)
						SetVehicleNumberPlateText(vehicle, "TOKYO")
					end)
                end
            end                    
        end    
        Citizen.Wait(sleep)
    end
end)


-- Blip --

local blips = {
    {title="Location", colour=4, id=811, x = -778.48, y = -600.19, z = 31.27},

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.80)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

-- Ped --

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_cop_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_cop_01", -778.48, -600.19, 29.27, 358.63, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)