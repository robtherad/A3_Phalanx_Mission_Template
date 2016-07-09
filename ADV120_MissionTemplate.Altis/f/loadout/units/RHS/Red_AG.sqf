// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
player addWeapon "rhs_weap_ak74m";
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};

// Add items
phx_loadout_addBinocular = "Binocular";
call phx_fnc_loadout_handleItems;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
