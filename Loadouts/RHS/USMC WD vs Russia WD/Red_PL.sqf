phx_loadout_unitLevel = 2;

// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 7 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};
player addWeapon "rhs_weap_ak74m";
for "_i" from 1 to 6 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
player addWeapon "rhs_weap_rsp30_white";
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_weap_rsp30_white";};
player addItem "ACE_MapTools";
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};

// Add items
phx_loadout_addBinocular = "Binocular";
call phx_fnc_loadout_handleItems;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
