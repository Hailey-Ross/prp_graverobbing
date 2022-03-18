TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("robbingkit", function(data)
        VORP.subItem(data.source, "robbingkit", 1)
		TriggerClientEvent('GraveRobbing:TriggerRobbery', data.source)
end)

RegisterNetEvent('wcrp:graverobbingreward')
AddEventHandler('wcrp:graverobbingreward', function()
    VORP.addItem(source, "peacockfeather", 1)

    VORP.addItem(source, "piratecoin", 1)
end)

RegisterNetEvent('wcrp:graverobbingreward2')
AddEventHandler('wcrp:graverobbingreward', function()
    VORP.addItem(source, "oldbuckle", 1)

    VORP.addItem(source, "oldwatch", 1)

    VORP.addItem(source, "rubyring", 1)

    VORP.addItem(source, "goldtooth", 3)

    VORP.addItem(source, "peacockfeather", 1)

    VORP.addItem(source, "piratecoin", 2)
end)
