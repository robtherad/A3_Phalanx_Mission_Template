removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_Ranger_A";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "V_PlateCarrier2_rgr";
for "_i" from 1 to 2 do {player addItemToVest "rhs_200rnd_556x45_M_SAW";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
player addHeadgear "H_HelmetB";
player addWeapon "rhs_weap_m249_pip_S";
player addPrimaryWeaponItem "bipod_01_F_blk";
if (s_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (s_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
