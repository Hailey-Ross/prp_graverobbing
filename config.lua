Config = {}

Config.SeedFloor = 1
Config.SeedCeiling = 101

Config.RequireLawmen = false
Config.RequiredOnlineJob = "police"
Config.NoLawmenOnline = "You get the feeling you cannot do this right now. ."

Config.Debug = false -- Turn on Chance Printing to Logs
Config.Logging = false -- Turn on Log Manager
Config.DisableBreaking = false -- Set True to Disable

Config.Daytime = "You get the feeling this might be a bad idea right now. ."
Config.LostKit = "Your kit is damaged. ."

Config.alerts = { 
    police = { -- job
        command = "alertpolice",
        jobs = {"police","marshal"}, -- jobs the alert is sent to
        msg = "Nefarious activity has been reported near some graves", -- alert sent to the players with the job name 
        msg2 = "Someone was seen acting suspicious near the graves", -- alert sent for day graverobbing
        isdoctor = false,
        blip = {
            blipsprite = 2119977580,
            Name = 'Nefarious Activity',
        }
    },
}

Config.Items = {-- Good Loot
    {name = "oldbuckle", label = "Rusty Belt Buckle", chance = 10, amount = 4},
    {name = "oldwatch", label = "Tarnished Watch", chance = 10, amount = 2},
    {name = "diamond", label = "Diamond", chance = 2, amount = 1},
    {name = "rubyring", label = "Old Ruby Ring", chance = 10, amount = 2},
    {name = "goldtooth", label = "Gold Tooth", chance = 10, amount = 3},
    {name = "peacockfeather", label = "Peacock Feather", chance = 10, amount = 4},
    {name = "piratecoin", label = "Pirate Coin", chance = 10, amount = 7},
}

Config.Items2 = {-- Junk Loot
    {name = "rollingpaper", label = "Rolling Paper", chance = 10, amount = 3},
    {name = "rock", label = "Rock", chance = 10, amount = 5},
    {name = "fan", label = "Fan", chance = 10, amount = 1},
    {name = "beer", label = "an Old Beer", chance = 10, amount = 1},
    {name = "bone", label = "An old Bone", chance = 10, amount = 3},
    {name = "book", label = "A dusty Book", chance = 10, amount = 2},
}

Config.zones = {
    [1] = { name = 'AguasdulcesFarm', label = 'Aguasdulces Farm'},
    [2] = { name = 'AguasdulcesRuins', label = 'Aguasdulces Ruins'},
    [3] = { name = 'AguasdulcesVilla', label = 'Aguasdulces Villa'},
    [4] = { name = 'Annesburg', label = 'Annesburg'},
    [5] = { name = 'Armadillo', label = 'Armadillo'},
    [6] = { name = 'BeechersHope', label = 'BeechersHope'},
    [7] = { name = 'Blackwater', label = 'Blackwater'},
    [8] = { name = 'Braithwaite', label = 'Braithwaite'},
    [9] = { name = 'Butcher', label = 'Butcher Creek'},
    [10] = { name = 'Caliga', label = 'Caliga'},
    [11] = { name = 'Emerald', label = 'Emerald Ranch'},
    [12] = { name = 'lagras', label = 'Lagras'},
    [13] = { name = 'Manicato', label = 'Manicato'},
    [14] = { name = 'Manzanita', label = 'Manzanita'},
    [15] = { name = 'Rhodes', label = 'Rhodes'},
    [16] = { name = 'Siska', label = 'Siska Prison'},
    [17] = { name = 'StDenis', label = 'Saint Denis'},
    [18] = { name = 'Strawberry', label = 'Strawberry'},
    [19] = { name = 'Tumbleweed', label = 'Tumbleweed'},
    [20] = { name = 'valentine', label = 'Valentine'},
    [21] = { name = 'VANHORN', label = 'Van Horn'},
    [22] = { name = 'Wallace', label = 'Fort Wallace'},
    [23] = { name = 'wapiti', label = 'Wapiti Reservation'},
    [24] = { name = 'Ambarino', label = 'Ambarino'},
    [25] = { name = 'Guarma', label = 'Guarma'},
    [26] = { name = 'Lemoyne', label = 'Lemoyne'},
    [27] = { name = 'LowerWestElizabeth', label = 'Lower West Elizabeth'},
    [28] = { name = 'NewAustin', label = 'New Austin'},
    [29] = { name = 'NuevoParaiso', label = 'Nuevo Paraiso'},
    [30] = { name = 'WestElizabeth', label = 'West Elizabeth'},
    [31] = { name = 'BayouNwa', label = 'Bayou Nwa'},
    [33] = { name = 'bigvalley', label = 'Big valley'},
    [34] = { name = 'BluewaterMarsh', label = 'Bluewater Marsh'},
    [35] = { name = 'ChollaSprings', label = 'Cholla Springs'},
    [36] = { name = 'Cumberland', label = 'Cumberland'},
    [37] = { name = 'DiezCoronas', label = 'Diez Coronas'},
    [38] = { name = 'GaptoothRidge', label = 'Gaptooth Ridge'},
    [39] = { name = 'greatPlains', label = 'Great Plains'},
    [40] = { name = 'GrizzliesEast', label = 'Grizzlies East'},
    [41] = { name = 'GrizzliesWest', label = 'Grizzlies West'},
    [42] = { name = 'GuarmaD', label = 'GuarmaD'},
    [43] = { name = 'Heartlands', label = 'Heartlands'},
    [44] = { name = 'HennigansStead', label = 'Hennigans Stead'},
    [45] = { name = 'Perdido', label = 'Perdido'},
    [46] = { name = 'PuntaOrgullo', label = 'Punta Orgullo'},
    [47] = { name = 'roanoke', label = 'Roanoke'},
    [48] = { name = 'scarlettMeadows', label = 'Scarlett Meadows'},
    [49] = { name = 'TallTrees', label = 'Tall Trees'},
}
