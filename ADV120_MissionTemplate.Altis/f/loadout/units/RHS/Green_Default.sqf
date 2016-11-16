/*
    Sets the default clothing items for a side. If you want to have a certain class of unit have a unique clothing item, redefine these variables in that class's loadout script above the call to 'phx_fnc_loadout_handleClothing'.

    If the values are not redefined, the values in this file will be used.
*/

private _uniform = ["phx_loadout_indfor_uniform",0] call BIS_fnc_getParamValue;
_uniform = switch (_uniform) do {
    case 0: { // TTsKO Forest
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    case 1: { // VDV Flora
        phx_loadout_uniform = "rhs_uniform_vdv_flora";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    case 2: { // Flora
        phx_loadout_uniform = "rhs_uniform_mflora_patchless";
        phx_loadout_vest = "rhs_6b13_6sh92";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green";
    };
    case 3: { // EMR Desert
        phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
        phx_loadout_vest = "rhsgref_6b23_khaki_rifleman";
        phx_loadout_backpack = "B_FieldPack_cbr";
        phx_loadout_headgear = "rhs_6b7_1m_olive";
    };
    case 4: { // MSV EMR
        phx_loadout_uniform = "rhs_uniform_msv_emr";
        phx_loadout_vest = "rhs_6b23_digi_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_digi_ess";
    };
    case 5: { // TTsKO Mountain
        phx_loadout_uniform = "rhsgref_uniform_ttsko_mountain";
        phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
    };
    case 6: { // Specter-S Flora
        phx_loadout_uniform = "rhsgref_uniform_specter";
        phx_loadout_vest = "rhs_6sh92_vog";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green_ess";
    };
    case 7: { // Cold War Era 1
        phx_loadout_uniform = "rhsgref_uniform_woodland_olive";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_FieldPack_oli";
        phx_loadout_headgear = "rhs_ssh68";
    };
    default {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
};

private _weapons = ["phx_loadout_indfor_weapons",0] call BIS_fnc_getParamValue;
_weapons = switch (_weapons) do {
    case 0: { // AK74M, PKM, PKP, RPG7
        phx_loadout_rifle_weapon = "rhs_weap_ak74m";
        phx_loadout_rifle_gl_weapon = "rhs_weap_ak74m_gp25";
        phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK";
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green";
        phx_loadout_rifle_gl_he = "rhs_VOG25";
        phx_loadout_rifle_gl_smoke = "rhs_GRD40_White";
        phx_loadout_rifle_gl_flare = "rhs_VG40OP_white";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_mmg_weapon = "rhs_weap_pkp";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_antitank_weapon = "rhs_weap_rpg7";
        phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 1: { // AK74M, PKM, PKP, RPG7 (All Tracer)
        phx_loadout_rifle_weapon = "rhs_weap_ak74m";
        phx_loadout_rifle_gl_weapon = "rhs_weap_ak74m_gp25";
        phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK_green";
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green";
        phx_loadout_rifle_gl_he = "rhs_VOG25";
        phx_loadout_rifle_gl_smoke = "rhs_GRD40_Green";
        phx_loadout_rifle_gl_flare = "rhs_VG40OP_green";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green";
        phx_loadout_mmg_weapon = "rhs_weap_pkp";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green";
        phx_loadout_antitank_weapon = "rhs_weap_rpg7";
        phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 2: { // Mosin, PKM, RShG-2
        phx_loadout_rifle_weapon = "rhs_weap_m38";
        phx_loadout_rifle_gl_weapon = "rhs_weap_m38";
        phx_loadout_rifle_mag = "rhsgref_5Rnd_762x54_m38";
        phx_loadout_rifle_mag_tracer = "rhsgref_5Rnd_762x54_m38";
        phx_loadout_rifle_gl_he = "";
        phx_loadout_rifle_gl_smoke = "";
        phx_loadout_rifle_gl_flare = "";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_mmg_weapon = "rhs_weap_pkm";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_antitank_weapon = "rhs_weap_rshg2";
        phx_loadout_antitank_mag = "rhs_rshg2_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    default {
        phx_loadout_rifle_weapon = "rhs_weap_ak74m";
        phx_loadout_rifle_gl_weapon = "rhs_weap_ak74m_gp25";
        phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK";
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green";
        phx_loadout_rifle_gl_he = "rhs_VOG25";
        phx_loadout_rifle_gl_smoke = "rhs_GRD40_White";
        phx_loadout_rifle_gl_flare = "rhs_VG40OP_white";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_mmg_weapon = "rhs_weap_pkm";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_antitank_weapon = "rhs_weap_rpg7";
        phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
};
