

-- Funzione menu hud
RegisterCommand(Config.ComandoHud, function()
    if not IsPauseMenuActive() then
        local options = {
            {
                type = 'checkbox',
                label = 'Hide Hud',
                value = NascondiHud
            },
            {
                type = 'checkbox',
                label = 'Round Map',
                value = buildRoundedMap
            },
            {
                type = 'checkbox',
                label = 'Rectangular Map',
                value = buildSquaredMap
            },
            {
                type = 'checkbox',
                label = 'Cinema Mode',
                value = NascondiCinema
            }
        }
        
        local input = lib.inputDialog('Cosmo Hud Settings', options)

        if not input then return end

        if input[1] == true then
            SendNUIMessage({ action = "toggle_hud" })
            NascondiHud = true
            DisplayRadar(false)
   
        else
            NascondiHud = false
            DisplayRadar(true)
        end

        if input[2] == true then
            buildRoundedMap()
        end

        if input[3] == true then
            buildSquaredMap()
        end

        if input[4] == true then
            ExecuteCommand('cinematic')
            SendNUIMessage({ action = "toggle_hud" })
            NascondiCinema = true
        else
            NascondiCinema = false
        end
    end
end, false)
