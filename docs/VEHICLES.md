# Modding with vehicles

In this tutorial, you're going to learn how to add ManureSystem support to your vehicle mod.

### What do I need?

To successfully execute the required steps in this tutorial you will need the following programs: 

- Text editor ([Notepad++](https://notepad-plus-plus.org/downloads/), [Visual Studio Code](https://code.visualstudio.com/) or any proper IDE ...)
- GIANTS Editor 8.2.0 or 3D software that supports the GIANTS Exporter (Maya, blender ...)
- Internet connection for downloading sources from GitHub

For vehicles you also need an extra script in order to let the `ManureSystem` detect your mod.
You will need to get a copy of the latest `ManureSystemVehicle.lua` file which can be found in the [GitHub repository](https://github.com/stijnwop/manureSystem/tree/master/docs/ManureSystemVehicle.lua).

How to download the `ManureSystemVehicle.lua` file:
1. Go to the `docs` folder located in the root directory.
2. Click on the `ManureSystemVehicle.lua` file.
3. A window will open with the script file.
4. Click on the button called `Raw` next to the `Blame` button and it will open the file in RAW format.
5. Right click and click on `save as` (or hit ctrl - s on your keyboard) and save the file to the preferred location in your mod.
 
> REMEMBER: Rename the file extension to `.lua` and don't save it as .txt!

## Adding the ManureSystemVehicle specialization
> In order to start with this step you need to have completed the part `What do I need?`.

### 1
Open the `modDesc.xml` file located in your modfolder.

In order to load the specialization you will need to add the specializations entry to the modDesc.
```xml
<specializations>
    <specialization name="manureSystemVehicle" className="ManureSystemVehicle" filename="ManureSystemVehicle.lua"/>
</specializations>
```

The filename must be the exact location of the `ManureSystemVehicle.lua` file you downloaded earlier. In this case it's loaded from the root directory of the mod.

If a similar entry already exists you can just add the specialization entry to that.
```xml
<specialization name="manureSystemVehicle" className="ManureSystemVehicle" filename="ManureSystemVehicle.lua"/>
```
### 2
Now we need to add the newly loaded spec to a vehicle type.

In the example below we parent from the vanilla vehicle type `manureBarrel` for our convenience. This can also be something different depending on the vehicle you're adapting.
> NOTE: DON'T BLINDLY COPY PASTE THE PARENT IN THIS CASE AS THIS WON'T SUIT ALL CASES

Here we add the newly registered spec name `manureSystemVehicle`.
```xml
<vehicleTypes>
    <type name="myNewBarrel" parent="manureBarrel" filename="$dataS/scripts/vehicles/Vehicle.lua">
        <specialization name="manureSystemVehicle"/>
    </type>
</vehicleTypes>
```

Copy the new vehicle type name (In our case `myNewBarrel`) and close the modDesc file.

### 3
Open the vehicle xml file and change the type="" entry on the second line of the file.
Which looks similar to this:
```xml
<vehicle type="manureBarrel">
```

Rename the manureBarrel to your newly added vehicle type name:
```xml
<vehicle type="myNewBarrel">
```

> Note: if your vehicle uses vehicleTypeConfigurations you also need to change the types there!

#### 4
Awesome, we added the `ManureSystemVehicle` to your mod!

## Determine what to add

In order to tell the `ManureSystem` what specializations to add you need to add the following entry to your vehicle XML.

For this we need to add the following entry to the vehicle XML:
```xml
<manureSystem />
```

We have 4 options/attributes we can set here:

- hasConnectors: `true/false` if the mod has ManureSystem connectors (e.g. couplings, docking funnels)
- hasPumpMotor: `true/false` if the mod has a ManureSystem pump motor
- hasFillArm: `true/false` if the mod has a ManureSystem fill arm (e.g. normal fill arm or docking arm)
- hasFillArmReceiver: `true/false` if the mod allows ManureSystem fill arms to fill from it's fillVolume (e.g. containers)

In this example we're going to add connectors, the pump motor and a fillarm. In order to tell that to the ManureSystem mod we do the following:
```xml
<manureSystem hasConnectors="true" hasPumpMotor="true" hasFillArm="true"/>
```

If your mod also supports to receiver just simply add the `hasFillArmReceiver="true"` attribute.
