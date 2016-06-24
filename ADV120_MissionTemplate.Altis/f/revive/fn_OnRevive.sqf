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
    diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","healingProne",_reviverUnit];
} else {
    _reviverUnit playMove "ainvpknlmstpslaywrfldnon_medicother"; // Crouch anim
    diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","healingCrouch",_reviverUnit];
};
waitUntil {(["medic",animationstate _reviverUnit] call bis_fnc_inString)}; // Wait for healing animation to end
waitUntil {!(["medic",animationstate _reviverUnit] call bis_fnc_inString)}; // Wait for healing animation to end

missionNamespace setVariable ["phx_revive_currentlyBusy",false];

// Make sure reviver and downed player are still alive and reviver is near downed player
if ((alive _reviverUnit) && {(_reviverUnit distance _downedUnit) < 3} && {alive _downedUnit} && {"Medikit" in (items player)}) then {
    // if unit is bleeding, stop bleeding
    if (_downedUnit getVariable ["phx_revive_bleeding",false]) then {
        [_downedUnit, false, true] remoteExec ["phx_fnc_SetBleeding", 0];
    };

    // if unit is down, revive him.
    if (_downedUnit getVariable ["phx_revive_down",false]) then {
        [_downedUnit, false] remoteExec ["phx_fnc_SetDowned", 0];
    };
};