// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_downedUnit", "_healingUnit"];

if !("FirstAidKit" in (items _healingUnit)) exitWith {};

missionNamespace setVariable ["phx_revive_currentlyBusy",true];

// Play healing animation
if ((stance _healingUnit) isEqualTo "PRONE") then {
    _healingUnit playMove "AinvPpneMstpSlayWrflDnon_medicOther"; // Prone anim
    diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","healingProne",_healingUnit];
} else {
    _healingUnit playMove "ainvpknlmstpslaywrfldnon_medicother"; // Crouch anim
    diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","healingCrouch",_healingUnit];
};
waitUntil {(["medic",animationstate _healingUnit] call bis_fnc_inString)}; // Wait for healing animation to end
waitUntil {!(["medic",animationstate _healingUnit] call bis_fnc_inString)}; // Wait for healing animation to end

missionNamespace setVariable ["phx_revive_currentlyBusy",false];

// --------------------------------------------------
// Display messages on why the action failed
if !(_healingUnit distance _downedUnit < 3) exitWith {titleText ["Revive Failed - Distance too far. Get closer and try again.", "PLAIN DOWN"];};
if !("Medikit" in (items player)) exitWith {titleText ["Revive Failed - Medic doesn't have a medkit anymore!", "PLAIN DOWN"];};
if !(isNull objectParent _healingUnit) exitWith {titleText ["Revive Failed - Medic got into a vehicle!", "PLAIN DOWN"];};
if !(isNull objectParent _downedUnit) exitWith {titleText ["Revive Failed - The patient got into a vehicle!", "PLAIN DOWN"];};
if (_healingUnit getVariable ["phx_revive_down",false] || !(alive _healingUnit)) exitWith {titleText ["Revive Failed - The medic went down while reviving!", "PLAIN DOWN"];};
if (_downedUnit getVariable ["phx_revive_down",false]) exitWith {titleText ["Revive Failed - The patient was no longer down!", "PLAIN DOWN"];};
if !(alive _downedUnit) exitWith {titleText ["Revive Failed - The patient is dead!", "PLAIN DOWN"];};
// --------------------------------------------------

// Consume the FAK
_healingUnit removeItem "FirstAidKit"; // Consume the FAK

// Slow the unit's bleeding
[_downedUnit, true, false] remoteExec ["phx_fnc_SetBleeding", 0];

// Allow unit to speak again, but not use the radio
_downedUnit setVariable ["tf_voiceVolume", 1.0, true];