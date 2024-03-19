# Manure System for Farming Simulator 22

![For Farming Simulator 22](https://img.shields.io/badge/Farming%20Simulator-22-10BEFF.svg) [![Releases](https://img.shields.io/github/release/stijnwop/manureSystem.svg)](https://github.com/stijnwop/manureSystem/releases) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

The Manure System mod changes the whole gameplay around handling your manure application. Experience what it really
means to pump liquids as a real farmer.
Use the fill arms to actually be able to pump from open sources like: manure containers, lagoons amd water sources.
Use a specialized dock arm in order to suck from a docking funnel, or simply use a suction hose.
With a suction hose you´re able to pump a liquid fill type from source to target. If applicable you could extend the
liquid manure hose to reach larger ranges.
Pumping does not always happen at full efficiency, manure thickness decreases the pump capacity and also the length of
hoses affects your pump time.

## FAQ

- Will the Manure System come to console?

> No sadly not, as this mod includes tons of scripts in order to make the functionality possible. This is not possible
> due to the disallowance of scripts by Microsoft and Sony.

- Why is mod X not working with the Manure System?

> Most mods need to be prepared for the Manure System in order to
> work. [Down below you can find a list of vehicles](https://github.com/stijnwop/manureSystem#out-of-the-box-support)
> that
> are supported out of the box. Please be patient with the modders that are willing to prepare their vehicles for this
> system specially for you, it will come soon!

- Why is map X not working with the Manure System?

> Same as for vehicles, when maps use custom placeables for animals or the bga they will need to be prepared for the
> Manure System.

- How can I add the Manure System to my map?

> Understand that all maps are running the new placeable system for the animal areas and BGA. You only need to
> follow [the tutorial](https://github.com/stijnwop/manureSystem#modding) included for adding Manure System support to
> the
> included placeables of the given map.

- I am using a mod from your out-of-the-box support list, but it does not work!?

> Make sure you actually use the mod from the given link in the list, support for a slightly edited version will drop.

- Why can't I suck water from the mod map I am using?

> Check with the mapper if your mod map actually supports the water plane, you can also easily confirm this with running
> a vanilla water tanker.

## Known conflicts

* [Contact modder/Worked around] [3rd Person](https://www.farming-simulator.com/mod.php?mod_id=234226)
  * Unfortunately, that mod replaces the Player.update() code, breaking any mods that depend on/add to that call. Contact the modder to mention that Utilly functions such as `overwriteFunction` and `appendedFunction` should be used instead.
  This has now been worked around. However, the 3rd Person mod in its current state replaces any fixes done by Giants in the future, therefore the modder should still be contacted.
* [Contact modder/Worked around]  [Precision Hands](https://www.farming-simulator.com/mod.php?mod_id=265312)
  * Sadly, that mod does not overwrite the Player.pickUpObject() function correctly by not calling the superFunc, therefor making the hose grap and drop functions unreachable. Contact the modder to mention that the superFunc should be called to maintain comptible with other any other mod relaying on that function.
  This has now been worked around. However, the Precision Hands mod in its current state replaces any fixes done by Giants in the future, therefore the modder should still be contacted.
* [Fixed] [Mobile Workshop](https://www.farming-simulator.com/mod.php?mod_id=225545)
  * Removed obsolete FS19 code in Manure System, please download the latest version of the Manure System

## Publishing

Only Wopster is allowed to publish any of this code as a mod to any mod site, or file sharing site. The code is open for
your own use, but give credit where due. I will not accept support for any 'version' of the Manure System that is
obtained from a sketchy mod page. Versioning is controlled by me and not by any other page. This confuses people and
really holds back the development which results in no fun for me!

## Warning!

Please be aware that this is a ***DEVELOPMENT VERSION***!

* The development version can break the game or your savegame!
* The development version doesn´t support the full feature package yet!

#### Multiplayer

This version should also work in Multiplayer.

## Special thanks to

Special thanks to [VertexDezign](https://vertexdezign.net/) for providing awesome assets!

Special thanks to workflowsen for creating the icon!

Special thanks to BM-Modding for providing awesome assets!

Special thanks to JoPi for his contribution to the script work!

## Features

### Overview

- Player controlled
- Player restrictions
- Pump from/to vehicle to vehicle
- Pump from/to a storage
- Dynamic pumping sounds
- Pump efficiency impact (longer ranges and manure thickness have influence on your pump time)
- Pump directions [in/out left/right]
- Toggle manure flow state
- Dynamic parking
  position [only define the start parking node and set an offset if needed.. the script will do the rest]
    - If applicable you could use animation on the park function for moving some arms/levers around
- Extend your hoses with the extendable hose type for larger ranges with the extendable configuration
- Plane shader
- Mixing manure on storages
- Manure tankers support water.
- Docking support
- Fillarm support
- Empty object slowly when manure flow is open

#### How to use: Hose

You can pick up the hose like any other pickup object: Move towards the hose, aim on the hose and the pickup icon (hand)
will appear.
Once you picked up the hose you have to walk towards the hose couplings on a supported vehicle. Once you get close aim
for the coupling and the input help appears in the player HUD.
Press the right mouse button in order to attach the hose to the coupling. If the coupling supports the manure flow
animation the option will appear in the HUD too. Press the left mouse button in order to toggle the manure flow.

> **NOTE: If the vehicle supports manure flow animation, and you DIDN'T open the manure flow you're not able to pump!**

If the coupling does not have any manure flow animations the flow will be controlled automatically.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=OqU9gLwtkqU
" target="_blank"><img src="http://img.youtube.com/vi/OqU9gLwtkqU/0.jpg"
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

#### How to use: FillArm

Move the fill arm by mouse control and place it inside the target object. The fill arm works with the Kotte FRC
container, manure lagoon or in any place you can get water.
> **NOTE: In order to be able to pump inwards the fill arm needs to be UNDER the fill plane.**

<a href="http://www.youtube.com/watch?feature=player_embedded&v=2FW6mRde4Bg
" target="_blank"><img src="http://img.youtube.com/vi/2FW6mRde4Bg/0.jpg"
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

#### How to use: DockArm

The dock arm automatically functions like a fill arm (mentioned above) plus it can be docked on a docking funnel. Move
the dock arm by mouse control carefully inside the docking funnel in order to be able to pump.

> **NOTE: Not all vehicles have the docking funnel animated, this is because the vanilla vehicles can't be prepared for
that as the funnel model is attached to the whole mesh.**

<a href="http://www.youtube.com/watch?feature=player_embedded&v=pn29sn7EVf0
" target="_blank"><img src="http://img.youtube.com/vi/pn29sn7EVf0/0.jpg"
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

### Out of the box support

The ManureSystem supports a rich list of vehicles and objects out of the box, which means that those vehicles and
objects don't need extra preparation!

| Name                                                    | Type      | Requires DLC                                                                                             |
|---------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------|
| Briri Field Master 20                                   | Vehicle   | -                                                                                                        |
| Farmtech Supercis 800                                   | Vehicle   | -                                                                                                        |
| Farmtech Polycis 1550                                   | Vehicle   | -                                                                                                        |
| Fliegl PFW18000 MaxxLinePlus                            | Vehicle   | -                                                                                                        |
| Kotte FRC55                                             | Vehicle   | -                                                                                                        |
| Kotte FRC65                                             | Vehicle   | -                                                                                                        |
| Kotte TSA                                               | Vehicle   | -                                                                                                        |
| Kotte PQ32000                                           | Vehicle   | -                                                                                                        |
| Oxbo AT4103                                             | Vehicle   | [Oxbo Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22oxbo)                            |
| Oxbo AT5105                                             | Vehicle   | [Oxbo Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22oxbo)                            |
| Oxbo Series6030                                         | Vehicle   | [Oxbo Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22oxbo)                            |
| Ploeger AT5104 LNMS                                     | Vehicle   | -                                                                                                        |
| Kotte PTR30000                                          | Vehicle   | [Precision Farming](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22precisionfarming)        |
| John Deere R700I                                        | Vehicle   | [Precision Farming](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22precisionfarming)        |
| Kaweco Saddle Trac Tanker Front                         | Vehicle   | [Claas Xerion Saddle Track Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22saddletrac) |
| Kaweco Semi Trailed Trailer                             | Vehicle   | [Claas Xerion Saddle Track Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22saddletrac) |
| Samson PGII35m                                          | Vehicle   | -                                                                                                        |
| Schouten VT130                                          | Vehicle   | -                                                                                                        |
| Veenhuis Premium Integral 20000                         | Vehicle   | -                                                                                                        |
| Veenhuis Premium Integral 30000                         | Vehicle   | -                                                                                                        |
| Vervaet Hydro Trike XL                                  | Vehicle   | -                                                                                                        |
| Zunhammer ULT18                                         | Vehicle   | -                                                                                                        |
| Zunhammer ULT24                                         | Vehicle   | -                                                                                                        |
| Fertilizer and herbicide tanks                          | Vehicle   | -                                                                                                        |
| Berthoud Bruin 4200                                     | Vehicle   | -                                                                                                        |
| Berthoud Vantage 4300                                   | Vehicle   | -                                                                                                        |
| Hardi Navigator 4000                                    | Vehicle   | -                                                                                                        |
| Hardi Commander 4500DF                                  | Vehicle   | -                                                                                                        |
| Hardi Mega 1200L                                        | Vehicle   | -                                                                                                        |
| Hardi Aeon 5200                                         | Vehicle   | -                                                                                                        |
| Hardi Rubicon 9000                                      | Vehicle   | -                                                                                                        |
| BaseTank (with extensions)                              | Placeable | -                                                                                                        |
| Map Alpine BGA                                          | Placeable | -                                                                                                        |
| Meridian liquid flatbottom tank 1630                    | Placeable | -                                                                                                        |
| PlanET BGA 99kw                                         | Placeable | -                                                                                                        |
| PlanET BGA 250kw                                        | Placeable | -                                                                                                        |
| PlanET BGA 500kw                                        | Placeable | -                                                                                                        |
| PlanET BGA 1mw                                          | Placeable | -                                                                                                        |
| RudolfHormann cow barn medium                           | Placeable | -                                                                                                        |
| RudolfHormann cow barn big                              | Placeable | -                                                                                                        |
| RudolfHormann cow barn big vector                       | Placeable | -                                                                                                        |
| RudolfHormann pig barn medium                           | Placeable | -                                                                                                        |
| RudolfHormann pig barn big                              | Placeable | -                                                                                                        |
| Stallkamp open corrugated steel tank 17m, 25m and 32m   | Placeable | [Pumps n' Hoses Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22pumpsnhoses)           |
| Stallkamp closed corrugated steel tank 17m, 25m and 32m | Placeable | [Pumps n' Hoses Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22pumpsnhoses)           |
| Stallkamp open flat steel tank 13m, 19m and 25m         | Placeable | [Pumps n' Hoses Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22pumpsnhoses)           |
| Stallkamp closed flat steel tank 13m, 19m and 25m       | Placeable | [Pumps n' Hoses Pack](https://www.farming-simulator.com/dlc-detail.php?dlc_id=fs22pumpsnhoses)           |

## Modding

Learn more about making compatible mods for the ManureSystem, improving maps, vehicles and placeables.

Available tutorials can be found here:

- [Modding with placeables](https://github.com/stijnwop/manureSystem/blob/master/docs/PLACEABLES.md)
- [Modding with vehicles](https://github.com/stijnwop/manureSystem/blob/master/docs/VEHICLES.md)

For help you can try to open an issue here, contact me on my discord or try the forums to get answers from the
community.

## Copyright

Copyright (c) 2019 [Wopster](https://github.com/stijnwop).
All rights reserved.
