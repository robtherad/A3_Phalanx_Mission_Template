removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_mflora_patchless";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhs_6b23_ML_6sh92_vog_headset";
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_green";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};

player addWeapon "rhs_weap_ak74m_gp25";
removeAllPrimaryWeaponItems player;

if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "tf_mr3000_rhs";
	for "_i" from 1 to 4 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
	player linkItem "ItemRadio";
} else {
	player addBackpack "B_Kitbag_mcamo";
	for "_i" from 1 to 12 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
};

for "_i" from 1 to 4 do {player addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_Green";};
player addHeadgear "rhs_6b27m_ml";
player addGoggles "G_Bandanna_khk";
player addWeapon "Binocular";
if ((s_loadout_map == 0) or (s_loadout_map == 1)) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";