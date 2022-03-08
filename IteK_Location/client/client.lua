CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(5000)
    end
end)

-- MENU
local mainMenu = RageUI.CreateMenu("Location", "MENU")
local voiture = RageUI.CreateSubMenu(mainMenu, "Voitures", "MENU")
local moto = RageUI.CreateSubMenu(mainMenu, "Vélos", "MENU")
local open = false

mainMenu.Display.Glare = true
voiture.Display.Glare = true
moto.Display.Glare = true

mainMenu.Closed = function() open = false end

function location()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
        return
    else
        open = true
        RageUI.Visible(mainMenu, true)

        CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Voitures", nil, {RightLabel = "→"}, true, {onActive = function() end}, voiture)
                    RageUI.Button("Vélos", nil, {RightLabel = "→"}, true, {onActive = function() end}, moto)
                end)

                RageUI.IsVisible(voiture, function()
                    RageUI.Button("Asbo", nil, {RightLabel = config.prixvoiture1}, true, {
                        onSelected = function()
                            TriggerServerEvent('IteK:achat', "asbo")
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                    RageUI.Button("Club", nil, {RightLabel = config.prixvoiture2}, true, {
                        onSelected = function()
                            TriggerServerEvent('IteK:achat', "club")
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end)

                RageUI.IsVisible(moto, function()
                    RageUI.Button("BMX", nil, {RightLabel = config.prixmoto1}, true, {
                        onSelected = function()
                            TriggerServerEvent('IteK:achat', "bmx")
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end)

                Wait(0)
            end
        end)
    end
end

CreateThread(function()
    while true do
        local wait = 900

        for _,v in pairs(Config.position) do
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = #(plyCoords - v)
            if dist <= 1.8 then
                wait = 1
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour louer un véhicule !")
                if IsControlJustPressed(1,51) then
                    location()
                end
            end
        end

        Wait(wait)
    end
end)

-- BLIPS
CreateThread(function()
    for _, v in pairs(Config.position) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, config.blipsprite)
        SetBlipDisplay(blip, config.blipdisplay)
        SetBlipScale(blip, config.blipscale)
        SetBlipColour(blip, config.blipcolour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(config.blipname)
        EndTextCommandSetBlipName(blip)
    end
end)

-- PED
CreateThread(function()
    local hash = `g_m_m_korboss_01`
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    local ped = CreatePed("PED_TYPE_CIVFEMALE", hash, -283.4137, -888.6544, 30.0806, 79.9023, false, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, 1)
end)

voiture.Closed = function() end
moto.Closed = function() end
