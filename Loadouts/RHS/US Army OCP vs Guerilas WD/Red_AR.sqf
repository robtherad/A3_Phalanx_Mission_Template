// Add clothing
private _uniform = selectRandom ["rhsgref_uniform_woodland_olive", "rhsgref_uniform_para_ttsko_mountain", "rhsgref_uniform_para_ttsko_oxblood", "rhs_uniform_gorka_r_y", "rhs_uniform_gorka_r_g", "rhsgref_uniform_flecktarn"];
player forceAddUniform _uniform;
player addVest "rhsgref_otv_khaki";
player addBackpack "rhs_sidor";
player addHeadgear "rhs_6b47_bala";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "rhs_100Rnd_762x54mmR";
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
player addWeapon "rhs_weap_pkm";
player addItemToVest "rhs_100Rnd_762x54mmR";

// Add items
if (phx_loadout_map isEqualTo 0) then {
    player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (phx_loadout_radio isEqualTo 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
