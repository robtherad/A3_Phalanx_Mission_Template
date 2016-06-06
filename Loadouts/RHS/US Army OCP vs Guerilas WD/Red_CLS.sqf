// Add clothing
private _uniform = selectRandom ["rhsgref_uniform_woodland_olive", "rhsgref_uniform_para_ttsko_mountain", "rhsgref_uniform_para_ttsko_oxblood", "rhs_uniform_gorka_r_y", "rhs_uniform_gorka_r_g", "rhsgref_uniform_flecktarn"];
player forceAddUniform _uniform;
player addVest "rhsgref_otv_khaki";
player addBackpack "rhs_sidor";
player addHeadgear "rhs_6b47_bala";

// Add gear
for "_i" from 1 to 8 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 9 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addWeapon "rhs_weap_ak74m";
player addPrimaryWeaponItem "rhs_acc_2dpZenit";

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
