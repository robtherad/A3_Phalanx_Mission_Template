// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 3 do {player addItemToBackpack "150Rnd_762x54_Box";};
player addWeapon "arifle_Katiba_F";
player addItemToBackpack "30Rnd_65x39_caseless_green";
player addItemToVest "30Rnd_65x39_caseless_green";

// Add items
call phx_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
