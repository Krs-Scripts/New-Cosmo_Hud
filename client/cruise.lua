

-- Funzione per il Cruise Control
local keybind = lib.addKeybind({
    name = Config.ComandoCruise,
    description = 'Cruise Control',
    defaultKey = Config.TastoCruise,
    onPressed = function(self)
       
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        
        if IsPedInAnyVehicle(cache.ped, false) then
            if cache.vehicle ~= 0 and GetIsVehicleEngineRunning(cache.vehicle) then
                local currSpeed = GetEntitySpeed(cache.vehicle)
                        
                SetPedConfigFlag(cache.ped, 32, true)
                if (GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped) then
                
                    cruise = not cruise

                    if cruise then
                        if not setCruise then
                            lib.notify({
                                title = 'Notifica Cruise Control',
                                description = 'Cruise control impostato',
                                type = 'success'
                            })
                            SetEntityMaxSpeed(cache.vehicle, currSpeed)
                            setCruise = true
                        end
                    else
                        if setCruise then
                            lib.notify({
                                title = 'Notifica Cruise Control',
                                description = 'Cruise control disattivato',
                                type = 'success'
                            })
                            local maxSpeed = GetVehicleHandlingFloat(cache.vehicle,"CHandlingData", "fInitialDriveMaxFlatVel")
                            SetEntityMaxSpeed(cache.vehicle, maxSpeed)
                            setCruise = false
                        end
                    end
                end
            end
        end
    end,
})