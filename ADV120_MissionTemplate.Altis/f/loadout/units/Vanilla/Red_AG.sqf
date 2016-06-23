// Add clothing
player forceAddUniform "U_O_CombatUniform_ocamo";
player addVest "V_PlateCarrier1_blk";
player addBackpack "B_TacticalPack_ocamo";
player addHeadgear "H_HelmetO_ocamo";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 3 do {player addItemToBackpack "150Rnd_93x64_Mag";};
player addWeapon "arifle_Katiba_F";
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_green";};

// Add items
phx_loadout_addBinocular = "Binocular";
call phx_fnc_loadout_handleItems;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
