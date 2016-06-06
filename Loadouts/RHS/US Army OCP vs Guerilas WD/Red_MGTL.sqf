// Add clothing
private _uniform = selectRandom ["rhsgref_uniform_woodland_olive", "rhsgref_uniform_para_ttsko_mountain", "rhsgref_uniform_para_ttsko_oxblood", "rhs_uniform_gorka_r_y", "rhs_uniform_gorka_r_g", "rhsgref_uniform_flecktarn"];
player forceAddUniform _uniform;
player addVest "rhsgref_otv_khaki";
player addBackpack "rhs_sidor";
player addHeadgear "rhs_6b47_bala";

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
player addWeapon "Binocular";

// Add items
if ((phx_loadout_radio isEqualTo 0) or (phx_loadout_radio isEqualTo 1)) then {
    player linkItem "ItemRadio";
};
if ((phx_loadout_map isEqualTo 0) or (phx_loadout_map isEqualTo 1)) then {
    player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
