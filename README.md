### Phalanx Mission Template

Simply click the link below to download the template. The master branch is always the most up to date, stable, version of the template. 

### [Download latest template version - v9](https://github.com/robtherad/A3_Phalanx_Mission_Template/archive/master.zip)

---

### Using the Template
First you'll need to download the template using the link above. Once it's done, drag the folder called `ADV120_MissionTemplate.Altis` into your Arma 3 mission folder. Your Arma 3 mission folder which should be a path similar to `C:\Users\Rob\Documents\Arma 3 - Other Profiles\robtherad\missions`. 

After that **[you can use the template guide](https://github.com/robtherad/A3_Phalanx_Mission_Template/wiki/Creating-a-Mission-with-the-Template)** to help you make your mission.

---

### Questions

If you have questions about how a certain feature works, the best way to find out is to open the README file in the feature's folder. All pre-activated features are located in the `\f\` directory of the mission folder. All other features are located in the `\scripts\` directory of the mission folder.

If you still can't get something to work then post an issue on github or get in contact with robtherad.

---

### Current Features

##### Main
A list of features which are activated and configured by default in the Phalanx mission template.
* **Customized F3 ORBAT Display** *(f\briefing)* - Gives a breakdown of all the groups on the player's team. Also displays their preset radio channel and unit count.
* **Time Limit and Team Elimination Notification** *(f\endconditions)* - Gives notification to players when the mission time limit has been reached or when enemy teams have been eliminated.
* **Blue Force Tracking** *(f\gpsmarkers)* - Shows players with GPS the locations of other groups on their own team who also have GPS.
* **Loadout Handling** *(f\loadouts)* - A system for adding custom loadouts to units.
* **Preset Radios** *(f\radios)* - Based on team structure as defined in setGroupID module, sets up player's radios for them at mission start.
* **F3 Safestart** *(f\safeStart)* - Prevents players from dying during the mission set up time.
* **Customized F3 Group Identifiers** *(f\setGroupID)* - A centralized module for assigning information (radio channel, blue force tracker name, group size, etc) to groups.
* **F3 Spectator** *(f\spect)* - Provides a way for players to watch the battle after they die.

##### Optional Features
Features that are no pre-activated or configured in the Phalanx mission template.
* **Randomized Starting Locations** *(scripts\randomstart)* - Allows one or more teams to start in one of many preset locations which are unknown to enemy teams.
* **Centralized Vehicle Cargo Handling** *(scripts\veh_cargo)* - Provides an easy to find place to manage the loadouts of all vehicles in a mission.
* **Vehicle Locking** *(scripts\veh_lock)* - Provides a framework for limiting access to vehicles based on player team, player classname, or to specific players.


---

### History

The Phalanx mission template is based on the [Bravo Company template](https://github.com/robtherad/BCArma). The Bravo Company template was based off the [F3 Mission Template](https://github.com/ferstaberinde/F3), and was developed by robtherad and other members of Bravo Company.
