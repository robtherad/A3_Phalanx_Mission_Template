phx_loadout_unitLevel = 1;

// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_VOG25";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_GRD40_White";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_VG40OP_white";};
for "_i" from 1 to 7 do {player addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
player addWeapon "rhs_weap_ak74m_gp25";
for "_i" from 1 to 2 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 1 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
player addItem "ACE_MapTools";
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};
player addItem "ACE_EntrenchingTool";

// Add items
phx_loadout_addBinocular = "Binocular";
call phx_fnc_loadout_handleItems;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
