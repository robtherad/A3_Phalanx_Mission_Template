// Add clothing
player forceAddUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrier1_rgr";
player addBackpack "B_TacticalPack_mcamo";
player addHeadgear "H_HelmetB_sand";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 3 do {player addItemToBackpack "130Rnd_338_Mag";};
player addWeapon "arifle_MX_F";
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
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
