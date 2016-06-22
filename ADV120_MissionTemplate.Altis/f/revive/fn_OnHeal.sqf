// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// runs on the healer.

_ret = true; // Let the engine take care of the healing
_this spawn {
    params ["_unit", "_healer"];
    
    waitUntil {(["medic",animationstate _healer] call bis_fnc_inString)};
    waitUntil {!(["medic",animationstate _healer] call bis_fnc_inString)};
    
    // Stop bleeding when healing
    if (_unit getVariable ["phx_revive_bleeding",false]) then {
        [_unit, false, true] remoteExec ["phx_fnc_SetBleeding", 0];
    };
};
_ret
