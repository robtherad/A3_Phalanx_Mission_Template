// Add clothing
player forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_Sleeves";
player addVest "CUP_V_B_MTV_Patrol";
player addBackpack "CUP_B_USMC_MOLLE";
player addHeadgear "CUP_H_USMC_HelmetWDL";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
player addWeapon "CUP_lmg_M249_E2";
for "_i" from 1 to 1 do {player addItemToVest "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};

// Add items
if (phx_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (phx_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (phx_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
