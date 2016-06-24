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

// Double check conditions
if (alive _downedUnit && {alive _healingUnit} && {"FirstAidKit" in items _healingUnit} && {_healingUnit distance _downedUnit < 3}) then {
    _healingUnit removeItem "FirstAidKit"; // Consume the FAK
    
    [_downedUnit, true, false] remoteExec ["phx_fnc_SetBleeding", 0];
    
    // Allow unit to speak again, but not use the radio
    _downedUnit setVariable ["tf_voiceVolume", 1.0, true];
};