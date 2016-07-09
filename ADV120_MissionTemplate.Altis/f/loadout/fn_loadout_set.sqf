if (!hasInterface) exitWith {};

// Ensure script is run only once.
if (!isNil "phx_loadout_assigned") exitWith {};
phx_loadout_assigned = false;

private _char = toLower (typeOf player);

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

//====================================================================================================
// Get the default gear settings for each side
switch (side group player) do {
    case west: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_Default.sqf",_loadout]
    };
    case east: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_Default.sqf",_loadout]
    };
    case independent: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Green_Default.sqf",_loadout]
    };
    default {};
};


// Add stuff
[{
params ["_args", "_handle"];
_args params ["_addGearTime","_frameAdded","_char", "_loadout"];

if (diag_tickTime > _addGearTime && {diag_frameNo-10 > _frameAdded}) then {

removeAllWeapons player;
removeGoggles player;

[_handle] call CBA_fnc_removePerFrameHandler;

switch (_char) do {
    //----------------------------------------
    // REDFOR - CSAT/EAST - OPF_F
    case toLower "O_officer_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_PL.sqf",_loadout]
    };
    case toLower "O_Soldier_AR_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AR.sqf",_loadout]
    };
    case toLower "O_medic_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CLS.sqf",_loadout]
    };
    case toLower "O_Soldier_A_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AAR.sqf",_loadout]
    };
    case toLower "O_Soldier_SL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_SL.sqf",_loadout]
    };
    case toLower "O_Soldier_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_R.sqf",_loadout]
    };
    case toLower "O_Soldier_GL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_GR.sqf",_loadout]
    };
    case toLower "O_Soldier_TL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_TL.sqf",_loadout]
    };
    case toLower "O_soldier_exp_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CE.sqf",_loadout]
    };
    case toLower "O_HeavyGunner_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_MG.sqf",_loadout]
    };
    case toLower "O_Soldier_lite_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AG.sqf",_loadout]
    };
    case toLower "O_Soldier_LAT_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_RAT.sqf",_loadout]
    };
    case toLower "O_Soldier_unarmed_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AM.sqf",_loadout]
    };
    case toLower "O_soldier_PG_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_MGTL.sqf",_loadout]
    };
    case toLower "O_pilot_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_P.sqf",_loadout]
    };

    //----------------------------------------
    // BLUFOR - NATO/WEST - BLU_F
    case toLower "B_officer_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_PL.sqf",_loadout]
    };
    case toLower "B_soldier_AR_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AR.sqf",_loadout]
    };
    case toLower "B_medic_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CLS.sqf",_loadout];
    };
    case toLower "B_soldier_AAR_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AAR.sqf",_loadout]
    };
    case toLower "B_Soldier_SL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_SL.sqf",_loadout]
    };
    case toLower "B_Soldier_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_R.sqf",_loadout]
    };
    case toLower "B_Soldier_GL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_GR.sqf",_loadout]
    };
    case toLower "B_Soldier_TL_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_TL.sqf",_loadout]
    };
    case toLower "B_HeavyGunner_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_MG.sqf",_loadout]
    };
    case toLower "B_Soldier_lite_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AG.sqf",_loadout]
    };
    case toLower "B_soldier_exp_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CE.sqf",_loadout]
    };
    case toLower "B_soldier_LAT_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_RAT.sqf",_loadout]
    };
    case toLower "B_Soldier_unarmed_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AM.sqf",_loadout]
    };
    case toLower "B_soldier_PG_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_MGTL.sqf",_loadout]
    };
    case toLower "B_pilot_F": {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_P.sqf",_loadout]
    };
    //----------------------------------------
    // Spectator Slots
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

    //----------------------------------------
    // Error message - Classname not found in list
    default {diag_log format["PHX fn_loadout_set: Unable to find player classname in list: %1",_char];};
};

// Generate loadout briefing page.
call phx_fnc_loadout_notes;
};
}, 0, [(diag_tickTime+2.5),diag_frameno,_char,_loadout]] call CBA_fnc_addPerFrameHandler;
