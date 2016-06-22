// Add clothing
player forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_Sleeves";
player addVest "CUP_V_B_MTV_Patrol";
player addBackpack "CUP_B_USMC_MOLLE";
player addHeadgear "CUP_H_USMC_HelmetWDL";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 3 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
player addWeapon "CUP_lmg_M240";
player removeWeapon "Binocular";

// Add items
if (phx_loadout_map isEqualTo 0) then {
    ["ItemMap"] call phx_fnc_loadout_addItem;
    if (phx_loadout_gps isEqualTo 0) then {
        ["ItemGPS"] call phx_fnc_loadout_addItem;
    } else {player unlinkItem "ItemGPS";};
} else {player unlinkItem "ItemMap";player unlinkItem "ItemGPS";};
if (phx_loadout_radio isEqualTo 0) then {
    ["ItemRadio"] call phx_fnc_loadout_addItem;
} else {player unlinkItem "ItemRadio";};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
