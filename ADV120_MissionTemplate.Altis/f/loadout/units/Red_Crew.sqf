removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_flora_patchless_alt";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addVest "rhs_6b23_ML_6sh92";
for "_i" from 1 to 7 do {player addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addHeadgear "rhs_6b27m_ml_ess";
player addGoggles "G_Bandanna_khk";

player addWeapon "rhs_weap_akms";
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "rhs_acc_2dpZenit";

if (s_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (s_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
