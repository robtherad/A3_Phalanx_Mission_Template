#include "..\f\loadout\cfgLoadouts.hpp"

class Params {
    // Radios
    // ============================================================================================

    // F3 - Radio Systems Support
    // Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

    class phx_param_radios {
      title = "Radio System";
      values[] = {0,1,2};
      texts[] = {"Off","TFAR","ACRE2"};
      default = 1;
    };

    // Equipment
    /*
      UNIFORM_MARPAT_WD
      UNIFORM_OCP
      UNIFORM_UCP
      UNIFORM_MARPAT_D
      UNIFORM_G3_BLACK
      UNIFORM_POLICE
      UNIFORM_TTSKO_FOREST
      UNIFORM_FLORA_VDV
      UNIFORM_FLORA
      UNIFORM_EMR_DESERT
      UNIFORM_EMR_SUMMER
      UNIFORM_TTSKO_MOUNTAIN
      UNIFORM_SPECTER_S_FLORA
      UNIFORM_COLDWAR_ERA_1
      UNIFORM_COLDWAR_ERA_2
      UNIFORM_M10_TTSKO_MOUNTAIN
      UNIFORM_M10_DIGITAL
      UNIFORM_M88_MOUNTAIN_LES
      UNIFORM_M88_TTSKO_URBAN
      UNIFORM_M93_OAKLEAF
      UNIFORM_M93_FLECKTARN
      UNIFORM_M93_WOODLAND
      UNIFORM_GUERILLA
      UNIFORM_WETSUIT
      UNIFORM_CIVILIAN_TANOA
      UNIFORM_CIVILIAN
      UNIFORM_1944_CIVILIAN
      UNIFORM_1944_NAZI
      UNIFORM_1944_USARMY
      UNIFORM_1944_SOVIET

      WEAPONS_M16A4_M249_M240G_M136_SMAW
      WEAPONS_M4A1_M249_M240G_M136_SMAW
      WEAPONS_M4A1_BLOCK_M249_M240G_M136_SMAW
      WEAPONS_M4A1_BLOCK_WOODLAND_M249_M240G_M136_SMAW
      WEAPONS_HK416D10_M249_M240G_M136_SMAW
      WEAPONS_HKG36C_M249_M240G_M136_SMAW
      WEAPONS_AK74M_PKM_PKP_RPG7
      WEAPONS_AK74M_WOODCAMO_PKM_PKP_RPG7
      WEAPONS_AKM762_PKM_PKP_RPG7
      WEAPONS_MOSIN_PKM_RSHG2_RPG7
      WEAPONS_KAR98K_PKM_RSHG2_RPG7
      WEAPONS_UNARMED
      WEAPONS_SDAR_UNDERWATER
      WEAPONS_1944_NAZI
      WEAPONS_1944_US
      WEAPONS_1944_SOVIET

      ATTACHMENTS_NONE
      ATTACHMENTS_BLUFOR_FLASHLIGHT
      ATTACHMENTS_OPFOR_FLASHLIGHT
    */
    class phx_loadout_blufor_uniform {
      title = "BLUFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_1944_NAZI;
    };
    class phx_loadout_opfor_uniform {
      title = "OPFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_1944_SOVIET;
    };
    class phx_loadout_indfor_uniform {
      title = "INDFOR Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_1944_USARMY;
    };
    class phx_loadout_civ_uniform {
      title = "CIV Uniform:";
      values[] = UNIFORM_VALUES;
      texts[] = UNIFORM_TEXTS;
      default = UNIFORM_1944_CIVILIAN;
    };
    class phx_loadout_blufor_weapons {
      title = "BLUFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_1944_NAZI;
    };
    class phx_loadout_opfor_weapons {
      title = "OPFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_1944_SOVIET;
    };
    class phx_loadout_indfor_weapons {
      title = "INDFOR Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_1944_US;
    };
    class phx_loadout_civ_weapons {
      title = "CIV Weapons (R, LMG, HMG, AT):";
      values[] = WEAPON_VALUES;
      texts[] = WEAPON_TEXTS;
      default = WEAPONS_UNARMED;
    };
    class phx_loadout_blufor_attachments {
      title = "BLUFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_opfor_attachments {
      title = "OPFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_indfor_attachments {
      title = "INDFOR Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_civ_attachments {
      title = "CIV Attachments:";
      values[] = ATTACHMENT_VALUES;
      texts[] = ATTACHMENT_TEXTS;
      default = ATTACHMENTS_NONE;
    };
    class phx_loadout_blufor_lr_radio {
      title = "BLUFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_opfor_lr_radio {
      title = "OPFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_indfor_lr_radio {
      title = "INDFOR Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 1;
    };
    class phx_loadout_civ_lr_radio {
      title = "CIV Long Range Radios";
      values[] = {0,1};
      texts[] = {"Off","On"};
      default = 0;
    };
    // Environment
    class phx_core_timeOfDay {
        title = "Time of Day:";
        values[] = {-1, 0, 1, 2, 3};
        texts[] = {"Mission Time (DEFAULT)", "Sunrise", "Noon", "Sunset", "Midnight"};
        default = -1;
    };
    class phx_core_weatherSettings {
        title = "Weather:";
        values[] = {-1, 0, 1, 2, 3, 4};
        texts[] = {"Mission Weather (DEFAULT)", "Light Fog", "Fog", "Light Rain", "Rain", "Clear"};
        default = -1;
    };
    // Safestart
    class f_param_mission_timer {
        title = "Safe Start (Minutes)";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,15};
        texts[] = {"Off","1","2","3","4","5","6","7","8","9","10 (default)","15"};
        default = 10;
        code = "f_param_mission_timer = %1";
    };
    class phx_missionTimelimit {
        title = "Time Limit:";
        values[] = {5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90};
        texts[] = {"5 minutes","10 minutes","15 minutes","20 minutes","25 minutes","30 minutes","35 minutes","40 minutes","45 minutes (default)","50 minutes","55 minutes","60 minutes","65 minutes","70 minutes","75 minutes","80 minutes","85 minutes","90 minutes",};
        default = 45;
    };
    // Other Template Scripts
    class phx_gps_markersEnabledParam {
        title = "GPS Map Markers:";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled (default)"};
        default = 0;
    };
    class phx_param_enableRadioPreset {
        title = "Enable Preset Radios:";
        values[] = {true,false};
        texts[] = {"Enabled","Disabled"};
        default = true;
    };
    // Loadout Stuff
    class phx_loadout_modset{
      title = "Loadout Modset:";
        values[] = {0, 1, 2};
        texts[] = {"Vanilla", "RHS", "IFA/FOW"};
        default = 2;
    };
    class phx_loadout_radio {
        title = "Radio Deployment:";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No Radios"};
        default = 1;
    };
    class phx_loadout_map {
        title = "Map Deployment:";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No Maps"};
        default = 0;
    };
    class phx_loadout_gps {
        title = "GPS Deployment (Requires Map):";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No GPS"};
        default = 3;
    };
};
