

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    buildSquaredMap()
    buildRoundedMap()
end)


function buildSquaredMap()
    RequestStreamedTextureDict("squaremap", false)
		if not HasStreamedTextureDictLoaded("squaremap") then
			Wait(150)
		end
		SetMinimapClipType(0)
		AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
		AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")


			SetMinimapComponentPosition("minimap", "L", "B", -0.175, -0.007, 0.1638, 0.183)
			SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0, 0.0, 0.128, 0.20)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.175, 0.025, 0.270, 0.300)

			SetMinimapComponentPosition("minimap", "L", "B", -0.175, -0.007, 0.1638, 0.183)
			SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0, 0.0, 0.128, 0.20)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.175, 0.025, 0.270, 0.300)

			SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.007, 0.1638, 0.183)
			SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0, 0.0, 0.128, 0.20)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.0, statusbartype == "old" and 0.0 or 0.025, 0.262, 0.300)


		SetBlipAlpha(GetNorthRadarBlip(), 0)
		SetRadarBigmapEnabled(true, false)
		SetMinimapClipType(0)
		Wait(50)
		SetRadarBigmapEnabled(false, false)
		Wait(1200)
end


function buildRoundedMap()
	local x = -0.025
	local y = -0.015
	local w = 0.16
	local h = 0.20

		RequestStreamedTextureDict("circlemap", false)
		if not HasStreamedTextureDictLoaded("circlemap") then
			Wait(150)
		end

		SetMinimapClipType(1)
		AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

		-- if screen.y == 1080 and screen.x == 2560 then 
			SetMinimapComponentPosition('minimap', 'L', 'B', -0.160, 0.025, w, h)
			SetMinimapComponentPosition('minimap_mask', 'L', 'B', x + 0.17, y + 0.09, 0.072, 0.162)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.175, 0.025, 0.18, 0.22)
		-- elseif screen.y == 1440 and screen.x == 3440 then
			SetMinimapComponentPosition('minimap', 'L', 'B', -0.160, 0.025, w, h)
			SetMinimapComponentPosition('minimap_mask', 'L', 'B', x + 0.17, y + 0.09, 0.072, 0.162)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.175, 0.025, 0.18, 0.22)
		-- else
			SetMinimapComponentPosition('minimap', 'L', 'B', 0.0, y, w, h)
			SetMinimapComponentPosition('minimap_mask', 'L', 'B', x + 0.17, y + 0.09, 0.072, 0.162)
			SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.010, 0.00, 0.18, 0.22)
		-- end

		SetBlipAlpha(GetNorthRadarBlip(), 0)
		SetMinimapClipType(1)
		SetRadarBigmapEnabled(true, false)
		Wait(50)
		SetRadarBigmapEnabled(false, false)
	end

	Wait(2500)

	if IsBigmapActive() then
		SetRadarBigmapEnabled(false, false)
		SetBigmapActive(false, false)
	-- end
end
