QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('loginReward:getDailyReward')
AddEventHandler('loginReward:getDailyReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerData = Player.PlayerData
    local lastLogin = PlayerData.metadata['lastLogin'] or 0
    local currentTime = os.time()
    
    
    if currentTime - lastLogin < 86400 then
        TriggerClientEvent('QBCore:Notify', src, "You already claimed your daily reward today.", "error")
        return
    end

    
    Player.Functions.SetMetaData("lastLogin", currentTime)

    
    if Config.Enabled then
        for _, reward in ipairs(Config.Rewards) do
            if reward.item == "money" then
                Player.Functions.AddMoney('cash', reward.amount)
            elseif reward.item == "diamond" then
                Player.Functions.AddItem('diamond', reward.amount)
            end
        end
        TriggerClientEvent('QBCore:Notify', src, Config.RewardMessage, "success")
    end
end)
