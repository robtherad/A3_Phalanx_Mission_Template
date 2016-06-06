// Add clothing
player forceAddUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrier1_rgr";
player addBackpack "B_TacticalPack_mcamo";
player addHeadgear "H_HelmetB_sand";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
player addItemToBackpack "100Rnd_65x39_caseless_mag";
player addWeapon "arifle_MX_F";

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
