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
player addVest "rhs_6b23_ML_6sh92";
for "_i" from 1 to 9 do {player addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
player addBackpack "B_Kitbag_mcamo";
for "_i" from 1 to 2 do {player addItemToBackpack "SatchelCharge_Remote_Mag";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_30Rnd_762x39mm";};
player addHeadgear "rhs_6b27m_ml";
player addGoggles "G_Bandanna_khk";
player addWeapon "rhs_weap_akm";
removeAllPrimaryWeaponItems player;
 
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};