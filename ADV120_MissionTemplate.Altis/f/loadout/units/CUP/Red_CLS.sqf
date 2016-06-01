// Add clothing
player forceAddUniform "CUP_U_O_CHDKZ_Kam_02";
player addVest "CUP_V_BAF_Osprey_Mk2_DPM_Scout";
player addBackpack "CUP_B_CivPack_WDL";
player addHeadgear "CUP_H_SLA_Helmet";

// Add gear
for "_i" from 1 to 8 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 5 do {player addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";};
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addWeapon "CUP_arifle_AK107";
for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_545x39_AK_M";};

// Add Items
if (phx_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (phx_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (phx_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};
[player,"MedB"] call bis_fnc_setUnitInsignia;

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
