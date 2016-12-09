/*
    Sets the default clothing items for a side. If you want to have a certain class of unit have a unique clothing item, redefine these variables in that class's loadout script above the call to 'phx_fnc_loadout_handleClothing'.

    If the values are not redefined, the values in this file will be used.
*/

private _uniform = ["phx_loadout_blufor_uniform",0] call BIS_fnc_getParamValue;
_uniform = switch (_uniform) do {
    case 0: { // MARPAT WD
        phx_loadout_uniform = "rhs_uniform_FROG01_wd";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";
    };
    case 1: { // OCP
        phx_loadout_uniform = "rhs_uniform_cu_ocp";
        phx_loadout_vest = "rhsusf_iotv_ocp_Rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
        phx_loadout_headgear = "rhsusf_ach_helmet_ESS_ocp";
    };
    case 2: { // UCP
        phx_loadout_uniform = "rhs_uniform_cu_ucp";
        phx_loadout_vest = "rhsusf_iotv_ucp_Rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_ucp";
        phx_loadout_headgear = "rhsusf_ach_helmet_ESS_ucp";
    };
    case 3: { // MARPAT D
        phx_loadout_uniform = "rhs_uniform_FROG01_d";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_ess";
    };
    case 4: { // G3 Black
        phx_loadout_uniform = "rhs_uniform_g3_blk";
        phx_loadout_vest = "V_PlateCarrierSpec_blk";
        phx_loadout_backpack = "B_TacticalPack_blk";
        phx_loadout_headgear = "rhsusf_opscore_bk";
    };
    case 5: { // Police
        phx_loadout_uniform = "rhs_uniform_g3_blk";
        phx_loadout_vest = "V_TacVest_blk_POLICE";
        phx_loadout_backpack = ["B_FieldPack_blk","B_AssaultPack_blk"] call BIS_fnc_selectRandom;
        phx_loadout_headgear = ["H_Cap_police","H_Cap_oli_hs","H_Cap_blk","H_MilCap_blue","H_MilCap_gry"] call BIS_fnc_selectRandom;
    };
    case 6: { // TTsKO Forest
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    case 7: { // VDV Flora
        phx_loadout_uniform = "rhs_uniform_vdv_flora";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    case 8: { // Flora
        phx_loadout_uniform = "rhs_uniform_mflora_patchless";
        phx_loadout_vest = "rhs_6b13_6sh92";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green";
    };
    case 9: { // EMR Desert
        phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
        phx_loadout_vest = "rhsgref_6b23_khaki_rifleman";
        phx_loadout_backpack = "B_FieldPack_cbr";
        phx_loadout_headgear = "rhs_6b7_1m_olive";
    };
    case 10: { // MSV EMR
        phx_loadout_uniform = "rhs_uniform_msv_emr";
        phx_loadout_vest = "rhs_6b23_digi_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_digi_ess";
    };
    case 11: { // TTsKO Mountain
        phx_loadout_uniform = "rhsgref_uniform_ttsko_mountain";
        phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
    };
    case 12: { // Specter-S Flora
        phx_loadout_uniform = "rhsgref_uniform_specter";
        phx_loadout_vest = "rhs_6sh92_vog";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green_ess";
    };
    case 13: { // Cold War Era 1
        phx_loadout_uniform = "rhsgref_uniform_woodland_olive";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_FieldPack_oli";
        phx_loadout_headgear = "rhs_ssh68";
    };
    case 14: { // Cold War Era 2
        phx_loadout_uniform = "U_BG_leader";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_Kitbag_cbr";
        phx_loadout_headgear = "H_ShemagOpen_khk";
    };
    default {
        phx_loadout_uniform = "rhs_uniform_FROG01_wd";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";
    };
};

private _weapons = ["phx_loadout_blufor_weapons",0] call BIS_fnc_getParamValue;
_weapons = switch (_weapons) do {
    case 0: { // M16A4, M249, M240G, M136 / SMAW
        phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle";
        phx_loadout_rifle_gl_weapon = "rhs_weap_m16a4_carryhandle_M203";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F";
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr";
        phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
        phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
        phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 1: { // M16A4 (All Tracer), M249, M240G, M136 / SMAW
        phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle";
        phx_loadout_rifle_gl_weapon = "rhs_weap_m16a4_carryhandle_M203";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell";
        phx_loadout_rifle_gl_smoke = "1Rnd_SmokeRed_Grenade_shell";
        phx_loadout_rifle_gl_flare = "UGL_FlareRed_F";
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_T_SAW";
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m62_tracer";
        phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
        phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
        phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 2: { // M4A1, M249, M240G, M136 / SMAW
        phx_loadout_rifle_weapon = "rhs_weap_m4a1_carryhandle";
        phx_loadout_rifle_gl_weapon = "rhs_weap_m4a1_carryhandle_m203";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F";
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr";
        phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
        phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
        phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 3: { // HK416 D10, M249, M240G, M136 / SMAW
        phx_loadout_rifle_weapon = "rhs_weap_hk416d10";
        phx_loadout_rifle_gl_weapon = "rhs_weap_hk416d10_m320";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F";
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr";
        phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
        phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
        phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 4: { // AK74M, PKM, PKP, RPG7
        phx_loadout_rifle_weapon = "rhs_weap_ak74m"; //rhs_weap_ak74m_camo
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
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 5: { // AK74M (All Tracer), PKM, PKP, RPG7
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
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 6: { // AK74M (Wood Camo), PKM, PKP, RPG7
        phx_loadout_rifle_weapon = "rhs_weap_ak74m_camo";
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
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 7: { // M70B1 / AKMS (GP25), PKM, PKP, RPG7
        phx_loadout_rifle_weapon = "rhs_weap_m70b1";
        phx_loadout_rifle_gl_weapon = "rhs_weap_akms_gp25";
        phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm";
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm";
        phx_loadout_rifle_gl_he = "rhs_VOG25";
        phx_loadout_rifle_gl_smoke = "rhs_GRD40_White";
        phx_loadout_rifle_gl_flare = "rhs_VG40OP_white";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_mmg_weapon = "rhs_weap_pkp";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_antitank_weapon = "rhs_weap_rpg7";
        phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 8: { // AKM (7.62), PKM, PKP, RPG7
        phx_loadout_rifle_weapon = "rhs_weap_akm";
        phx_loadout_rifle_gl_weapon = "rhs_weap_akm_gp25";
        phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm";
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm";
        phx_loadout_rifle_gl_he = "rhs_VOG25";
        phx_loadout_rifle_gl_smoke = "rhs_GRD40_Green";
        phx_loadout_rifle_gl_flare = "rhs_VG40OP_green";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green";
        phx_loadout_mmg_weapon = "rhs_weap_pkp";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green";
        phx_loadout_antitank_weapon = "rhs_weap_rpg7";
        phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 9: { // Mosin, PKM, RShG-2 / RPG7
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
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 10: { // Kar98k, PKM, RShG-2 / RPG7
        phx_loadout_rifle_weapon = "rhs_weap_kar98k";
        phx_loadout_rifle_gl_weapon = "rhs_weap_kar98k";
        phx_loadout_rifle_mag = "rhsgref_5Rnd_792x57_kar98k";
        phx_loadout_rifle_mag_tracer = "rhsgref_5Rnd_792x57_kar98k";
        phx_loadout_rifle_gl_he = "";
        phx_loadout_rifle_gl_smoke = "";
        phx_loadout_rifle_gl_flare = "";
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_mmg_weapon = "rhs_weap_pkm";
        phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR";
        phx_loadout_antitank_weapon = "rhs_weap_rshg2";
        phx_loadout_antitank_mag = "rhs_rshg2_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
    case 11: { // Unarmed
        phx_loadout_rifle_weapon = "";
        phx_loadout_rifle_gl_weapon = "";
        phx_loadout_rifle_mag = "";
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_gl_he = "";
        phx_loadout_rifle_gl_smoke = "";
        phx_loadout_rifle_gl_flare = "";
        phx_loadout_automaticrifle_weapon = "";
        phx_loadout_automaticrifle_mag = "";
        phx_loadout_mmg_weapon = "";
        phx_loadout_mmg_mag = "";
        phx_loadout_antitank_weapon = "";
        phx_loadout_antitank_mag = "";
        phx_loadout_mediumantitank_weapon = "";
        phx_loadout_mediumantitank_mag = "";
        phx_loadout_flare = "";
    };
    default {
        phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle";
        phx_loadout_rifle_gl_weapon = "rhs_weap_m16a4_carryhandle_M203";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F";
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr";
        phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
        phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
        phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        phx_loadout_flare = "rhs_weap_rsp30_white";
    };
};
