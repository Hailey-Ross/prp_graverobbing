VorpInv = exports.vorp_inventory:vorp_inventoryApi()

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
	local breakroll = math.random(minchance,maxchance)
	local breakroll2 = math.random(minchance,maxchance)
	if WorldTime.hour == 22 or WorldTime.hour == 23 or WorldTime.hour == 0 or WorldTime.hour == 1 or WorldTime.hour == 2 or WorldTime.hour == 3 or WorldTime.hour == 4 or WorldTime.hour == 5 then
		if Config.DisableBreaking == false then
			local breakchance = breakroll + breakroll2
			if Config.Debug == true then print(breakroll.." + "..breakroll2) end
			if breakchance >= 365 then
				VorpInv.subItem(data.source, "robbingkit", 1)
				TriggerClientEvent("vorp:TipRight", data.source, Config.LostKit, 3000)
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit Broken: Rolled "..breakchance.."/"..maxchance) end
			else
				TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
				if Config.Debug == true then print("Kit did not break, Rolled: "..breakchance.."/"..maxchance) end
			end
		else
			TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
			if Config.Debug == true then print("Kit cannot be broken. Config Disable Breaking is TRUE") end
		end
	else		 
		TriggerClientEvent("vorp:TipBottom", data.source, Config.Daytime, 5000)
		if Config.Debug == true then print("Attempted daytime Graverobbing") end
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
