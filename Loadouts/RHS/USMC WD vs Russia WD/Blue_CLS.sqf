// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 8 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 9 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 32 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 16 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bloodIV";};
player addWeapon "rhs_weap_m16a4_carryhandle";
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};

// Add items
call phx_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
