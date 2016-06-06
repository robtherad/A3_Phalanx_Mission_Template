// Add clothing
player forceAddUniform "rhs_uniform_FROG01_wd";
player addVest "rhsusf_spc_rifleman";
player addBackpack "rhsusf_assault_eagleaiii_coy";
player addHeadgear "rhsusf_lwh_helmet_marpatwd";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 5 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "UGL_FlareWhite_F";};
for "_i" from 1 to 7 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
player addWeapon "rhs_weap_m16a4_carryhandle_M203";
for "_i" from 1 to 6 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_100Rnd_762x51_m80a1epr";};
player addWeapon "Binocular";

// Add items
if ((phx_loadout_map isEqualTo 0) or (phx_loadout_map isEqualTo 1)) then {
    player linkItem "ItemMap";
    if ((phx_loadout_gps isEqualTo 0) or (phx_loadout_gps isEqualTo 1)) then {player linkItem "ItemGPS";}; 
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if ((phx_loadout_radio isEqualTo 0) or (phx_loadout_radio isEqualTo 1)) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
