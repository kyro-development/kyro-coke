local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent('kyro-coke:server:Bagcoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke = Player.Functions.GetItemByName('coke')
    local bags = Player.Functions.GetItemByName('empty_weed_bag')
    
    if Player.PlayerData.items ~= nil then
        if coke ~= nil and bags ~= nil then
            if coke.amount >= Config.cokesNeeded and bags.amount >= Config.BagsNeeded then
                TriggerClientEvent("kyro-coke:client:BagcokebaggyMinigame", src)
            else
                local errorText = "You need "..Config.cokesNeeded.." Coke Brick and "..Config.BagsNeeded.." ziploc bags."
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "BAG IT UP", errorText, 3500, 'error')
                end
            end
        else
            local errorText = "You need "..Config.cokesNeeded.." Coke Brick and "..Config.BagsNeeded.." ziploc bags."
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "BAG IT UP", errorText, 3500, 'error')
            end
        end
    end
end)

----------
--OUTPUT--
----------

--LEVEL 0

RegisterServerEvent('kyro-coke:server:receivecoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel0low, Config.cokelevel0high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
   Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 1

RegisterServerEvent('kyro-coke:server:receivecokelevel1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel1low, Config.cokelevel1high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 2

RegisterServerEvent('kyro-coke:server:receivecokelevel2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel2low, Config.cokelevel2high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 3

RegisterServerEvent('kyro-coke:server:receivecokelevel3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel3low, Config.cokelevel3high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 4

RegisterServerEvent('kyro-coke:server:receivecokelevel4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel4low, Config.cokelevel4high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 5

RegisterServerEvent('kyro-coke:server:receivecokelevel5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel5low, Config.cokelevel5high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 6

RegisterServerEvent('kyro-coke:server:receivecokelevel6', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel6low, Config.cokelevel6high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 7

RegisterServerEvent('kyro-coke:server:receivecokelevel7', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel7low, Config.cokelevel7high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
                        Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

--LEVEL 8

RegisterServerEvent('kyro-coke:server:receivecokelevel8', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel8low, Config.cokelevel8high)
    Player.Functions.AddItem("cokebaggy", quantity, false)
                Player.Functions.RemoveItem("empty_weed_bag", quantity, false)
                Player.Functions.RemoveItem("coke", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['empty_weed_bag'], "remove", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add", quantity)
end)

RegisterNetEvent("kyro-coke:server:addcoke",function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantum = 0
    local amount = math.random(1, 100)
    if amount <= Config.Doublechance then
        quantum = 2
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Nice! This coke has two heads!", "success", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "DUAL cokeS", "Nice! This coke has two heads!", 3500, 'success')
        end
    else
        quantum = 1
    end
    Wait(3000)
    Player.Functions.AddItem('coca_leaf', quantum)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coca_leaf"], "add", quantum)
end)

RegisterNetEvent("kyro-coke:server:removeGlovesSuccess", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tear = math.random(1, 100)
    if tear <= Config.GloveTearSuccessChance then
        Player.Functions.RemoveItem('gardengloves', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["gardengloves"], "remove", 1)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Darn, your gloves tore!", "success", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "TORN GLOVES", "Darn, your gloves tore!", 3500, 'success')
        end
    end
end)

RegisterNetEvent("kyro-coke:server:removeGlovesFail", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tear = math.random(1, 100)
    if tear <= Config.GloveTearFailChance then
        Player.Functions.RemoveItem('gardengloves', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["gardengloves"], "remove", 1)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "A slip of the hand and your gloves tear...", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "TORN GLOVES", "A slip of the hand and your gloves tear...", 3500, 'error')
        end
    elseif tear > Config.GloveTearFailChance then 
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You need to be careful, this fabric won't hold...", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "GARDENING GLOVES", "You need to be careful, this fabric won't hold...", 3500, 'error')
        end
    end
end)
io.write("\027[1;92m")
io.write([[
  _  ____   ______   ___  
 | |/ /\ \ / /  _ \ / _ \ 
 | ' /  \ V /| |_) | | | |
 | . \   | | |  _ <| |_| |
 |_|\_\  |_| |_| \_\\___/ 

]])
io.write("\027[0m")

RegisterServerEvent('kyro-coke:server:processcoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke = Player.Functions.GetItemByName('coca_leaf')
    local bags = Player.Functions.GetItemByName('bakingsoda')
    
    if Player.PlayerData.items ~= nil then
        if coke ~= nil and bags ~= nil then
            if coke.amount >= Config.cokesNeeded and bags.amount >= Config.SodaNeeded then
                TriggerClientEvent("kyro-coke:client:processcokeMinigame", src)
            else
                local errorText = "You need "..Config.cokesNeeded.." Cocaine"..Config.SodaNeeded.." Baking Soda."
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "Cut IT UP", errorText, 3500, 'error')
                end
            end
        else
            local errorText = "You need "..Config.cokesNeeded.." Cocaine "..Config.SodaNeeded.." Baking Soda."
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "Cut IT UP", errorText, 3500, 'error')
            end
        end
    end
end)

----------
--OUTPUT--
----------

--LEVEL 0

RegisterServerEvent('kyro-coke:server:receivecocaine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel0low, Config.cokelevel0high)
    Player.Functions.AddItem("coke", quantity, false)
   Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 1

RegisterServerEvent('kyro-coke:server:receivecocainelevel1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel1low, Config.cokelevel1high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 2

RegisterServerEvent('kyro-coke:server:receivecocainelevel2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel2low, Config.cokelevel2high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 3

RegisterServerEvent('kyro-coke:server:receivecocainelevel3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel3low, Config.cokelevel3high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 4

RegisterServerEvent('kyro-coke:server:receivecocainelevel4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel4low, Config.cokelevel4high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 5

RegisterServerEvent('kyro-coke:server:receivecocainelevel5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel5low, Config.cokelevel5high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 6

RegisterServerEvent('kyro-coke:server:receivecocainelevel6', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel6low, Config.cokelevel6high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 7

RegisterServerEvent('kyro-coke:server:receivecocainelevel7', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel7low, Config.cokelevel7high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
                        Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

--LEVEL 8

RegisterServerEvent('kyro-coke:server:receivecocainelevel8', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(Config.cokelevel8low, Config.cokelevel8high)
    Player.Functions.AddItem("coke", quantity, false)
                Player.Functions.RemoveItem("bakingsoda", Config.SodaNeeded)
                Player.Functions.RemoveItem("coca_leaf", Config.cokesNeeded)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coca_leaf'], "remove", Config.cokesNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bakingsoda'], "remove", Config.SodaNeeded)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke'], "add", quantity)
end)

----------
------cokebrick----------
----------



CreateThread(function()
    local usable_item_name = "coke_brick"
    local reward_item_name = "coke"

    QBCore.Functions.CreateUseableItem(usable_item_name, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)

        if Player.Functions.AddItem(reward_item_name, 100) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward_item_name], "add")
            TriggerClientEvent('QBCore:Notify', src, 'You received 100 ' .. QBCore.Shared.Items[reward_item_name]['label'] .. '!', 'success')
         else
        Player.Functions.AddItem(usable_item_name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[useable_item_name], "add", 100)
            return
        end
    end)
end)


RegisterServerEvent('kyro-coke:server:Brickcoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke = Player.Functions.GetItemByName('coke')
    local tape = Player.Functions.GetItemByName('ducttape')
    
    if Player.PlayerData.items ~= nil then
        if coke ~= nil and tape ~= nil then
            if coke.amount >= Config.cocainebrickNeeded and tape.amount >= 1 then
                TriggerClientEvent("kyro-coke:client:brickcokeMinigame", src)
            else
                local errorText = "You need  100 cokes and a roll of tape."
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "Brick IT UP", errorText, 3500, 'error')
                end
            end
        else
            local errorText = "You need  100 coke and a roll of tape"
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, errorText, 'error')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "Brick IT UP", errorText, 3500, 'error')
            end
        end
    end
end)

RegisterServerEvent('kyro-coke:server:receivebrick', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = 1
    Player.Functions.AddItem("coke_brick", quantity, false) -- Fixed typo: "coke_bick" to "coke_brick"
    Player.Functions.RemoveItem("coke", Config.cocainebrickNeeded)
    Player.Functions.RemoveItem("ducttape", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke'], "remove", Config.cocainebrickNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['ducttape'], "remove", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke_brick'], "add", quantity)
end)


