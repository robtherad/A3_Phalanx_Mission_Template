removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_mflora_patchless";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhs_6b23_medic";
for "_i" from 1 to 9 do {player addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_an_m8hc";};
player addBackpack "B_Kitbag_mcamo";
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
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
[player,"MedB"] call bis_fnc_setUnitInsignia;