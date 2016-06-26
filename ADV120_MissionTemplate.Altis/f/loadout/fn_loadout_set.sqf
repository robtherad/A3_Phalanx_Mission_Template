if (!hasInterface) exitWith {};

// Ensure script is run only once.
if (!isNil "phx_loadout_assigned") exitWith {};
phx_loadout_assigned = false;

private _char = typeOf player;
_char = toLower _char;

//Get radio and map parameters from the slot screen. If the parameters don't exist then they default to giving everybody a map and radio.
phx_loadout_radio = ["phx_loadout_radio",0] call BIS_fnc_getParamValue;
phx_loadout_map = ["phx_loadout_map",0] call BIS_fnc_getParamValue;
phx_loadout_gps = ["phx_loadout_gps",0] call BIS_fnc_getParamValue;
phx_loadout_watch = ["phx_loadout_watch",0] call BIS_fnc_getParamValue;
phx_loadout_compass = ["phx_loadout_compass",0] call BIS_fnc_getParamValue;

/*
    Acceptable Values for unit level:
    0 - Regular unit
    1 - Team Leader
    2 - Squad Leader or Higher
    
    Set the default unit level          */
phx_loadout_unitLevel = 0;

private _loadout = ["phx_loadout_modSet",1] call BIS_fnc_getParamValue;
_loadout = switch (_loadout) do {
    case 0: {"Vanilla"}; // Vanilla A3
    case 1: {"RHS"}; // RHS
    default {"Vanilla"};
};

// Remove Stuff
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

[{
    params ["_char", "_loadout"];
    
    switch (_char) do {
     //Red - CSAT/EAST - OPF_F
     case toLower "O_officer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_PL.sqf",_loadout]};
     case toLower "O_Soldier_AR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AR.sqf",_loadout]};
     case toLower "O_medic_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CLS.sqf",_loadout]};
     case toLower "O_Soldier_A_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AAR.sqf",_loadout]};
     case toLower "O_Soldier_SL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_SL.sqf",_loadout]};
     case toLower "O_Soldier_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_R.sqf",_loadout]};
     case toLower "O_Soldier_GL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_GR.sqf",_loadout]};
     case toLower "O_Soldier_TL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_TL.sqf",_loadout]};
     case toLower "O_engineer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CE.sqf",_loadout]};
     case toLower "O_HeavyGunner_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_MG.sqf",_loadout]};
     case toLower "O_Soldier_lite_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AG.sqf",_loadout]};
     case toLower "O_Soldier_LAT_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_RAT.sqf",_loadout]};
     case toLower "O_Soldier_unarmed_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AM.sqf",_loadout]};
     case toLower "O_soldier_PG_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_MGTL.sqf",_loadout]};
     //Blue - NATO/WEST - BLU_F
     case toLower "B_officer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_PL.sqf",_loadout]};
     case toLower "B_soldier_AR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AR.sqf",_loadout]};
     case toLower "B_medic_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CLS.sqf",_loadout]};
     case toLower "B_soldier_AAR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AAR.sqf",_loadout]};
     case toLower "B_Soldier_SL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_SL.sqf",_loadout]};
     case toLower "B_Soldier_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_R.sqf",_loadout]};
     case toLower "B_Soldier_GL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_GR.sqf",_loadout]};
     case toLower "B_Soldier_TL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_TL.sqf",_loadout]};
     case toLower "B_HeavyGunner_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_MG.sqf",_loadout]};
     case toLower "B_Soldier_lite_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AG.sqf",_loadout]};
     case toLower "B_engineer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CE.sqf",_loadout]};
     case toLower "B_soldier_LAT_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_RAT.sqf",_loadout]};
     case toLower "B_Soldier_unarmed_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AM.sqf",_loadout]};
     case toLower "B_soldier_PG_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_MGTL.sqf",_loadout]};
     // Virtual Spectator Slots
     case toLower "VirtualMan_F": {
        player forceAddUniform "U_I_Protagonist_VR";
        player linkItem "ItemMap";
        missionNamespace setVariable ["phx_loadoutAssigned",true];
        
        // Waits until mission starts and then forces player into F3 spectator instead of EG spectator
        [{(CBA_missionTime > 0) && {(!isNull player)} && {(cameraOn isEqualTo player)}}, {
            [{
                [player, objNull, 0, 0, true] call f_fnc_camInit;
            }] call CBA_fnc_execNextFrame;
        }] call CBA_fnc_waitUntilAndExecute;
     };
     default {diag_log format["PHX fn_loadout_set: Unable to find player classname in list: %1",_char];};
    };

    // Generate loadout briefing page.
    call phx_fnc_loadout_notes;
}, [_char, _loadout]] call CBA_fnc_execNextFrame;