removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_cu_ucp";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhsusf_iotv_ucp_Medic";
for "_i" from 1 to 9 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_an_m8hc";};
player addBackpack "rhsusf_assault_eagleaiii_ucp";
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addHeadgear "rhsusf_ach_helmet_ucp";
player addWeapon "rhs_weap_m4a1_carryhandle";
 
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