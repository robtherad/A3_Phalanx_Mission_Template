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
for "_i" from 1 to 15 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 10 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
player addHeadgear "H_HelmetB";
player addWeapon "rhs_weap_m4a1_carryhandle";

player addWeapon "rhs_weap_M136";
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
