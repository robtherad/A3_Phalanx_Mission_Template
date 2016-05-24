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
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "rhs_6b23_ML_6sh92";
for "_i" from 1 to 4 do {player addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_762x39mm";};

player addWeapon "rhs_weap_akm_gp25";
removeAllPrimaryWeaponItems player;

if (s_loadout_radio != 3) then {
    player linkItem "ItemRadio";
};
player addBackpack "B_FieldPack_khk";
for "_i" from 1 to 12 do {player addItemToBackpack "rhs_30Rnd_762x39mm";};

for "_i" from 1 to 4 do {player addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_Green";};
player addHeadgear "rhs_6b27m_ml";
player addGoggles "G_Bandanna_khk";

player addWeapon "Binocular";
if (s_loadout_map != 3) then {
    player linkItem "ItemMap";
    if (s_loadout_gps != 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
