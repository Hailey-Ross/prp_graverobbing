VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local Debug = Config.Debug
local Floor = Config.SeedFloor
local Ceiling = Config.SeedCeiling
local MasterCeiling = Ceiling + Ceiling  --Create maximum
local testsuccess, result = pcall(os.time) --Time Module Test Call
local ctestsuccess, crypto = pcall(require, "crypto") --Crypto Module Test Call
local seed = math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling) -- Default Seed Generation ALL BUILT IN LUA
local time --Empty Time Variable

if ctestsuccess and testsuccess then --IF we have Crypto and Time pass their tests, use both for Seed Generation
	time = os.time() % 100000
	seed = crypto.rng() * (Ceiling - Floor) + time + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module PASSED Test."); print("os.time PASSED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
elseif ctestsuccess then --IF only crypto passes, use that for seed generation
	seed = crypto.rng() * (Ceiling - Floor) + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module PASSED Test."); print("os.time FAILED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
elseif testsuccess then --IF only time passes its test then use that for seed generation
	time = os.time() % 100000
	seed = time + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module FAILED Test."); print("os.time PASSED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
else --IF All else fails then fall back on default seed generation, pure psuedo-random gneration
        math.randomseed(seed)
	    if Debug == true then print("Crypto Module FAILED Test."); print("os.time FAILED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
end

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

function GetPlayers()
	local players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive(i) then
		table.insert(players, GetPlayerServerId(i))
		end
	end
	return players
end

VorpInv.RegisterUsableItem("robbingkit", function(data)
	local WorldTime = exports.weathersync:getTime()
	local maxchance = 210
	local minchance = 1
	local maxchancex = maxchance + maxchance
	local breakroll = math.random(minchance,maxchance)
	local breakroll2 = math.random(minchance,maxchance)
	local targetJob = Config.RequiredOnlineJob
	--local players = VorpCore.GetPlayers()  --redundant
	local jobcount = 0

	for i, player in pairs(players) do
  		local playerJob = VorpCore.GetPlayerJob(player)
  		if playerJob == targetJob then jobcount = jobcount + 1 end
	end
		
	if Config.RequireLawmen == true and jobcount <= Config.MinLawReq then --Main Loop for Requiring Lawmen
	if WorldTime.hour == 22 or WorldTime.hour == 23 or WorldTime.hour == 0 or WorldTime.hour == 1 or WorldTime.hour == 2 or WorldTime.hour == 3 or WorldTime.hour == 4 or WorldTime.hour == 5 then
		if Config.DisableBreaking == false then
			local breakchance = breakroll + breakroll2
			if Config.Debug == true then print(breakroll.." + "..breakroll2) end
			if breakchance >= 310 then
				VorpInv.subItem(data.source, "robbingkit", 1)
				TriggerClientEvent("vorp:TipRight", data.source, Config.LostKit, 3000)
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit Broken: Rolled "..breakchance.."/"..maxchancex) end
			else
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit did not break, Rolled: "..breakchance.."/"..maxchancex) end
			end
		else
			TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
			if Config.Debug == true then print("Kit cannot be broken. Config Disable Breaking is TRUE") end
		end
	else
		TriggerClientEvent("vorp:TipBottom", data.source, Config.Daytime, 5000)
		if Config.Debug == true then print("Attempted daytime Graverobbing") end
	end
	elseif Config.RequireLawmen == False then -- Main Loop not requiring Lawmen
			if WorldTime.hour == 22 or WorldTime.hour == 23 or WorldTime.hour == 0 or WorldTime.hour == 1 or WorldTime.hour == 2 or WorldTime.hour == 3 or WorldTime.hour == 4 or WorldTime.hour == 5 then
		if Config.DisableBreaking == false then
			local breakchance = breakroll + breakroll2
			if Config.Debug == true then print(breakroll.." + "..breakroll2) end
			if breakchance >= 310 then
				VorpInv.subItem(data.source, "robbingkit", 1)
				TriggerClientEvent("vorp:TipRight", data.source, Config.LostKit, 3000)
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit Broken: Rolled "..breakchance.."/"..maxchancex) end
			else
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit did not break, Rolled: "..breakchance.."/"..maxchancex) end
			end
		else
			TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
			if Config.Debug == true then print("Kit cannot be broken. Config Disable Breaking is TRUE") end
		end
	else
		TriggerClientEvent("vorp:TipBottom", data.source, Config.Daytime, 5000)
		if Config.Debug == true then print("Attempted daytime Graverobbing") end
		end
	end
	else
		TriggerClientEvent("vorp:TipBottom", data.source, Config.NoLawmenOnline, 5000)
		if Config.Debug == true then print("Attempted graverobbing without Lawmen awake") end
		end
end)

function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
		keys = keys + 1
    end
    return keys
end

RegisterServerEvent('wcrp:graverobbingreward')
AddEventHandler('wcrp:graverobbingreward', function()
	local _source = source
	local Character = VorpCore.getUser(_source).getUsedCharacter
	local chance =  math.random(1,10)
	local reward = {}
	for k,v in pairs(Config.Items) do 
		if v.chance >= chance then
			table.insert(reward,v)
		end
	end
	local chance2 = math.random(1,keysx(reward))
	local count = math.random(1,reward[chance2].amount)
	TriggerEvent("vorpCore:canCarryItems", tonumber(_source), count, function(canCarry)
		TriggerEvent("vorpCore:canCarryItem", tonumber(_source), reward[chance2].name,count, function(canCarry2)
			if canCarry and canCarry2 then
				VorpInv.addItem(_source, reward[chance2].name, count)
				TriggerClientEvent("vorp:TipRight", _source, "You found "..count.." "..reward[chance2].label, 3000)
				if Config.Debug == true then print("Obtained Drop "..reward[chance2].label.." Rolled: "..chance2) end
			else
				TriggerClientEvent("vorp:TipRight", _source, "You cannot carry any more "..reward[chance2].label, 3000)
				if Config.Debug == true then print("Obtained Drop "..reward[chance2].label.." Rolled: "..chance2) end
			end
		end)
	end) 
end)

RegisterServerEvent('wcrp:graverobbingreward2')
AddEventHandler('wcrp:graverobbingreward2', function()
	local _source = source
	local Character = VorpCore.getUser(_source).getUsedCharacter
	local chance =  math.random(1,10)
	local reward = {}
	for k,v in pairs(Config.Items2) do 
		if v.chance >= chance then
			table.insert(reward,v)
		end
	end
	local chance2 = math.random(1,keysx(reward))
	local count = math.random(1,reward[chance2].amount)
	TriggerEvent("vorpCore:canCarryItems", tonumber(_source), count, function(canCarry)
		TriggerEvent("vorpCore:canCarryItem", tonumber(_source), reward[chance2].name,count, function(canCarry2)
			if canCarry and canCarry2 then
				VorpInv.addItem(_source, reward[chance2].name, count)
				TriggerClientEvent("vorp:TipRight", _source, "You found "..count.." "..reward[chance2].label, 3000)
				if Config.Debug == true then print("Obtained Junk Drop "..reward[chance2].label.." Rolled: "..chance2) end
			else
				TriggerClientEvent("vorp:TipRight", _source, "You can't carry any more "..reward[chance2].label, 3000)
				if Config.Debug == true then print("Not enough pocket space for "..reward[chance2].label.." Rolled: "..chance2) end
			end
		end)
	end) 
end)
