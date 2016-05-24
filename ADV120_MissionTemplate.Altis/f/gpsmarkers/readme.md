#gpsmarkers
This module creates and updates markers for every group on a side except for ones which are set to be ignored in the settings file. It can also manage markers for vehicles if they are properly configured in the settings file. 

###Configure
All configuration happens in `'f\gpsmarkers\settings.sqf'`.

#####Vehicles
To manage markers for vehicles you need to define `_westVehArray`, `_eastVehArray`, or `_indVehArray` depending on which teams should be able to see the vehicle's marker.

Each vehicle needs to be defined as an array containing it's object and it's type. The possible types are `0` (ground), `1` (helicopter) and `2` (plane). For example if I wanted to create a marker on a BLUFOR helicopter named `bluforHelicopter` I would use the following definition:

```_westVehArray = [bluforHelicopter,1];```

This will have the module create and update a marker for that vehicle. By default it will have the same name as the object (in the above case, bluforHelicopter) but you can define a variable on that object to make it have a prettier name. Before the GPS script runs (I usually use the vehicles's initialization field in the editor) use the following line, replacing `VEHICLE` and `PRETTY NAME` with a reference to the vehicle and a nicer looking name respectively.

```VEHICLE setVariable ["phx_MarkerName", "PRETTY NAME"];```
***
#####Group Markers
By default the module will create a marker for every group present on the map. Unless the group is defined by the setGroupID module it will have a messy name like `Alpha 1-1` or something. Define the group using that module and it will use the name defined there instead.

If you want a group to have no marker created for it you can add it's groupID to `phx_ignoreMarkerArray`. It's groupID should be a string which is defined in the setGroupID module. If I had three groups named A1, A2 and C2 that I wished to hide markers for I would define `phx_ignoreMarkerArray` as follows:

```phx_ignoreMarkerArray = ["A1", "A2", "C2"];```
***
#####Allied GPS
If you wish for teams to be able to see each other's GPS markers then you can define which teams are visible to which teams using the variables `_sidesVisibleToWest`, `_sidesVisibleToEast` and `_sidesVisibleToGuer`. Fill these variables with an array of sides (`west`,`east`,`independent`) which that team should be able to see GPS markers for. By default teams can only see their own GPS markers. This will not combine side chat channels for teams.

If you wish to change this value after the mission has started you can redefine `phx_sidesVisibleToPlayer` which is a variable local to each client that is initially equal to the `_sidesVisibleToXXXX` that corresponds to the player's initial side when the script was called.

###Disable
In `'f\bcInit.sqf'` remove the line `call phx_fnc_gps_init;`.