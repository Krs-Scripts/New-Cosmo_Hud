

if Config.SceltaVocale == 'pma-voice' then
    AddEventHandler("pma-voice:setTalkingMode", function(val)
        SendNUIMessage({ action = "voice_level", voicelevel = val })
        TriggerEvent('esx:showNotification', 'Range impostato a ' .. tostring(val) .. ' metri')
    end)
elseif Config.SceltaVocale == 'saltychat' then
    AddEventHandler("SaltyChat_VoiceRangeChanged", function (val)
        SendNUIMessage({ action = "voice_level", voicelevel = val })
        TriggerEvent('esx:showNotification', 'Range impostato a ' .. tostring(val) .. ' metri')
    end)
else
    print('Sistema di chat vocale non riconosciuto nel config.lua')
end
