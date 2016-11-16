class Params {
    // Equipment
    class phx_loadout_blufor_uniform {
      title = "BLUFOR Uniform:";
        values[] = {0,1,2,3,4,5};
        texts[] = {"0 MARPAT WD",
          "1 OCP",
          "2 UCP",
          "3 MARPAT D",
          "4 G3 Black",
          "5 Police",
          "6 Cold War Era #2"
        };
        default = 0;
    };
    class phx_loadout_opfor_uniform {
      title = "OPFOR Uniform:";
        values[] = {0,1,2,3,4,5,6,7};
        texts[] = {"0 TTsKO Forest",
          "1 VDV Flora",
          "2 Flora",
          "3 EMR Desert",
          "4 MSV EMR",
          "5 TTsKO Mountain",
          "6 Specter-S Flora",
          "7 Cold War Era 1"
        };
        default = 0;
    };
    class phx_loadout_indfor_uniform {
      title = "INDFOR Uniform:";
        values[] = {0, 1};
        texts[] = {"Guerrila", ""};
        default = 0;
    };
    class phx_loadout_blufor_weapons {
      title = "BLUFOR Weapons (R, LMG, HMG, AT):";
        values[] = {0,1,2};
        texts[] = {"0 M16A4, M249, M240G, M136",
          "1 M16A4, M249, M240G, M136 (All Tracer)",
          "2 Kar98k, PKM, RShG-2"
        };
        default = 0;
    };
    class phx_loadout_opfor_weapons {
      title = "OPFOR Weapons (R, LMG, HMG, AT):";
        values[] = {0,1,2};
        texts[] = {"0 AK74M, PKM, PKP, RPG7",
          "1 AK74M, PKM, PKP, RPG7 (All Tracer)",
          "2 Mosin, PKM, RShG-2"
        };
        default = 0;
    };
    class phx_loadout_indfor_weapons {
      title = "INDFOR Weapons (R, LMG, HMG, AT):";
      values[] = {0,1,2};
      texts[] = {"0 AK74M, PKM, PKP, RPG7",
        "1 AK74M, PKM, PKP, RPG7 (All Tracer)",
        "2 Mosin, PKM, RShG-2"
      };
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
        default = 1;
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
        values[] = {0, 1};
        texts[] = {"Vanilla", "RHS"};
        default = 1;
    };
    class phx_loadout_radio {
        title = "Radio Deployment:";
        values[] = {0,1,2,3};
        texts[] = {"All Players (default)","Team Leaders and above","Squad Leaders and above","No Radios"};
        default = 0;
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
        default = 0;
    };
};
