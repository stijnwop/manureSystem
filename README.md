# Manure System for Farming Simulator 19 (GPS)
![For Farming Simulator 19](https://img.shields.io/badge/Farming%20Simulator-19-FF7C00.svg) [![Releases](https://img.shields.io/github/release/stijnwop/guidanceSteering.svg)](https://github.com/stijnwop/guidanceSteering/releases)

he Manure System mod changes the whole gameplay around handling your manure application. Experience what it really means to pump liquids as a real farmer.
Use the fill arms to actually be able to pump from open sources like: manure containers, lagoons amd water sources.
Use a specialized dock arm in order to suck from a docking funnel, or simply use a suction hose.
With a suction hose you´re able to pump a liquid fill type from source to target. If applicable you could extend the liquid manure hose to reach larger ranges.
Pumping does not always happen at full efficiency, manure thickness decreases the pump capacity and also the length of hoses affects your pump time.


## Publishing
Only Wopster is allowed to publish any of this code as a mod to any mod site, or file sharing site. The code is open for your own use, but give credit where due. I will not accept support for any 'version' of the Manure System that is obtained from a sketchy mod page. Versioning is controlled by me and not by any other page. This confuses people and really holds back the development which results in no fun for me!

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

## Features

### Overview
- Player controlled
- Player restrictions
- Pump from/to vehicle to vehicle
- Pump from/to a storage
- Dynamic pumping sounds
- Pump directions [in/out left/right]
- Toggle manure flow state
- Dynamic parking position [only define the start parking node and set an offset if needed.. the script will do the rest]
  - If applicable you could use animation on the park function for moving some arms/levers around
- Extend your hoses with the extendable hose type for larger ranges with the extendable configuration
- Plane shader
- Manure tankers support water.
- Docking support
- Fillarm support
- Empty object slowly when manure flow is open

#### How to use: Hose
You can pickup the hose like any other pickup object: Move towards the hose, aim on the hose and the pickup icon (hand) will appear.
Once you picked up the hose you have to walk towards the hose couplings on a supported vehicle. Once you get close aim for the coupling and the input help appears in the player HUD.
Press the right mouse button in order to attach the hose to the coupling. If the coupling supports the manure flow animation the option will appear in the HUD too. Press the left mouse button in order to toggle the manure flow.

> NOTE: If the vehicle supports manure flow animation and you DIDN'T open the manure flow you're not able to pump!

If the coupling does not have any manure flow animations the flow will be controlled automatically.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=OqU9gLwtkqU
" target="_blank"><img src="http://img.youtube.com/vi/OqU9gLwtkqU/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

#### How to use: FillArm
Move the fill arm by mouse control and place it inside the target object. The fill arm works with the Kotte FRC container, manure lagoon or in any place you can get water.
> NOTE: In order to be able to pump inwards the fill arm needs to be UNDER the fill plane.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=2FW6mRde4Bg
" target="_blank"><img src="http://img.youtube.com/vi/2FW6mRde4Bg/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

#### How to use: DockArm
The dock arm automatically functions like a fill arm (mentioned above) plus it can be docked on a docking funnel. Move the dock arm by mouse control carefully inside the docking funnel in order to be able to pump.

> NOTE: Not all vehicles have the docking funnel animated, this is because the vanilla vehicles can't be prepared for that as the funnel model is attached to the whole mesh.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=pn29sn7EVf0
" target="_blank"><img src="http://img.youtube.com/vi/pn29sn7EVf0/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

### Out of the box vehicle support

| Vehicles        | Vanilla / Mod        | Supports        |
| ------------- | ------------------ | ------------------ |
| SamsonAgro PGII20 | - | Fillarm (Dock), new shared hose connector and hose park place. |
| SamsonAgro PGII25m | - | Fillarm, new shared hose connector and funnel. |
| SamsonAgro PGII35m | - | Fillarm, new shared hose connector and funnel. |
| Kotte FRC | - | Funnel and 2 hose connectors. |
| Kotte TSA | - | Funnel, hose connector and 2 hose park places. |
| Kotte VE8000 | - | 2 hose connectors and 1 hose park place. |
| Joskin Modulo | - | Fillarm (Dock), new shared hose connector and 2 hose park places. |
| Zunhammer 18500PE | - | Fillarm (Dock), hose connector and 2 hose park places. |
| Veenhuis Premium Integral 30000 | - | Hose connector. |
| Zunhammer TV585 | [HOLMER Terra Variant DLC](https://www.farming-simulator.com/mod.php?lang=en&country=nl&mod_id=132156&title=fs2019) | Fillarm (Dock), hose connector
| Holmer terraVariant435 | [HOLMER Terra Variant DLC](https://www.farming-simulator.com/mod.php?lang=en&country=nl&mod_id=132156&title=fs2019) | Fillarm (Dock), hose connector
| Briri Field Master 20 | [Briri Field Master 20](https://www.farming-simulator.com/mod.php?lang=en&country=nl&mod_id=146879&title=fs2019) | Fillarm (Dock), 4 hose connectors and 2 hose park places.
| Hardi Navigator 6000 | - | 3 fertilizer hose connectors. |
| Hardi Rubicon 9000 | - | 2 fertilizer hose connectors. |
| Kuhn PF1500 | - | 2 fertilizer hose connector. |
| Kuhn Deltis 1302 | - | 1 fertilizer hose connectors. |
| Kuhn Metris 4102 | - | 2 fertilizer hose connectors. |
| Fertilizer Pallet | - | Fertilizer hose connector. |
| Herbicide Pallet | - | Fertilizer hose connector. |

## Copyright
Copyright (c) 2019 [Wopster](https://github.com/stijnwop).
All rights reserved.
