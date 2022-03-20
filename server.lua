VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

--[[VorpInv.RegisterUsableItem("robbingkit", function(data)
        VorpInv.subItem(data.source, "robbingkit", 1)
		TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
end)]]

VorpInv.RegisterUsableItem("robbingkit", function(data)
	local WorldTime = exports.weathersync:getTime()
	if WorldTime.hour == 22 or WorldTime.hour == 23 or WorldTime.hour == 0 or WorldTime.hour == 1 or WorldTime.hour == 2 or WorldTime.hour == 3 or WorldTime.hour == 4 or WorldTime.hour == 5 then
		VorpInv.subItem(data.source, "robbingkit", 1)
		TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
	else		 
		TriggerClientEvent("vorp:TipBottom", data.source, Config.Daytime, 5000)
end
end)

RegisterNetEvent('wcrp:graverobbingreward')
AddEventHandler('wcrp:graverobbingreward', function()
    VorpInv.addItem(source, "peacockfeather", 1)

    VorpInv.addItem(source, "piratecoin", 1)
end)

RegisterNetEvent('wcrp:graverobbingreward2')
AddEventHandler('wcrp:graverobbingreward', function()
    VorpInv.addItem(source, "oldbuckle", 1)

    VorpInv.addItem(source, "oldwatch", 1)

    VorpInv.addItem(source, "rubyring", 1)

    VorpInv.addItem(source, "goldtooth", 1)

    VorpInv.addItem(source, "peacockfeather", 1)

    VorpInv.addItem(source, "piratecoin", 1)
end)

function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end

RegisterServerEvent('wcrp:graverobbingreward3')
AddEventHandler('wcrp:graverobbingreward3', function()
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
			else
				TriggerClientEvent("vorp:TipRight", _source, "You can't carry any more "..reward[chance2].label, 3000)
			end
		end)
	end) 
end)
