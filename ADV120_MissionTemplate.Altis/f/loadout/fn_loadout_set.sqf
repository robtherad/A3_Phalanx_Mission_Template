if (!hasInterface) exitWith {};

if (!(time > 0)) then {
_char = typeOf player;
//Get radio and map parameters from the slot screen. If the parameters don't exist then they default to giving everybody a map and radio.
phx_loadout_radio = ["phx_loadout_radio",0] call BIS_fnc_getParamValue;
phx_loadout_map = ["phx_loadout_map",0] call BIS_fnc_getParamValue;
phx_loadout_gps = ["phx_loadout_gps",1] call BIS_fnc_getParamValue;

// Ensure script is run only once.
if (!isNil "loadout_assigned") exitWith {};
loadout_assigned = false;

private _loadout = ["phx_loadout_modSet",1] call BIS_fnc_getParamValue;
_loadout = switch (_loadout) do {
    case 0: {"Vanilla"}; // Vanilla A3
    case 1: {"RHS"}; // RHS
    case 2: {"CUP"}; // CUP
    default {"Vanilla"};
};

// Remove Stuff
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// TODO: CBA 2.40 - Execute the adding of loadouts on next frame to prevent inventory desync

switch (_char) do {
 //Red - CSAT/EAST - OPF_F
 case "O_officer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_PL.sqf",_loadout]};
 case "O_Soldier_AR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AR.sqf",_loadout]};
 case "O_medic_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CLS.sqf",_loadout]};
 case "O_Soldier_A_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AAR.sqf",_loadout]};
 case "O_Soldier_SL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_SL.sqf",_loadout]};
 case "O_Soldier_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_R.sqf",_loadout]};
 case "O_Soldier_GL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_GR.sqf",_loadout]};
 case "O_Soldier_TL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_TL.sqf",_loadout]};
 case "O_engineer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_CE.sqf",_loadout]};
 case "O_HeavyGunner_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_MG.sqf",_loadout]};
 case "O_Soldier_lite_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AG.sqf",_loadout]};
 case "O_Soldier_LAT_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_RAT.sqf",_loadout]};
 case "o_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Red_AM.sqf",_loadout]};
 //Blue - NATO/WEST - BLU_F
 case "B_officer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_PL.sqf",_loadout]};
 case "B_soldier_AR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AR.sqf",_loadout]};
 case "B_medic_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CLS.sqf",_loadout]};
 case "B_soldier_AAR_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AAR.sqf",_loadout]};
 case "B_Soldier_SL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_SL.sqf",_loadout]};
 case "B_Soldier_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_R.sqf",_loadout]};
 case "B_Soldier_GL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_GR.sqf",_loadout]};
 case "B_Soldier_TL_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_TL.sqf",_loadout]};
 case "B_HeavyGunner_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_MG.sqf",_loadout]};
 case "B_Soldier_lite_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AG.sqf",_loadout]};
 case "B_engineer_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_CE.sqf",_loadout]};
 case "B_soldier_LAT_F": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_RAT.sqf",_loadout]};
 case "b_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers format["f\loadout\units\%1\Blue_AM.sqf",_loadout]};
};

// Generate loadout briefing page.
call phx_fnc_loadout_notes;

} else {
// PLAYER IS JIP, REMOVE GEAR JUST IN CASE
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player setVariable ["phx_loadoutAssigned",false];
};