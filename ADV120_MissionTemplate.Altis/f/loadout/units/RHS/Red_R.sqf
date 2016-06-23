// Set unit level -- 0=Default, 1=TL, 2=SL+
phx_loadout_unitLevel = 0;

// Add clothing
player forceAddUniform "rhsgref_uniform_ttsko_forest";
player addVest "rhsgref_6b23_ttsko_forest_rifleman";
player addBackpack "rhs_assault_umbts";
player addHeadgear "rhsgref_6b27m_ttsko_forest";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};
for "_i" from 1 to 9 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
player addWeapon "rhs_weap_ak74m";

// Add items
call phx_fnc_loadout_handleItems;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
