// Add clothing
player forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_Sleeves";
player addVest "CUP_V_B_MTV_Patrol";
player addBackpack "CUP_B_USMC_MOLLE";
player addHeadgear "CUP_H_USMC_HelmetWDL";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
player addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
player addWeapon "CUP_arifle_M16A4_Base";

// Add items
if (phx_loadout_map isEqualTo 0) then {
    player linkItem "ItemMap";
    if (phx_loadout_gps isEqualTo 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (phx_loadout_radio isEqualTo 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
