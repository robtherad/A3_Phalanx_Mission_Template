// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_downedUnit", "_reviverUnit"];

if !(_reviverUnit isEqualTo player) exitWith {};
if !("Medikit" in (items player)) exitWith {}; // Medkit is required to revive, double check that the reviver still has one

missionNamespace setVariable ["phx_revive_currentlyBusy",true];

// Play healing animation
if ((stance _reviverUnit) isEqualTo "PRONE") then {
    _reviverUnit playMove "AinvPpneMstpSlayWrflDnon_medicOther"; // Prone anim
} else {
    _reviverUnit playMove "ainvpknlmstpslaywrfldnon_medicother"; // Crouch anim
};
waitUntil {(["medic",animationstate _reviverUnit] call bis_fnc_inString)}; // Wait for healing animation to end
waitUntil {!(["medic",animationstate _reviverUnit] call bis_fnc_inString)}; // Wait for healing animation to end

missionNamespace setVariable ["phx_revive_currentlyBusy",false];

// --------------------------------------------------
// Display messages on why the action failed
if !(_reviverUnit distance _downedUnit < 3) exitWith {titleText ["Revive Failed - Distance too far. Get closer and try again.", "PLAIN DOWN"];};
if !("Medikit" in (items player)) exitWith {titleText ["Revive Failed - Medic doesn't have a medkit anymore!", "PLAIN DOWN"];};
if !(isNull objectParent _reviverUnit) exitWith {titleText ["Revive Failed - Medic got into a vehicle!", "PLAIN DOWN"];};
if !(isNull objectParent _downedUnit) exitWith {titleText ["Revive Failed - The patient got into a vehicle!", "PLAIN DOWN"];};
if (_reviverUnit getVariable ["phx_revive_down",false] || !(alive _reviverUnit)) exitWith {titleText ["Revive Failed - The medic went down while reviving!", "PLAIN DOWN"];};
if !(_downedUnit getVariable ["phx_revive_down",false]) exitWith {titleText ["Revive Failed - The patient was no longer down!", "PLAIN DOWN"];};
if !(alive _downedUnit) exitWith {titleText ["Revive Failed - The patient is dead!", "PLAIN DOWN"];};
// --------------------------------------------------
// Stop bleeding
if (_downedUnit getVariable ["phx_revive_bleeding",false]) then {
    [_downedUnit, false, true] remoteExec ["phx_fnc_SetBleeding", 0];
};

// Revive unit
if (_downedUnit getVariable ["phx_revive_down",false]) then {
    [_downedUnit, false] remoteExec ["phx_fnc_SetDowned", 0];
};

titleText [format["You have revived %1.",name _downedUnit], "PLAIN DOWN"];
