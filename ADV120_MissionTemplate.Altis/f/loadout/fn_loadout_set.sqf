if (!hasInterface) exitWith {};

if (!(time > 0)) then {
_char = typeOf player;
//Get radio and map parameters from the slot screen. If the parameters don't exist then they default to giving everybody a map and radio.
s_loadout_radio = ["s_loadout_radio",0] call BIS_fnc_getParamValue;
s_loadout_map = ["s_loadout_map",0] call BIS_fnc_getParamValue;
s_loadout_gps = ["s_loadout_gps",1] call BIS_fnc_getParamValue;

// Ensure script is run only once.
if (!isNil "loadout_assigned") exitWith {};
loadout_assigned = false;

switch (_char) do {
 //Red - CSAT/EAST - OPF_F
 case "O_officer_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_PL.sqf"};
 case "O_Soldier_AR_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_AR.sqf"};
 case "O_medic_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_CLS.sqf"};
 case "O_Soldier_A_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_AAR.sqf"};
 case "O_Soldier_SL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_SL.sqf"};
 case "O_Soldier_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_R.sqf"};
 case "O_Soldier_GL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_GR.sqf"};
 case "O_Soldier_TL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_TL.sqf"};
 case "O_engineer_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_CE.sqf"};
 case "O_HeavyGunner_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_MG.sqf"};
 case "O_Soldier_lite_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_AG.sqf"};
 case "O_Soldier_LAT_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_RAT.sqf"};
 case "o_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers "f\loadout\units\Red_AM.sqf"};
 //Blue - NATO/WEST - BLU_F
 case "B_officer_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_PL.sqf"};
 case "B_soldier_AR_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_AR.sqf"};
 case "B_medic_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_CLS.sqf"};
 case "B_soldier_AAR_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_AAR.sqf"};
 case "B_Soldier_SL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_SL.sqf"};
 case "B_Soldier_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_R.sqf"};
 case "B_Soldier_GL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_GR.sqf"};
 case "B_Soldier_TL_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_TL.sqf"};
 case "B_HeavyGunner_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_MG.sqf"};
 case "B_Soldier_lite_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_AG.sqf"};
 case "B_engineer_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_CE.sqf"};
 case "B_soldier_LAT_F": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_RAT.sqf"};
 case "b_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers "f\loadout\units\Blue_AM.sqf"};
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