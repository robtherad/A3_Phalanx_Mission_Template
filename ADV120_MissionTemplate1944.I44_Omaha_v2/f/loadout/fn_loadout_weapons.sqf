#include "cfgLoadouts.hpp"

giveBLUFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:3";
  phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:6";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle_M203";
    phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:5";
    phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
    phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
    phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:6";
    phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
  } else { phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle"; };
  if (pRole == ROLE_AR) then {
    phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
    phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:3";
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_mmg_weapon = "rhs_weap_m240G";
    phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
  };
  if (pRole == ROLE_AM) then {
    phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:5";
    phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
    phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
  };
  if (pRole == ROLE_RAT) then {
    phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
    phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
    phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};

giveOPFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:3";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:6";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
    phx_loadout_rifle_gl_he = "rhs_VOG25:5";
    phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
    phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:6";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
  } else { phx_loadout_rifle_weapon = "rhs_weap_ak74m"; };
  if (pRole == ROLE_AR) then {
    phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_mmg_weapon = "rhs_weap_pkp";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AM) then {
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:5";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_RAT) then {
    phx_loadout_antitank_weapon = "rhs_weap_rpg7";
    phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
    phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};

switch (pWeapons) do {
    case WEAPONS_M16A4_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
    };
    case WEAPONS_M4A1_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_m4a1_carryhandle_m203";
        } else { phx_loadout_rifle_weapon = "rhs_weap_m4a1_carryhandle"; };
    };
    case WEAPONS_M4A1_BLOCK_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_M203_bk";
        } else { phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_bk"; };
    };
    case WEAPONS_M4A1_BLOCK_WOODLAND_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_M203_wd";
        } else { phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_wd"; };
    };
    case WEAPONS_HK416D10_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_hk416d10_m320";
        } else { phx_loadout_rifle_weapon = "rhs_weap_hk416d10"; };
    };
    case WEAPONS_HKG36C_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:3";
        phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:6";

        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_g36kv_ag36";
          phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:6";
          phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:4";
        } else { phx_loadout_rifle_weapon = "rhs_weap_g36c"; };

        if (pRole == ROLE_AM) then {
          phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:5";
          phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:4";
        };
    };

    case WEAPONS_AK74M_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
    };
    case WEAPONS_AK74M_WOODCAMO_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
        } else { phx_loadout_rifle_weapon = "rhs_weap_ak74m_camo"; };
    };
    case WEAPONS_AKM762_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
        phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:3";
        phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm:6";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_akm_gp25";
          phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:6";
          phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm:4";
        } else { phx_loadout_rifle_weapon = "rhs_weap_akm"; };
        if (pRole == ROLE_AM) then {
          phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:5";
          phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm:4";
        };
    };
    case WEAPONS_MOSIN_PKM_RSHG2_RPG7: {
        [] call giveOPFORLoadout;
        phx_loadout_rifle_weapon = "rhs_weap_m38";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "";
        };
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_mag = "rhsgref_5Rnd_762x54_m38:8";
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "rhs_weap_rshg2";
          phx_loadout_antitank_mag = "rhs_rshg2_mag";
        };
    };
    case WEAPONS_KAR98K_PKM_RSHG2_RPG7: {
        [] call giveOPFORLoadout;
        phx_loadout_rifle_weapon = "rhs_weap_kar98k";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "";
        };
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_mag = "rhsgref_5Rnd_792x57_kar98k:8";
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "rhs_weap_rshg2";
          phx_loadout_antitank_mag = "rhs_rshg2_mag";
        };
    };
    case WEAPONS_UNARMED: {
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
        phx_loadout_cuffs = "";
        phx_loadout_smoke = "";
        phx_loadout_flare = "";
        phx_loadout_defusalkit = "";
        phx_loadout_trigger = "";
        phx_loadout_entrenching = "";
        phx_loadout_grenade = "";
        phx_loadout_explosives = "";
    };
    case WEAPONS_SDAR_UNDERWATER: {
        phx_loadout_rifle_weapon = "arifle_SDAR_F";
        phx_loadout_rifle_gl_he = "";
        phx_loadout_rifle_gl_smoke = "";
        phx_loadout_rifle_gl_flare = "";
        phx_loadout_rifle_mag_tracer = "20Rnd_556x45_UW_mag:4";
        phx_loadout_rifle_mag = "30Rnd_556x45_Stanag:6";
        if (pRole == ROLE_AR) then {
          phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
          phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:3";
        };
        if (pRole == ROLE_AAR) then { phx_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:2"; };
        if (pRole == ROLE_MG) then {
          phx_loadout_mmg_weapon = "rhs_weap_m240G";
          phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
        };
        if (pRole == ROLE_AM) then { phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3"; };
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
          phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
        };
        if (pRole == ROLE_AT) then {
          phx_loadout_mediumantitank_weapon = "rhs_weap_smaw";
          phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        };
        if (pRole == ROLE_AAT) then { phx_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP"; };
        if (pRole == ROLE_CE) then { phx_loadout_explosives = "SatchelCharge_Remote_Mag"; };
        phx_loadout_entrenching = "";
        phx_loadout_flare = "rhs_weap_rsp30_white:3";
    };
    case WEAPONS_1944_NAZI: {
        phx_loadout_cuffs = "";
        phx_loadout_smoke = "LIB_nb39:2";
        phx_loadout_grenade = "LIB_shg24:2";
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_mag = "LIB_5Rnd_792x57:9";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_addBinocular = "LIB_Binocular_GER";
          phx_loadout_rifle_weapon = "LIB_MP40";
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "LIB_1Rnd_flare_white:3";
          phx_loadout_rifle_mag_tracer = "";
          phx_loadout_rifle_mag = "LIB_32Rnd_9x19:6";
        } else { phx_loadout_rifle_weapon = "LIB_K98"; };
        if (pRole == ROLE_AR) then {
          phx_loadout_automaticrifle_weapon = "LIB_MP44";
          phx_loadout_automaticrifle_mag = "LIB_30Rnd_792x33:3";
        };
        if (pRole == ROLE_AAR) then {
          phx_loadout_automaticrifle_mag = "LIB_30Rnd_792x33:3";
        };
        if (pRole == ROLE_MG) then {
          phx_loadout_mmg_weapon = "LIB_MG42";
          phx_loadout_mmg_mag = "LIB_50Rnd_792x57:3";
        };
        if (pRole == ROLE_AM) then {
          phx_loadout_mmg_mag = "LIB_50Rnd_792x57:5";
        };
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "LIB_RPzB";
          phx_loadout_antitank_mag = ""; //"LIB_1Rnd_RPzB";
        };
        if (pRole == ROLE_AT) then {
          phx_loadout_mediumantitank_weapon = "LIB_RPzB";
          phx_loadout_mediumantitank_mag = ""; //"LIB_1Rnd_RPzB";
        };
        if (pRole == ROLE_AAT) then {
          phx_loadout_mediumantitank_mag = "LIB_1Rnd_RPzB";
        };
        if (pRole == ROLE_P || pRole == ROLE_CR) then {
          phx_loadout_addBinocular = "LIB_Binocular_GER";
          phx_loadout_rifle_mag = "LIB_8Rnd_9x19:5";
          phx_loadout_rifle_weapon = "LIB_P38";
        };
        if (pRole == ROLE_CE) then {
          //LIB_Ladung_Big_MINE_mag
          //LIB_Ladung_Small_MINE_mag
          //LIB_TMI_42_MINE:1
          phx_loadout_trigger = "ACE_LIB_LadungPM";
          phx_loadout_explosives = "LIB_Ladung_Big_MINE_mag:2";
          phx_loadout_smoke = "";
          phx_loadout_grenade = "";
          phx_loadout_aid = "";
          phx_loadout_rifle_mag = "LIB_5Rnd_792x57:5";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_addBinocular = "LIB_Binocular_GER";
          phx_loadout_rifle_weapon = "LIB_K98ZF39";
        };
        phx_loadout_flare = "LIB_FLARE_PISTOL";
    };
    case WEAPONS_1944_US: {
        phx_loadout_cuffs = "";
        phx_loadout_smoke = "LIB_US_M18:2";
        phx_loadout_grenade = "LIB_US_Mk_2:2";
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_mag = "LIB_8Rnd_762x63:8";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_addBinocular = "LIB_Binocular_US";
          phx_loadout_rifle_weapon = "LIB_M1A1_Thompson";
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "LIB_1Rnd_flare_red:3";
          phx_loadout_rifle_mag = "LIB_30Rnd_45ACP:6";
        } else { phx_loadout_rifle_weapon = "LIB_M1_Garand"; };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_addBinocular = "LIB_Binocular_US";
          phx_loadout_rifle_weapon = "LIB_M1_Carbine";
          phx_loadout_rifle_mag = "LIB_15Rnd_762x33:7";
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "LIB_1Rnd_flare_red:3";
        };
        if (pRole == ROLE_AR) then {
          phx_loadout_automaticrifle_weapon = "LIB_M1918A2_BAR";
          phx_loadout_automaticrifle_mag = "LIB_20Rnd_762x63:6";
        };
        if (pRole == ROLE_AAR) then {
          phx_loadout_automaticrifle_mag = "LIB_20Rnd_762x63:3";
        };
        if (pRole == ROLE_MG) then {
          phx_loadout_mmg_weapon = "fow_w_m1919a6";
          phx_loadout_mmg_mag = "fow_30Rnd_762x63:4";
        };
        if (pRole == ROLE_AM) then {
          phx_loadout_mmg_mag = "fow_30Rnd_762x63:6";
        };
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "LIB_M1A1_Bazooka";
          phx_loadout_antitank_mag = "LIB_1Rnd_60mm_M6";
        };
        if (pRole == ROLE_AT) then {
          phx_loadout_mediumantitank_weapon = "LIB_M1A1_Bazooka";
          phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6";
        };
        if (pRole == ROLE_AAT) then {
          phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6:3";
        };
        if (pRole == ROLE_P || pRole == ROLE_CR) then {
          phx_loadout_addBinocular = "LIB_Binocular_US";
          phx_loadout_rifle_mag = "LIB_7Rnd_45ACP:5";
          phx_loadout_rifle_weapon = "LIB_Colt_M1911";
        };
        if (pRole == ROLE_CE) then {
          //LIB_US_M3_MINE_mag
          //LIB_US_M1A1_ATMINE_mag:1
          phx_loadout_trigger = "ACE_LIB_LadungPM";
          phx_loadout_explosives = "LIB_Ladung_Big_MINE_mag:2";
          phx_loadout_smoke = "";
          phx_loadout_grenade = "";
          phx_loadout_aid = "";
          phx_loadout_rifle_mag = "LIB_8Rnd_762x63:5";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_rifle_mag = "LIB_5Rnd_762x63:9";
          phx_loadout_addBinocular = "LIB_Binocular_US";
          phx_loadout_rifle_weapon = "LIB_M1903A4_Springfield";
        };
        phx_loadout_flare = "LIB_FLARE_PISTOL";
    };
    case WEAPONS_1944_SOVIET: {
        phx_loadout_cuffs = "";
        phx_loadout_smoke = "LIB_RDG:2";
        phx_loadout_grenade = "LIB_rg42:2";
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_mag = "LIB_5Rnd_762x54:8";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_addBinocular = "LIB_Binocular_SU";
          phx_loadout_rifle_weapon = "LIB_PPSh41_d";
          phx_loadout_rifle_gl_he = "";
          phx_loadout_rifle_gl_smoke = "";
          phx_loadout_rifle_gl_flare = "LIB_1Rnd_flare_red:3";
          phx_loadout_rifle_mag = "LIB_71Rnd_762x25:5";
        } else { phx_loadout_rifle_weapon = "LIB_M9130"; };
        if (pRole == ROLE_AR) then {
          phx_loadout_automaticrifle_weapon = "LIB_PPSh41_d";
          phx_loadout_automaticrifle_mag = "LIB_71Rnd_762x25:4";
        };
        if (pRole == ROLE_AAR) then {
          phx_loadout_automaticrifle_mag = "LIB_71Rnd_762x25:3";
        };
        if (pRole == ROLE_MG) then {
          phx_loadout_mmg_weapon = "LIB_DP28";
          phx_loadout_mmg_mag = "LIB_47Rnd_762x54:3";
        };
        if (pRole == ROLE_AM) then {
          phx_loadout_mmg_mag = "LIB_47Rnd_762x54:5";
        };
        if (pRole == ROLE_RAT) then {
          phx_loadout_antitank_weapon = "LIB_M1A1_Bazooka";
          phx_loadout_antitank_mag = "LIB_1Rnd_60mm_M6";
        };
        if (pRole == ROLE_AT) then {
          phx_loadout_mediumantitank_weapon = "LIB_M1A1_Bazooka";
          phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6";
        };
        if (pRole == ROLE_AAT) then {
          phx_loadout_mediumantitank_mag = "LIB_1Rnd_60mm_M6:3";
        };
        if (pRole == ROLE_P || pRole == ROLE_CR) then {
          phx_loadout_addBinocular = "LIB_Binocular_SU";
          phx_loadout_rifle_mag = "LIB_8Rnd_762x25:5";
          phx_loadout_rifle_weapon = "LIB_TT33";
        };
        if (pRole == ROLE_CE) then {
          //LIB_TM44_MINE:1
          phx_loadout_trigger = "ACE_LIB_LadungPM";
          phx_loadout_explosives = "LIB_Ladung_Big_MINE_mag:2";
          phx_loadout_smoke = "";
          phx_loadout_grenade = "";
          phx_loadout_aid = "";
          phx_loadout_rifle_mag = "LIB_5Rnd_762x54:5";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_addBinocular = "LIB_Binocular_SU";
          phx_loadout_rifle_weapon = "LIB_M9130PU";
        };
        phx_loadout_flare = "LIB_FLARE_PISTOL";
    };
    default {};
};
