#randomstart
This module allows you to have a team start the mission at one of any amount of preselected locations which are determined on a per mission basis. 

###Configure
#####settings.sqf
Determine which teams you want to have randomly placed and then set their `_randomizeTeam` variables to true if that's what you want.

#####Editor
Place an `empty` icon marker close to the team you want to have randomly placed. The further you place the marker from that team's players the further away they will spawn from their selected place so make sure it's as close as you need. Name this marker `placemark` and have it face roughly the same way as the players are in the editor. If you forget to do this step players will spawn in outside the map.

Now create a few `empty` icon markers and scatter them about in areas you want the team to potentially spawn at. If you place a marker with the name `randomstart` and copy and paste it as many times as you'd like, any further markers pasted from that `randomstart` marker will be named `randomstart_x` depending on how many markers have already been placed with that same name. Make sure the markers are facing the direction you want the players to face when they spawn in.

Repeat this for each team that you want to have a random starting location. Do not re-use the same markers for multiple teams or they can potentially spawn at the same location.

#####settings.sqf
Now edit the definition of `_markerArray` for the team and fill it with the names of the markers you placed. If you forget to add a marker to this list then it will not be considered as a place to spawn the players in at. If you add a marker to this list that doesn't exist then the players will spawn at the bottom left corner of the map.

If you want to move more than just the players on `_ranTeam` you can add the names of the objects you want to move to `_objectArray`. If you do not want to move anything besides the players on `_ranTeam` then make sure `_objectArray` is set to `[]`.

Repeat these steps for each team you want to have a random starting location.

#####init.sqf
The final thing to do to activate this script is to call the `server.sqf` and `client.sqf` scripts in the `init.sqf` in the mission's root folder. To do so, add the following lines to the bottom of the `init.sqf`:

```
[] execVM "scripts\randomstart\server.sqf";
[] execVM "scripts\randomstart\client.sqf";
```

###Disable
It's disabled by default. To enable it follow the instructions above.