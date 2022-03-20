# prp_graverobbing
Updated / Fork of prp_graverobbing that adds the ability to rob  
gravestones in RedM using the VORP-Framework

## Features
- Added night only graverobbing
- Added Law Alerts
- Updated Loot List
  - Added Good Loot
  - Added Junk Loot
- Added Critical Failure (Rolling a 1)

## TODO
- Add law alert for graverobbing during daytime
- Add syn_minigame support
- Optimizations to code

## Dependencies
- [Vorp-Core](https://github.com/VORPCORE/vorp-core-lua)
- [Vorp-Character](https://github.com/VORPCORE/VORP-Character)
- [Vorp-Inputs](https://github.com/VORPCORE/VORP-Inputs)
- [weathersync](https://github.com/kibook/weathersync) USE LATEST. Needs Exports support.  
- [syn_alert](https://github.com/kamelzarandah/syn_alert)

## Instructions

- Extract download into your resources folder
- Add the resource in your server.cfg

- Run SQL File to add following items to DB
```
  "oldbuckle",
  "oldwatch",
  "goldring",
  "goldtooth",
  "oldcoin",
  "robbingkit",
  "rollingpaper",
  "rock",
  "pipe",
  "beer",
  "bone",
  "book",
```
- Restart / Start your Server
- In-game, use a "robbingkit" near a gravestone to rob it
