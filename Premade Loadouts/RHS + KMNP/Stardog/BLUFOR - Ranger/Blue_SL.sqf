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
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};

player addWeapon "rhs_weap_m4a1_carryhandle_m203";

if (s_loadout_radio != 3) then {
    player linkItem "ItemRadio";
};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 12 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};

player addHeadgear "H_HelmetB";
player addWeapon "Binocular";
if (s_loadout_map != 3) then {
    player linkItem "ItemMap";
    if (s_loadout_gps != 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
