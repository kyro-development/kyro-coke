local QBCore = exports['qb-core']:GetCoreObject()
local cokeSpawns = {}

local isPickingcoke = false
local withincokeZone = false 

local spawnedcokes = 0
local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttempts = 0

CreateThread(function()
    exports['qb-target']:AddBoxZone("BagCoke", vector3(-1371.22, -313.37, 40.26), 2.2, 1, {
        name = "BagCoke",
        heading = 0,
        debugPoly = false,
        minZ = 37.0,
        maxZ = 42.0,
    }, {
        options = {
            {
                type = "client",
                event = "kyro-coke:client:Bagcokebaggy",
                icon = 'fas fa-pills',
                label = 'Fill coke Bag'
            },
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("BrickCoke", vector3(-1367.32, -309.31, 39.5), 2.2, 1, {
        name = "BrickCoke",
        heading = 0,
        debugPoly = false,
        minZ = 37.0,
        maxZ = 42.0,
    }, {
        options = {
            {
                type = "client",
                event = "kyro-coke:client:brickcoke",
                icon = 'fas fa-pills',
                label = 'Brick Coke'
            },
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("GetcokeBag2", vector3(-328.23, -2439.98, 8.07), 2.2, 1, {
        name = "GetcokeBag2",
        heading = 0,
        debugPoly = false,
        minZ = 7.0,
        maxZ = 11.0,
    }, {
        options = {
            {
                type = "client",
                event = "kyro-coke:client:Bagcokebaggy",
                icon = 'fas fa-pills',
                label = 'Fill coke Bag'
            },
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("Cokeleaf", vector3(-1365.93, -320.36, 40.16), 2.2, 1, {
        name = "cokeleaf",
        heading = 0,
        debugPoly = false,
        minZ = 39.0,
        maxZ = 42.0,
    }, {
        options = {
            {
                type = "client",
                event = "kyro-coke:client:processcoke",
                icon = 'fas fa-pills',
                label = 'Process Plants'
            },
        },
        distance = 1.5,
    })
end)

RegisterNetEvent('kyro-coke:client:Bagcokebaggy', function()
    if QBCore.Functions.HasItem("coke") then
        if QBCore.Functions.HasItem("empty_weed_bag") then
            TriggerServerEvent("kyro-coke:server:Bagcoke")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["empty_weed_bag"]["name"], image = QBCore.Shared.Items["empty_weed_bag"]["image"]},
            }
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You atleast 15 ziplocs and some cocaine.", "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("BAG IT UP", "You atleast 15 ziplocs and some cocaine..", 3500, "error")
            end
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["coke"]["name"], image = QBCore.Shared.Items["coke"]["image"]},
        }
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You atleast 15 ziplocs and some cocaine..", "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("BAG IT UP", "You atleast 15 ziplocs and some cocaine.", 3500, "error")
        end
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('kyro-coke:client:BagcokebaggyMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    if Config.skillcheck then
        BagcokebaggyMinigame(source)
    elseif not Config.skillcheck then
        BagcokebaggyProcess()
    else
        print("You have not configured 'Config.skillcheck', please check kyro-coke/config.lua")
    end
end)

function BagcokebaggyMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(Config.BagcokesLow, Config.BagcokesHigh)
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1400, 1500),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            BagcokebaggyProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('You weigh out the correct product and bag it up.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("BAGGING coke", "You weigh out the correct product and bag it up.", 3500, "success")
            end
            Wait(500)
            if Config.mzskills then
                local BetterXP = math.random(Config.drugXPlow, Config.drugXPhigh)
                local multiplier = math.random(1, 4)
                local skillup
                if multiplier > 3 then
                    skillup = BetterXP
                else
                    skillup = Config.drugXPlow
                end
                exports["mz-skills"]:UpdateSkill("Drug Manufacture", skillup)
            end
            FailedAttempts = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1200, 1500),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You fumble and drop the coke...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("PRODUCT RUINED!", "You fumble and drop the coke...", 3500, "error")
        end
        Wait(500)
        if Config.mzskills then
            local deteriorate = -Config.drugXPloss
            exports["mz-skills"]:UpdateSkill("Drug Manufacture", deteriorate)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('-'..Config.drugXPloss..' XP to Drug Manufacture', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SKILLS", '-'..Config.drugXPloss..' XP to Drug Manufacture', 3500, "error")
            end
        end
        FailedAttempts = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function BagcokebaggyProcess()
    local bagcokebaggytime = math.random(Config.BagcokesTimeLow, Config.BagcokesTimeHigh)
    QBCore.Functions.Progressbar("grind_coke", "Bagging up product...", (bagcokebaggytime * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if Config.mzskills then
    exports["mz-skills"]:CheckSkill("Drug Manufacture", 12800, function(hasskill)
if hasskill then
    TriggerServerEvent('kyro-coke:server:receivecokelevel8')
else
    exports["mz-skills"]:CheckSkill("Drug Manufacture", 6400, function(hasskill)
        if hasskill then
            TriggerServerEvent('kyro-coke:server:receivecokelevel7')
        else
            exports["mz-skills"]:CheckSkill("Drug Manufacture", 3200, function(hasskill)
                if hasskill then
                    TriggerServerEvent('kyro-coke:server:receivecokelevel6')
                else
                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 1600, function(hasskill)
                        if hasskill then
                            TriggerServerEvent('kyro-coke:server:receivecokelevel5')
                        else
                            exports["mz-skills"]:CheckSkill("Drug Manufacture", 800, function(hasskill)
                                if hasskill then
                                    TriggerServerEvent('kyro-coke:server:receivecokelevel4')
                                else
                                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 400, function(hasskill)
                                        if hasskill then
                                            TriggerServerEvent('kyro-coke:server:receivecokelevel3')
                                        else
                                            exports["mz-skills"]:CheckSkill("Drug Manufacture", 200, function(hasskill)
                                                if hasskill then
                                                    TriggerServerEvent('kyro-coke:server:receivecokelevel2')
                                                else
                                                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 100, function(hasskill)
                                                        if hasskill then
                                                            TriggerServerEvent('kyro-coke:server:receivecokelevel1')
                                                        else
                                                            TriggerServerEvent('kyro-coke:server:receivecoke')
                                                                        end
                                                                    end)
                                                                end
                                                            end)
                                                        end
                                                    end)
                                                end
                                            end)
                                        end
                                    end)
                                end
                            end)
                        end
                    end)
                end
            end)
        elseif not Config.mzskills then
            TriggerServerEvent('kyro-coke:server:receivecokeNoXP')
        else
            print("You have not configured 'Config.mzskills' properly, please refer to config.lua")
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Process Cancelled', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Process Cancelled", 3500, "error")
        end
    end)
end


------------------
---PICK cokeS---
------------------

exports['qb-target']:AddTargetModel(Config.cokeProp, {
	options = {
		{
			event = "kyro-coke:client:harvestcoke",
			icon = "fas fa-seedling",
			label = "Pick coke",
		},
	},
	distance = 2.0
}) 

RegisterNetEvent('kyro-coke:client:harvestcoke', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #cokeSpawns, 1 do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(cokeSpawns[i]), false) < 6.2 then
			nearbyObject, nearbyID = cokeSpawns[i], i
		end
	end
    if withincokeZone then 
        if Config.UseGloves then 
            if QBCore.Functions.HasItem("gardengloves") then
                if not isPickingcoke then 
                    if nearbyObject and IsPedOnFoot(playerPed) then
                        isPickingcoke = true
                        PrepareAnimcoke()
                        PickcokeMiniGame()
                        ClearPedTasks(playerPed)
                        if Config.SkillUse == 'skillbar' then 
                            Wait(4000)
                        end 
                        DeleteObject(nearbyObject) 
                        table.remove(cokeSpawns, nearbyID)
                        isPickingcoke = false
                        spawnedcokes = spawnedcokes - 2
                    else
                        if Config.NotifyType == 'qb' then
                            QBCore.Functions.Notify('You are too far away from this coke... Get closer.', "error", 3500)
                        elseif Config.NotifyType == "okok" then
                            exports['okokNotify']:Alert("CAN'T PICK", "You are too far away from this coke... Get closer.", 3500, "error")
                        end 
                    end
                elseif isPickingcoke then 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You are already doing something...', "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("CAN'T PICK", "You are already doing something...", 3500, "error")
                    end
                end 
            else
                local requiredItems = {
                    [1] = {name = QBCore.Shared.Items["gardengloves"]["name"], image = QBCore.Shared.Items["gardengloves"]["image"]},
                }  
                if Config.NotifyType == 'qb' then
                    QBCore.Functions.Notify('These cokes look poisonous, better use gloves.', "error", 3500)
                elseif Config.NotifyType == "okok" then
                    exports['okokNotify']:Alert("NEED GLOVES", "These cokes look poisonous, better use gloves.", 3500, "error")
                end   
                TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                Wait(3000)
                TriggerEvent('inventory:client:requiredItems', requiredItems, false)
            end
        else 
            if not isPickingcoke  then 
                if nearbyObject and IsPedOnFoot(playerPed) then
                    isPickingcoke = true
                    PrepareAnimcoke()
                    PickcokeMiniGame()
                    ClearPedTasks(playerPed)
                    if Config.SkillUse == 'skillbar' then 
                        Wait(4000)
                    end 
                    DeleteObject(nearbyObject) 
                    table.remove(cokeSpawns, nearbyID)
                    isPickingcoke = false
                    spawnedcokes = spawnedcokes - 1
                else
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('This coke cannot be picked?', "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("CAN'T PICK", "This coke cannot be picked?", 3500, "error")
                    end 
                end
            elseif isPickingcoke then 
                if Config.NotifyType == 'qb' then
                    QBCore.Functions.Notify('You are already doing something...', "error", 3500)
                elseif Config.NotifyType == "okok" then
                    exports['okokNotify']:Alert("CAN'T PICK", "You are already doing something...", 3500, "error")
                end
            end
        end
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('These cannot be harvested...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("WRONG cokeS", "These cannot be harvested...", 3500, "error")
        end  
    end
end)

function PrepareAnimcoke()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, true)
    PreparingAnimCheckcoke()
end

function PreparingAnimCheckcoke()
    cokepicking = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            if cokepicking then
				Wait(1)
            else
                ClearPedTasksImmediately(ped)
                break
            end
            Citizen.Wait(200)
        end
    end)
end

function PickcokeMiniGame()
    if Config.skillcheck then 
        if Config.SkillUse == 'ps-ui' then
            exports['ps-ui']:Circle(function(success)
                if success then
                    Wait(1400)
                    TriggerServerEvent('kyro-coke:server:addcoke')
                    Wait(4500)
                    cokepicking = false
                    if Config.UseGloves then
                        TriggerServerEvent('kyro-coke:server:removeGlovesSuccess')
                    end
                else
                    if Config.UseGloves then
                        TriggerServerEvent('kyro-coke:server:removeGlovesFail')
                    end
                end
            end, Config.cokeskillCheck, Config.cokeskillTime)
        elseif Config.SkillUse == 'skillbar' then
            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
            Skillbar.Start({
                duration = Config.SkillbarDuration, -- how long the skillbar runs for
                pos = Config.SkillbarPos, -- how far to the right the static box is
                width = Config.SkillbarWidth, -- how wide the static box is
            }, function()
                Wait(1400)
                TriggerServerEvent('kyro-coke:server:addcoke')
                Wait(4500)
                cokepicking = false
                if Config.UseGloves then
                    exports["mz-skills"]:UpdateSkill("Drug Manufacture", deteriorate)
                    TriggerServerEvent('kyro-coke:server:removeGlovesSuccess')
                end
            end, function()
                if Config.UseGloves then
                    TriggerServerEvent('kyro-coke:server:removeGlovesFail')
                end
            end) 
        end 
    else 
        Wait(1400)
        TriggerServerEvent('kyro-coke:server:addcoke')
        Wait(4500)
        cokepicking = false
        if Config.UseGloves then
            TriggerServerEvent('kyro-coke:server:removeGlovesSuccess')
        end
    end
end




---------------------------
--coke leaf FUNCTIONS--
---------------------------



RegisterNetEvent('kyro-coke:client:processcoke', function()
    if QBCore.Functions.HasItem("coca_leaf") then
        if QBCore.Functions.HasItem("bakingsoda") then
            TriggerServerEvent("kyro-coke:server:processcoke")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["bakingsoda"]["name"], image = QBCore.Shared.Items["bakingsoda"]["image"]},
            }
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You need Baking Soda.", "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("Cut IT UP", "You Baking Soda.", 3500, "error")
            end
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["coca_leaf"]["name"], image = QBCore.Shared.Items["coca_leaf"]["image"]},
        }
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You need cokebaggy and a bag.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("Cut IT UP", "You need Baking Soda.", 3500, "error")
        end
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('kyro-coke:client:processcokeMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    if Config.skillcheck then
        processcokeMinigame(source)
    elseif not Config.skillcheck then
        processcokeProcess()
    else
        print("You have not configured 'Config.skillcheck', please check kyro-coke/config.lua")
    end
end)

function processcokeMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(Config.BagcokesLow, Config.BagcokesHigh)
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1400, 1500),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            processcokeProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('You cut up the correct product and cut it up.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("Processing coke", "You weigh out the correct product and cut it up.", 3500, "success")
            end
            Wait(500)
            if Config.mzskills then
                local BetterXP = math.random(Config.drugXPlow, Config.drugXPhigh)
                local multiplier = math.random(1, 4)
                local skillup
                if multiplier > 3 then
                    skillup = BetterXP
                else
                    skillup = Config.drugXPlow
                end
                exports["mz-skills"]:UpdateSkill("Drug Manufacture", skillup)
            end
            FailedAttempts = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1200, 1500),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You fumble and drop the coke...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("PRODUCT RUINED!", "You fumble and drop the coke...", 3500, "error")
        end
        Wait(500)
        if Config.mzskills then
            local deteriorate = -Config.drugXPloss
            exports["mz-skills"]:UpdateSkill("Drug Manufacture", deteriorate)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('-'..Config.drugXPloss..' XP to Drug Manufacture', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SKILLS", '-'..Config.drugXPloss..' XP to Drug Manufacture', 3500, "error")
            end
        end
        FailedAttempts = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function processcokeProcess()
    local processcoketime = math.random(Config.BagcokesTimeLow, Config.BagcokesTimeHigh)
    QBCore.Functions.Progressbar("grind_coke", "Cutting up plants...", (processcoketime * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if Config.mzskills then
    exports["mz-skills"]:CheckSkill("Drug Manufacture", 12800, function(hasskill)
if hasskill then
    TriggerServerEvent('kyro-coke:server:receivecocainelevel8')
else
    exports["mz-skills"]:CheckSkill("Drug Manufacture", 6400, function(hasskill)
        if hasskill then
            TriggerServerEvent('kyro-coke:server:receivecocainelevel7')
        else
            exports["mz-skills"]:CheckSkill("Drug Manufacture", 3200, function(hasskill)
                if hasskill then
                    TriggerServerEvent('kyro-coke:server:receivecocainelevel6')
                else
                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 1600, function(hasskill)
                        if hasskill then
                            TriggerServerEvent('kyro-coke:server:receivecocainelevel5')
                        else
                            exports["mz-skills"]:CheckSkill("Drug Manufacture", 800, function(hasskill)
                                if hasskill then
                                    TriggerServerEvent('kyro-coke:server:receivecocainelevel4')
                                else
                                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 400, function(hasskill)
                                        if hasskill then
                                            TriggerServerEvent('kyro-coke:server:receivecocainelevel3')
                                        else
                                            exports["mz-skills"]:CheckSkill("Drug Manufacture", 200, function(hasskill)
                                                if hasskill then
                                                    TriggerServerEvent('kyro-coke:server:receivecocainelevel2')
                                                else
                                                    exports["mz-skills"]:CheckSkill("Drug Manufacture", 100, function(hasskill)
                                                        if hasskill then
                                                            TriggerServerEvent('kyro-coke:server:receivecocainelevel1')
                                                        else
                                                            TriggerServerEvent('kyro-coke:server:receivecocaine')
                                                                        end
                                                                    end)
                                                                end
                                                            end)
                                                        end
                                                    end)
                                                end
                                            end)
                                        end
                                    end)
                                end
                            end)
                        end
                    end)
                end
            end)
        elseif not Config.mzskills then
            TriggerServerEvent('kyro-coke:server:receivecocaineNoXP')
        else
            print("You have not configured 'Config.mzskills' properly, please refer to config.lua")
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Process Cancelled', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Process Cancelled", 3500, "error")
        end
    end)
end


---------------------------
--cokeS FIELD FUNCTIONS--
---------------------------

CreateThread(function()
	while true do
		Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords, Config.cokeField, true) < 50 then
			SpawncokeSpawns()
            withincokeZone = true 
			Wait(500)
		else
			withincokeZone = false 
            Wait(3000)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(cokeSpawns) do
			DeleteObject(v)
		end
	end
end)

function SpawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cb then
        cb(obj)
    end
end

function SpawncokeSpawns()
	while spawnedcokes < 15 do
		Wait(1)
		local placementCoords = GeneratecokeCoords()
		SpawnObject('h4_prop_bush_cocaplant_01', placementCoords, function(obj)
			table.insert(cokeSpawns, obj)
			spawnedcokes = spawnedcokes + 1
		end)
	end
end 

function ValidatecokeCoord(cokeCoord)
	if spawnedcokes > 0 then
		local validate = true
		for k, v in pairs(cokeSpawns) do
			if GetDistanceBetweenCoords(cokeCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end
		if GetDistanceBetweenCoords(cokeCoord, Config.cokeField, false) > 50 then
			validate = false
		end
		return validate
	else
		return true
	end
end

function GeneratecokeCoords()
	while true do
		Wait(1)
		local cokeyCoordX, cokeyCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-22, 22)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-22, 22)
		cokeyCoordX = Config.cokeField.x + modX
		cokeyCoordY = Config.cokeField.y + modY
		local coordZ = GetCoordZcokes(cokeyCoordX, cokeyCoordY)
		local coord = vector3(cokeyCoordX, cokeyCoordY, coordZ)
		if ValidatecokeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZcokes(x, y)
	local groundCheckHeights = { (Config.cokeRounded - 4), (Config.cokeRounded - 3), (Config.cokeRounded - 2), (Config.cokeRounded - 1), Config.cokeRounded, (Config.cokeRounded + 1), (Config.cokeRounded + 2), (Config.cokeRounded + 3), (Config.cokeRounded + 4), (Config.cokeRounded + 5), (Config.cokeRounded + 6) }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return Config.cokeHeight
end

RegisterNetEvent('kyro-coke:client:brickcoke', function()
    if QBCore.Functions.HasItem("coke") then
        if QBCore.Functions.HasItem("ducttape") then
            TriggerServerEvent("kyro-coke:server:Brickcoke")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["ducttape"]["name"], image = QBCore.Shared.Items["ducttape"]["image"]},
            }
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You atleast 15 ziplocs and some cocaine.", "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("brick IT UP", "You atleast 100 coker and some tape..", 3500, "error")
            end
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["coke"]["name"], image = QBCore.Shared.Items["coke"]["image"]},
        }
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You atleast 15 ziplocs and some cocaine..", "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("Brick IT UP", "You atleast 100 cokes and some tape.", 3500, "error")
        end
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('kyro-coke:client:brickcokeMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    if Config.skillcheck then
        brickcokeMinigame(source)
    elseif not Config.skillcheck then
        brickcokeProcess()
    else
        print("You have not configured 'Config.skillcheck', please check kyro-coke/config.lua")
    end
end)

function brickcokeMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(Config.BagcokesLow, Config.BagcokesHigh)
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1400, 1500),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            BrickcokeProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('You cut up the correct product and cut it up.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("Processing coke", "You weigh out the correct product and cut it up.", 3500, "success")
            end
            Wait(500)
            if Config.mzskills then
                local BetterXP = math.random(Config.drugXPlow, Config.drugXPhigh)
                local multiplier = math.random(1, 4)
                local skillup
                if multiplier > 3 then
                    skillup = BetterXP
                else
                    skillup = Config.drugXPlow
                end
                exports["mz-skills"]:UpdateSkill("Drug Manufacture", skillup)
            end
            FailedAttempts = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1200, 1500),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You fumble and drop the coke...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("PRODUCT RUINED!", "You fumble and drop the coke...", 3500, "error")
        end
        Wait(500)
        if Config.mzskills then
            local deteriorate = -Config.drugXPloss
            exports["mz-skills"]:UpdateSkill("Drug Manufacture", deteriorate)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('-'..Config.drugXPloss..' XP to Drug Manufacture', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SKILLS", '-'..Config.drugXPloss..' XP to Drug Manufacture', 3500, "error")
            end
        end
        FailedAttempts = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function BrickcokeProcess()
    local processcoketime = math.random(Config.BagcokesTimeLow, Config.BagcokesTimeHigh)
    QBCore.Functions.Progressbar("grind_coke", "Bricking Product", (processcoketime * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if Config.mzskills then
            exports["mz-skills"]:CheckSkill("Drug Manufacture", 12800, function(hasskill)
                if hasskill then
                    -- Player has skill in "Drug Manufacture," trigger event with success
                    TriggerServerEvent('kyro-coke:server:receivebrick')
                else
                    -- Player doesn't have skill, trigger event with no XP received
                    TriggerServerEvent('kyro-coke:server:receivebrick')
                end
            end)
        end

        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Process Cancelled', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Process Cancelled", 3500, "error")
        end
    end)
end



