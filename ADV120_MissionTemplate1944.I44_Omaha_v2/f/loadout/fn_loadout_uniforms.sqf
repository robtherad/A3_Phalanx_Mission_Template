#include "cfgLoadouts.hpp"

//this disableTIEquipment true;this setVehicleAmmo 0;this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];reload this

_lrRadio = "";
switch (side group player) do {
    case west: {
      _giveLR = ["phx_loadout_blufor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_rt1523g_black";
      };
    };
    case east: {
      _giveLR = ["phx_loadout_opfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_mr3000_rhs";
      };
    };
    case independent: {
      _giveLR = ["phx_loadout_indfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    case civilian: {
      _giveLR = ["phx_loadout_civ_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    default {
      _lrRadio = "";
    };
};

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
        phx_loadout_uniform = "rhs_uniform_FROG01_wd";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_spc_corpsman";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_spc_squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_spc_teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_spc_iar";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_spc_light";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_spc_mg";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_spc";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk";
          phx_loadout_vest = "rhsusf_spc_crewman";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsusf_spc_marksman";
        };
    };
    case UNIFORM_OCP: {
        phx_loadout_uniform = "rhs_uniform_cu_ocp";
        phx_loadout_vest = "rhsusf_iotv_ocp_Rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
        phx_loadout_headgear = "rhsusf_ach_helmet_ESS_ocp";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_Medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_Squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_Teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_SAW";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_Repair";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_SAW";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_iotv_ocp";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_vest = "rhsusf_iotv_ocp_Repair";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_UCP: {
        phx_loadout_uniform = "rhs_uniform_cu_ucp";
        phx_loadout_vest = "rhsusf_iotv_ucp_Rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_ucp";
        phx_loadout_headgear = "rhsusf_ach_helmet_ESS_ucp";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_Medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_Squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_Teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_SAW";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_Repair";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_SAW";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_iotv_ucp";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_vest = "rhsusf_iotv_ucp_Repair";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_MARPAT_D: {
        phx_loadout_uniform = "rhs_uniform_FROG01_d";
        phx_loadout_vest = "rhsusf_spc_rifleman";
        phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_ess";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsusf_spc_corpsman";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsusf_spc_squadleader";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsusf_spc_teamleader";
        };
        if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
          phx_loadout_vest = "rhsusf_spc_iar";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsusf_spc_light";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_vest = "rhsusf_spc_mg";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "rhsusf_spc";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_headset";
          phx_loadout_vest = "rhsusf_spc_crewman";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsusf_spc_marksman";
        };
    };
    case UNIFORM_G3_BLACK: {
        phx_loadout_uniform = "rhs_uniform_g3_blk";
        phx_loadout_vest = "V_PlateCarrier2_blk";
        phx_loadout_backpack = "B_AssaultPack_blk";
        phx_loadout_headgear = "rhsusf_opscore_bk_pelt";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_vest = "V_PlateCarrier1_blk";
          phx_loadout_backpack = _lrRadio;
        };
    };
    case UNIFORM_POLICE: {
        phx_loadout_uniform = "rhs_uniform_g3_blk";
        phx_loadout_vest = "V_TacVest_blk_POLICE";
        phx_loadout_backpack = selectRandom ["B_FieldPack_blk","B_AssaultPack_blk"];
        phx_loadout_headgear = selectRandom ["H_Cap_police","H_Cap_oli_hs","H_Cap_blk","H_MilCap_blue","H_MilCap_gry"];
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "H_Cap_headphones";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_TTSKO_FOREST: {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_ttsko_forest";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_ttsko_forest";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_FLORA_VDV: {
        phx_loadout_uniform = "rhs_uniform_vdv_flora";
        phx_loadout_vest = "rhs_6b23_engineer";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b26";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsgref_6b23_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhs_6b23_crewofficer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhs_6b23_crew";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhs_6b23_rifleman";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhs_6b23_engineer";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhs_6b23_engineer";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhs_6b23_sniper";
        };
    };
    case UNIFORM_EMR_DESERT: {
        phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
        phx_loadout_vest = "rhsgref_6b23_khaki_rifleman";
        phx_loadout_backpack = "B_FieldPack_cbr";
        phx_loadout_headgear = "rhs_6b7_1m_olive";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_officer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_nco";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_khaki";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsgref_6b23_khaki_sniper";
        };
    };
    case UNIFORM_EMR_SUMMER: {
        phx_loadout_uniform = "rhs_uniform_emr_patchless";
        phx_loadout_vest = "rhs_6b23_digi_6sh92_spetsnaz2";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_digi_ess";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhs_6b23_digi_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhs_6b23_digi_6sh92_headset_mapcase";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhs_6b23_digi_rifleman";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhs_6b23_digi";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhs_6b23_digi";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhs_6b23_digi_sniper";
        };
    };
    case UNIFORM_TTSKO_MOUNTAIN: {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_mountain";
        phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_SPECTER_S_FLORA: {
        phx_loadout_uniform = "rhsgref_uniform_specter";
        phx_loadout_vest = "rhs_6sh92_vog";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_green_ess";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_COLDWAR_ERA_1: {
        phx_loadout_uniform = "rhsgref_uniform_woodland_olive";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_FieldPack_oli";
        phx_loadout_headgear = "rhs_ssh68";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_COLDWAR_ERA_2: {
        phx_loadout_uniform = "U_BG_leader";
        phx_loadout_vest = "rhs_vest_commander";
        phx_loadout_backpack = "B_Kitbag_cbr";
        phx_loadout_headgear = "H_ShemagOpen_khk";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_M10_TTSKO_MOUNTAIN: {
        phx_loadout_uniform = "rhsgref_uniform_para_ttsko_mountain";
        phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_ssh68_ttsko_mountain";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_officer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_nco";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_mountain_sniper";
        };
    };
    case UNIFORM_M10_DIGITAL: {
        phx_loadout_uniform = "rhssaf_uniform_m10_digital_summer";
        phx_loadout_vest = "rhsgref_6b23_ttsko_digi_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_ssh68_ttsko_digi";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi_officer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi_nco";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhsgref_6b23_ttsko_digi_sniper";
        };
    };
    case UNIFORM_M88_MOUNTAIN_LES: {
        phx_loadout_uniform = "rhs_uniform_m88_patchless";
        phx_loadout_vest = "rhs_6b23_ML_engineer";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhs_6b27m_ml";
        if (pRole == ROLE_CLS) then {
          phx_loadout_vest = "rhs_6b23_ML_medic";
        };
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          phx_loadout_vest = "rhs_6b23_ML_crewofficer";
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_vest = "rhs_6b23_ML_crew";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "rhs_6b23_ML_rifleman";
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_vest = "rhs_6b23_ML_engineer";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_vest = "rhs_6b23_ML_engineer";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_vest = "rhs_6b23_ML_sniper";
        };
    };
    case UNIFORM_M88_TTSKO_URBAN: {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_urban";
        phx_loadout_vest = "V_Chestrig_blk";
        phx_loadout_backpack = "B_AssaultPack_blk";
        phx_loadout_headgear = "rhssaf_helmet_m97_black_nocamo";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_backpack = "rhs_assault_umbts_engineer_empty";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_M93_OAKLEAF: {
        phx_loadout_uniform = "rhssaf_uniform_m93_oakleaf_summer";
        phx_loadout_vest = "rhssaf_vest_md99_woodland_rifleman";
        phx_loadout_backpack = "rhssaf_kitbag_smb";
        phx_loadout_headgear = "rhssaf_helmet_m97_oakleaf";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_M93_FLECKTARN: {
        phx_loadout_uniform = selectRandom ["rhsgref_uniform_flecktarn", "rhsgref_uniform_flecktarn_full"];
        phx_loadout_vest = "rhs_6b23_6sh116_od";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_helmet_pasgt_flecktarn";
        phx_loadout_vest = "rhs_6b23_6sh116_vog_od";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_M93_WOODLAND: {
        phx_loadout_uniform = selectRandom ["rhsgref_uniform_woodland", "rhsgref_uniform_woodland_olive"];
        phx_loadout_vest = "rhs_6b13_Flora_6sh92";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_helmet_pasgt_woodland";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_O";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_GUERILLA: {
        phx_loadout_uniform = selectRandom ["U_BG_Guerilla2_2", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_C_HunterBody_grn"];
        phx_loadout_vest = "rhsgref_otv_khaki";
        phx_loadout_backpack = "rhs_sidor";
        phx_loadout_headgear = "";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_headgear = "rhs_gssh18";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_WETSUIT: {
        phx_loadout_uniform = "U_B_Wetsuit";
        phx_loadout_vest = "V_RebreatherB";
        phx_loadout_backpack = "B_AssaultPack_blk";
        phx_loadout_headgear = "";
        if (pRole == ROLE_PL || pRole == ROLE_SL) then {
          if (!(_lrRadio isEqualTo "")) then {
            phx_loadout_backpack = _lrRadio;
          };
        };
        if (pRole == ROLE_P) then {
          phx_loadout_uniform = "rhssaf_uniform_heli_pilot";
          phx_loadout_vest = "V_TacVest_blk";
          phx_loadout_headgear = "H_PilotHelmetHeli_B";
          phx_loadout_backpack = _lrRadio;
        };
    };
    case UNIFORM_CIVILIAN_TANOA: {
        phx_loadout_uniform = selectRandom ["U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_1_F", "U_C_Man_casual_6_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F"];
        phx_loadout_vest = "";
        phx_loadout_backpack = _lrRadio;
        phx_loadout_headgear = "";
    };
    case UNIFORM_CIVILIAN: {
        phx_loadout_uniform = selectRandom ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_Rangemaster", "U_C_Poor_1", "U_C_Poor_2", "U_C_Poor_shorts_1", "U_C_Poor_shorts_2", "U_C_Commoner_shorts", "U_Marshal"];
        phx_loadout_vest = "";
        phx_loadout_backpack = _lrRadio;
        phx_loadout_headgear = "";
    };
    case UNIFORM_1944_CIVILIAN: {
        phx_loadout_uniform = selectRandom ["U_LIB_CIV_Citizen_1", "U_LIB_CIV_Citizen_2", "U_LIB_CIV_Citizen_3", "U_LIB_CIV_Citizen_4", "U_LIB_CIV_Citizen_5", "U_LIB_CIV_Citizen_6", "U_LIB_CIV_Citizen_7", "U_LIB_CIV_Citizen_8", "U_LIB_CIV_Villager_1", "U_LIB_CIV_Villager_2", "U_LIB_CIV_Villager_3", "U_LIB_CIV_Villager_4", "U_LIB_CIV_Functionary_1", "U_LIB_CIV_Functionary_2", "U_LIB_CIV_Functionary_3", "U_LIB_CIV_Functionary_4"];
        phx_loadout_vest = "";
        phx_loadout_backpack = "";
        phx_loadout_headgear = "";
    };
    case UNIFORM_1944_NAZI: {
        phx_loadout_uniform = "U_LIB_GER_Schutze";
        phx_loadout_vest = "V_LIB_GER_VestKar98";
        phx_loadout_backpack = "B_LIB_GER_A_frame";
        phx_loadout_headgear = "H_LIB_GER_Helmet";
        if (pRole == ROLE_CLS) then {
          phx_loadout_uniform = "U_LIB_GER_Medic";
          phx_loadout_backpack = "B_LIB_GER_MedicBackpack";
        };
        if (pRole == ROLE_PL) then {
          phx_loadout_uniform = "U_LIB_GER_Leutnant";
          phx_loadout_vest = "V_LIB_GER_FieldOfficer";
          phx_loadout_headgear = "H_LIB_GER_OfficerCap";
        };
        if (pRole == ROLE_SL) then {
          phx_loadout_uniform = "U_LIB_GER_Unterofficer";
          phx_loadout_vest = "V_LIB_GER_VestUnterofficer";
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_uniform = "U_LIB_GER_Gefreiter";
          phx_loadout_vest = "V_LIB_GER_VestMP40";
        };
        if (pRole == ROLE_AR) then {
          phx_loadout_uniform = "U_LIB_GER_Gefreiter";
          phx_loadout_vest = "V_LIB_GER_VestSTG";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_vest = "V_LIB_GER_PioneerVest";
          //phx_loadout_backpack = "B_LIB_GER_SapperBackpack";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_uniform = "U_LIB_GER_MG_schutze";
          phx_loadout_vest = "V_LIB_GER_VestMG";
        };
        if (pRole == ROLE_AT || pRole == ROLE_RAT) then {
          phx_loadout_uniform = "U_LIB_GER_MG_schutze";
          phx_loadout_backpack = "B_LIB_GER_Panzer";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_uniform = "U_LIB_GER_LW_pilot";
          phx_loadout_headgear = "H_LIB_GER_LW_PilotHelmet";
          phx_loadout_vest = "";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_uniform = "U_LIB_GER_Tank_crew_private";
          phx_loadout_headgear = "H_LIB_GER_TankPrivateCap";
          phx_loadout_vest = "V_LIB_GER_TankPrivateBelt";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_uniform = "U_LIB_GER_Scharfschutze";
          phx_loadout_vest = "V_LIB_GER_SniperBelt";
          phx_loadout_headgear = "H_LIB_GER_HelmetCamo";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_1944_USARMY: {
        phx_loadout_uniform = "U_LIB_US_Private";
        phx_loadout_vest = "V_LIB_US_Vest_Garand";
        phx_loadout_backpack = "B_LIB_US_Backpack";
        phx_loadout_headgear = "H_LIB_US_Helmet";
        if (pRole == ROLE_CLS) then {
          phx_loadout_uniform = "U_LIB_US_Med";
          phx_loadout_vest = "V_LIB_US_Vest_Medic";
          phx_loadout_backpack = "B_LIB_US_MedicBackpack";
          phx_loadout_headgear = "H_LIB_US_Helmet_Med";
        };
        if (pRole == ROLE_PL) then {
          phx_loadout_uniform = "U_LIB_US_Off";
          phx_loadout_vest = "V_LIB_US_Vest_Thompson_nco";
          phx_loadout_headgear = "H_LIB_US_Helmet_Second_lieutenant";
        };
        if (pRole == ROLE_SL) then {
          phx_loadout_uniform = "U_LIB_US_Sergant";
          phx_loadout_vest = "V_LIB_US_Vest_Thompson";
          phx_loadout_headgear = "H_LIB_US_Helmet_Net";
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_uniform = "U_LIB_US_Corp";
          phx_loadout_vest = "V_LIB_US_Vest_Carbine";
          phx_loadout_headgear = "H_LIB_US_Helmet_Net";
        };
        if (pRole == ROLE_AR) then {
          phx_loadout_uniform = "U_LIB_US_Private_1st";
          phx_loadout_vest = "V_LIB_US_Vest_Bar";
        };
        if (pRole == ROLE_AAR) then {
          phx_loadout_uniform = "U_LIB_US_Private_1st";
          phx_loadout_vest = "V_LIB_US_Vest_Grenadier";
          phx_loadout_backpack = "B_LIB_US_Bandoleer";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_uniform = "U_LIB_US_Eng";
          phx_loadout_vest = "V_LIB_US_Vest_Carbine_eng";
          //phx_loadout_backpack = "B_LIB_US_Backpack_eng";
          phx_loadout_headgear = "H_LIB_US_Helmet_Net";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_uniform = "U_LIB_US_Private_1st";
          phx_loadout_vest = "V_LIB_US_Vest_Bar";
        };
        if (pRole == ROLE_AT || pRole == ROLE_RAT || pRole == ROLE_AAT) then {
          phx_loadout_uniform = "U_LIB_US_Private_1st";
          phx_loadout_backpack = "B_LIB_US_RocketBag";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_uniform = "U_LIB_US_Private";
          phx_loadout_headgear = "H_LIB_US_Helmet_Pilot";
          phx_loadout_vest = "";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_uniform = "U_LIB_US_Tank_Crew";
          phx_loadout_headgear = "H_LIB_US_Helmet_Tank";
          phx_loadout_vest = "V_LIB_US_Vest_45";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_uniform = "U_LIB_US_Snipe";
          phx_loadout_vest = "V_LIB_US_Vest_Garand";
          phx_loadout_backpack = "";
        };
    };
    case UNIFORM_1944_SOVIET: {
        phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
        phx_loadout_vest = "V_LIB_SOV_RA_MosinBelt";
        phx_loadout_backpack = "B_LIB_SOV_RA_GasBag";
        phx_loadout_headgear = "H_LIB_SOV_RA_PrivateCap";
        if (pRole == ROLE_CLS) then {
          phx_loadout_backpack = "B_LIB_SOV_RA_MedicalBag";
        };
        if (pRole == ROLE_PL) then {
          phx_loadout_uniform = "U_LIB_SOV_Kapitan_summer";
          phx_loadout_vest = "V_LIB_SOV_RA_OfficerVest";
          phx_loadout_headgear = "H_LIB_SOV_RA_OfficerCap";
        };
        if (pRole == ROLE_SL) then {
          phx_loadout_uniform = "U_LIB_SOV_Sergeant";
          phx_loadout_vest = "V_LIB_SOV_RA_PPShBelt";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_uniform = "U_LIB_SOV_Efreitor_summer";
          phx_loadout_vest = "V_LIB_SOV_RA_MosinBelt";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_AR) then {
          phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
          phx_loadout_vest = "V_LIB_SOV_RA_PPShBelt";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_AAR) then {
          phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
          phx_loadout_vest = "V_LIB_SOV_RA_PPShBelt";
        };
        if (pRole == ROLE_CE) then {
          phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
          //phx_loadout_backpack = "B_LIB_SOV_RA_RucksackMines2";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_MG || pRole == ROLE_AM) then {
          phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
          phx_loadout_vest = "V_LIB_SOV_IShBrVestMG";
          phx_loadout_backpack = "B_LIB_SOV_RA_MGAmmoBag";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_AT || pRole == ROLE_RAT || pRole == ROLE_AAT) then {
          phx_loadout_uniform = "U_LIB_SOV_Strelok_summer";
          phx_loadout_backpack = "B_LIB_US_RocketBag";
          phx_loadout_headgear = "H_LIB_SOV_RA_Helmet";
        };
        if (pRole == ROLE_P) then {
          phx_loadout_uniform = "U_LIB_SOV_Pilot";
          phx_loadout_headgear = "H_LIB_SOV_PilotHelmet";
          phx_loadout_vest = "V_LIB_SOV_RA_Belt";
          phx_loadout_backpack = "B_LIB_SOV_RA_Paradrop";
        };
        if (pRole == ROLE_CR) then {
          phx_loadout_uniform = "U_LIB_SOV_Tank_leutenant";
          phx_loadout_headgear = "H_LIB_SOV_TankHelmet";
          phx_loadout_vest = "V_LIB_SOV_RA_TankOfficerSet";
          phx_loadout_backpack = "";
        };
        if (pRole == ROLE_MK) then {
          phx_loadout_uniform = "U_LIB_SOV_Sniper";
          phx_loadout_vest = "V_LIB_SOV_RA_SniperVest";
          phx_loadout_backpack = "";
          phx_loadout_headgear = "";
        };
    };
    default {};
};
