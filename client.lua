RegisterCommand('claimreward', function()
    if Config.Enabled then
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'openDailyReward' })
    else
        TriggerEvent('QBCore:Notify', 'Daily rewards system is disabled.', 'error')
    end
end)

RegisterNUICallback('closeUI', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('claimReward', function()
    TriggerServerEvent('loginReward:getDailyReward')
    SetNuiFocus(false, false)
end)
