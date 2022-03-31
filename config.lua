Config = {}

Config.Debug = false -- Turn on Chance Printing to Logs

Config.Daytime = "You get the feeling this might be a bad idea right now. ."
Config.LostKit = "You notice the kit is damaged. ."

Config.DisableBreaking = false -- Set True to Disable

Config.alerts = { 
    police = { -- job
        command = "alertpolice",
        jobs = {"police","marshal"}, -- jobs the alert is sent to
        msg = "Nefarious activity has been reported near some graves", -- alert sent to the players with the job name 
        isdoctor = false,
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
}

Config.Items = {-- Good Loot
    {name = "oldbuckle", label = "Rusty Belt Buckle", chance = 10, amount = 4},
    {name = "oldwatch", label = "Tarnished Watch", chance = 10, amount = 2},
    {name = "rubyring", label = "Old Ruby Ring", chance = 10, amount = 2},
    {name = "goldtooth", label = "Gold Tooth", chance = 10, amount = 3},
    {name = "peacockfeather", label = "Peacock Feather", chance = 10, amount = 4},
    {name = "piratecoin", label = "Pirate Coin", chance = 10, amount = 7},
}

Config.Items2 = {-- Junk Loot
    {name = "rollingpaper", label = "Rolling Paper", chance = 10, amount = 3},
    {name = "rock", label = "Rock", chance = 10, amount = 2},
    {name = "pipe", label = "Pipe", chance = 10, amount = 1},
    {name = "beer", label = "an Old Beer", chance = 10, amount = 1},
    {name = "bone", label = "An old Bone", chance = 10, amount = 2},
    {name = "book", label = "A dusty Book", chance = 10, amount = 1},
}
