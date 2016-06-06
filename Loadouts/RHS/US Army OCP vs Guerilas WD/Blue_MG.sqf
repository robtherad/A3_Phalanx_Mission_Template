// Add clothing
player forceAddUniform "rhs_uniform_cu_ocp";
player addVest "rhsusf_iotv_ocp_Rifleman";
player addBackpack "rhsusf_assault_eagleaiii_ocp";
player addHeadgear "rhsusf_ach_helmet_ocp";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "rhsusf_100Rnd_762x51_m80a1epr";};
player addWeapon "rhs_weap_m240G";

// Add items
player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
