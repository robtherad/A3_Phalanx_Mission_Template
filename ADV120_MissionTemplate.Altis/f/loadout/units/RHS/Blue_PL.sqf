// Add clothing
player forceAddUniform "rhs_uniform_FROG01_wd";
player addVest "rhsusf_spc_rifleman";
player addBackpack "rhsusf_assault_eagleaiii_coy";
player addHeadgear "rhsusf_lwh_helmet_marpatwd";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 7 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
player addWeapon "rhs_weap_m16a4_carryhandle";
for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
player addWeapon "rhs_weap_rsp30_white";
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_weap_rsp30_white";};
player addWeapon "Binocular";

// Add items
if !(phx_loadout_map isEqualTo 3) then {
    player linkItem "ItemMap";
    if !(phx_loadout_gps isEqualTo 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if !(phx_loadout_radio isEqualTo 3) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
