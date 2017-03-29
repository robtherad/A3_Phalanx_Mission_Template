removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_cu_ucp";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhsusf_iotv_ucp";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
player addBackpack "rhsusf_assault_eagleaiii_ucp";
for "_i" from 1 to 3 do {player addItemToBackpack "rhsusf_100Rnd_762x51";};
player addHeadgear "rhsusf_ach_helmet_ucp";
player addWeapon "rhs_weap_m240B";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};