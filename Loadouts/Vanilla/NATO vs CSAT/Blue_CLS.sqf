// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 8 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addWeapon "arifle_MX_F";

// Add items
call phx_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
