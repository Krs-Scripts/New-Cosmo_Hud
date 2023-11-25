local isDriving = false 
local IsPedRunning = false 
local isUnderwater = false;
local id = 0

local HUD_KRS = 3000


Citizen.CreateThread(function()
    while true do
        if isDriving and IsPedInAnyVehicle(cache.ped, true) then
            local veh = GetVehiclePedIsUsing(cache.ped)
            local fuel = GetVehicleFuelLevel(cache.vehicle)
            local speed = math.floor(GetEntitySpeed(cache.vehicle) * 3.6)
            local maxspeed = GetVehicleModelMaxSpeed(GetEntityModel(cache.vehicle)) * 4.0
        
            SendNUIMessage({speed = speed, maxspeed = maxspeed, fuel = fuel})
            HUD_KRS = 100
        else
            HUD_KRS = 3000
        end
        Citizen.Wait(HUD_KRS)
    end
end)


Citizen.CreateThread(function()
    while true do
        local HUD_KRS = 3000

        if IsPedInAnyVehicle(cache.ped, false) and not IsPedInFlyingVehicle(cache.ped) and not IsPedInAnySub(cache.ped) then
            HUD_KRS = 100
            isDriving = true
        else
            isDriving = false
        end

        SendNUIMessage({showSpeedo = isDriving})
        Citizen.Wait(HUD_KRS)
    end
end)




Citizen.CreateThread(function()
    while true do
        local HUD_KRS = 3000
        
        if IsPedSwimmingUnderWater(cache.ped) then
            HUD_KRS = 1000
            isUnderwater = true
            SendNUIMessage({ showOxygen = true })
        elseif not IsPedSwimmingUnderWater(cache.ped) then
            HUD_KRS = 1000
            isUnderwater = false
            SendNUIMessage({ showOxygen = false })
        end

        
            local p = PlayerId()
            local curStamina = GetPlayerStamina(p)
            local maxStamina = GetPlayerMaxStamina(p)
            if curStamina < maxStamina then
            HUD_KRS = 1000
            SendNUIMessage({ stamina = true })
            IsPedRunning = false
        elseif not isResting then
            IsPedRunning = true
            SendNUIMessage({ stamina = false })
        end
  


        if Config.MostraFameSete == true then
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                hunger = status.val / 10000
            end)

            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                thirst = status.val / 10000
            end)
        end

        if Config.MostraStress == true then
            if IsPedShooting then
            TriggerEvent('esx_status:getStatus', 'stress', function(status) 
            stress = status.val / 1000 end)
        end
    end

        SendNUIMessage({
            action = "update_hud",
            id = GetPlayerServerId(PlayerId()),
            health = GetEntityHealth(cache.ped) - 100,
            armor = GetPedArmour(cache.ped),
            hunger = hunger,
            thirst = thirst,
            stress = stress,
            stamina = GetPlayerStamina(PlayerId()),
            oxygen = math.floor(GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10),
            talking = NetworkIsPlayerTalking(PlayerId())
        })

        Citizen.Wait(HUD_KRS)
    end
end)



Citizen.CreateThread(function()
    while true do
        local HUD_KRS = 3000
        Wait(2000)

        if not Config.MostraMinimappa then
            if IsPedInAnyVehicle(cache.ped, false) and not NascondiCinema then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        elseif Config.MostraMinimappa and not NascondiCinema then
            DisplayRadar(true)
        end

        if not Config.Radio then
            SendNUIMessage({ action = "disable_voice" })
        end

        if Config.MostraCintura then
            if isDriving then
                SendNUIMessage({
                    action = "update_cintura",
                    cintura = cintura,
                    mostracintura = true
                })
            else
                SendNUIMessage({
                    action = "update_cintura",
                    cintura = false,
                    mostracintura = false
                })
            end
        end

        if Config.MostraCruise then
            if isDriving then
                SendNUIMessage({
                    action = "update_cruise",
                    cruise = cruise,
                    mostracruise = true
                })
            else
                SendNUIMessage({
                    action = "update_cruise",
                    cruise = cruise,
                    mostracruise = false
                })
            end
        end

        if Config.MostraCarburante then
            if isDriving and IsPedInAnyVehicle(cache.ped, true) then
                local veh = GetVehiclePedIsUsing(cache.ped, false)
                local fuellevel = GetVehicleFuelLevel(veh)
                SendNUIMessage({
                    action = "update_fuel",
                    fuel = fuellevel,
                    showFuel = true
                })
            else
                SendNUIMessage({ showFuel = false })
            end
        end
    end
end)




-- Funzione per il Cintura
hailacintura = function()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2)
            if cintura then
            DisableControlAction(0, 75, true)
        end
    end 
    end)
end  

local keybind = lib.addKeybind({
    name = Config.ComandoCintura,
	description = 'Cintura',
	defaultKey = Config.TastoCintura,
    onPressed = function(self)

        local p = cache.ped

        local veh = GetVehiclePedIsIn(p, false)
    
        if isDriving and IsPedInAnyVehicle(p, true) then
    
            if GetVehicleClass(cache.vehicle) ~= 8 
            and GetVehicleClass(cache.vehicle) ~= 13 
            and GetVehicleClass(cache.vehicle) ~= 14 
            and GetVehicleClass(cache.vehicle) ~= 15 
            and GetVehicleClass(cache.vehicle) ~= 16 then
    
                cintura = not cintura
                if cintura then
                    hailacintura()
                    playSound('buckle', 0.9)
                    lib.notify({
                        title = 'Notifica Cintura',
                        description = 'Cintura Abilitata',
                        type = 'success'
                    })
                elseif not cintura then
                    playSound('unbuckle', 0.9)
                    SetFlyThroughWindscreenParams(16.0, 19.0, 17.0, 2000.0)
                    lib.notify({
                        title = 'Notifica Cintura',
                        description = 'Cintura disabilitata',
                        type = 'success'
                    })
                end
            end
        end
    end,
})

function playSound(soundFile, soundVolume)
    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = soundFile,
        transactionVolume = soundVolume
    })
end