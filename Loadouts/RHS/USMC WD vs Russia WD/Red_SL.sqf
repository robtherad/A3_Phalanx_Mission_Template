// Add clothing
player forceAddUniform "rhsgref_uniform_ttsko_forest";
player addVest "rhsgref_6b23_ttsko_forest_rifleman";
player addBackpack "rhs_assault_umbts";
player addHeadgear "rhsgref_6b27m_ttsko_forest";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_VOG25";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_GRD40_White";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_VG40OP_white";};
for "_i" from 1 to 7 do {player addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
player addWeapon "rhs_weap_ak74m_gp25";
for "_i" from 1 to 6 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
player addWeapon "Binocular";

// Add items
if !(phx_loadout_radio isEqualTo 3) then {
    player linkItem "ItemRadio";
};
if !(phx_loadout_map isEqualTo 3) then {
    player linkItem "ItemMap";
    if !(phx_loadout_gps isEqualTo 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
