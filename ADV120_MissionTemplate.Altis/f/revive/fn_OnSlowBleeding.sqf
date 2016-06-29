// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_downedUnit", "_healingUnit"];

if !(_healingUnit isEqualTo player) exitWith {};
if !("FirstAidKit" in (items _healingUnit)) exitWith {};

missionNamespace setVariable ["phx_revive_currentlyBusy",true];

// Play healing animation
if ((stance _healingUnit) isEqualTo "PRONE") then {
    _healingUnit playMove "AinvPpneMstpSlayWrflDnon_medicOther"; // Prone anim
} else {
    _healingUnit playMove "ainvpknlmstpslaywrfldnon_medicother"; // Crouch anim
};
waitUntil {(["medic",animationstate _healingUnit] call bis_fnc_inString)}; // Wait for healing animation to end
waitUntil {!(["medic",animationstate _healingUnit] call bis_fnc_inString)}; // Wait for healing animation to end

missionNamespace setVariable ["phx_revive_currentlyBusy",false];

// --------------------------------------------------
// Display messages on why the action failed
if !(_healingUnit distance _downedUnit < 3) exitWith {titleText ["Bandaging Failed - Distance too far. Get closer and try again.", "PLAIN DOWN"];};
if !("FirstAidKit" in (items player)) exitWith {titleText ["Bandaging Failed - Healer doesn't have a First Aid Kit anymore!", "PLAIN DOWN"];};
if !(isNull objectParent _healingUnit) exitWith {titleText ["Bandaging Failed - Healer got into a vehicle!", "PLAIN DOWN"];};
if !(isNull objectParent _downedUnit) exitWith {titleText ["Bandaging Failed - The patient got into a vehicle!", "PLAIN DOWN"];};
if (_healingUnit getVariable ["phx_revive_down",false] || !(alive _healingUnit)) exitWith {titleText ["Bandaging Failed - The healer went down while bandaging!", "PLAIN DOWN"];};
if !(_downedUnit getVariable ["phx_revive_down",false]) exitWith {titleText ["Bandaging Failed - The patient was no longer down!", "PLAIN DOWN"];};
if !(alive _downedUnit) exitWith {titleText ["Bandaging Failed - The patient is dead!", "PLAIN DOWN"];};
// --------------------------------------------------
// Consume the FAK
_healingUnit removeItem "FirstAidKit"; // Consume the FAK

// Slow the unit's bleeding
[_downedUnit, true, false] remoteExec ["phx_fnc_SetBleeding", 0];

// Allow unit to speak again, but not use the radio
_downedUnit setVariable ["tf_voiceVolume", 1.0, true];

titleText [format["You have slowed %1's bleeding.",name _downedUnit], "PLAIN DOWN"];
