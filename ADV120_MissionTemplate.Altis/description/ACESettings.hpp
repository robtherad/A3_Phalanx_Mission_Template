class ACE_Settings {
    class ace_ui_groupBar {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_finger_enabled {
        value = 1;
        typeName = "BOOL";
    };
    class ace_finger_maxRange {
        value = 7;
        typeName = "SCALAR";
    };
    class ace_map_gestures_maxRange {
        value = 7;
        typeName = "SCALAR";
    };
    class ace_frag_reflectionsEnabled {
        value = 1;
        typeName = "BOOL";
    };
    class ace_map_mapIllumination {
        value = 0;
        typeName = "BOOL";
    };
    class ace_map_mapGlow {
        value = 0;
        typeName = "BOOL";
    };
    class ace_map_mapShake {
        value = 0;
        typeName = "BOOL";
    };
    // Nametags
    class ace_nametags_defaultNametagColor {
        value[] = {0.77, 0.51, 0.08, 0};
        typeName = "COLOR";
        isClientSettable = 0;
    };
    class ace_nametags_showPlayerNames {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_nametags_showPlayerRanks {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_nametags_showVehicleCrewInfo {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
    };
    class ace_nametags_showNamesForAI {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_nametags_showCursorTagForVehicles {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_nametags_showSoundWaves {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_nametags_playerNamesViewDistance {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_nametags_playerNamesMaxAlpha {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    // Advanced Ballistics
    class ace_advanced_ballistics_enabled {
        typeName = "BOOL";
        value = 0;
    };
    class ace_advanced_ballistics_simulateForSnipers {
        typeName = "BOOL";
        value = 0;
    };
    class ace_advanced_ballistics_simulateForGroupMembers {
        typeName = "BOOL";
        value = 0;
    };
    class ace_advanced_ballistics_simulateForEveryone {
        typeName = "BOOL";
        value = 0;
    };
    // gforces
    class ace_gforces_enabledFor {
        typeName = "SCALAR";
        value = 0;
    };
    // hearing
    class ace_hearing_enableCombatDeafness {
        value = 0;
        typeName = "BOOL";
    };
    class ace_hearing_earplugsVolume {
        value = 1;
        typeName = "SCALAR";
    };
    class ace_hearing_disableEarRinging {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
    };
    class ace_hearing_enabledForZeusUnits {
        value = 0;
        typeName = "BOOL";
    };
    class ace_hearing_autoAddEarplugsToUnits {
        value = 0;
        typeName = "BOOL";
    };
    // overheating
    class ace_overheating_enabled {
        typeName = "BOOL";
        value = 0;
    };
    // wind deflection
    class ace_winddeflection_enabled {
        typeName = "BOOL";
        value = 0;
    };
};
