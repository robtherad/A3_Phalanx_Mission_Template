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
    default {};
};
