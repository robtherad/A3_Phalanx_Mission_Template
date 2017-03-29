removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_FROG01_d";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhsusf_spc_teamleader";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_red";};

player addWeapon "rhs_weap_m4a1_carryhandle";
 

if (s_loadout_radio != 3) then {
	player addBackpack "tf_rt1523g_big_bwmod_tropen";
	player linkItem "ItemRadio";
} else {
	player addBackpack "rhsusf_lwh_helmet_marpatd";
	for "_i" from 1 to 6 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
};

player addHeadgear "rhsusf_lwh_helmet_marpatd";
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};

player addWeapon "Binocular";
if (s_loadout_map != 3) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";