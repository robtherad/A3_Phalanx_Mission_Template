// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// runs on the healer.
params ["_unit", "_healer"];
_ret = true;
[_unit,_healer] spawn {
    params ["_unit", "_healer"];
    waitUntil {(["medic",animationstate _healer] call bis_fnc_inString)};
    waitUntil {!(["medic",animationstate _healer] call bis_fnc_inString)};
    // if unit is bleeding, stop bleeding
    if (_unit getVariable ["phx_revive_bleeding",false]) then {
        // [[_unit,false], "phx_fnc_SetBleeding", true] spawn BIS_fnc_MP;
        [_unit, false] remoteExec ["phx_fnc_SetBleeding", 0];
    };

    // if unit is down , revive him.
    if (_unit getVariable ["phx_revive_down",false] ) then {
        // [[_unit,false], "phx_fnc_SetDowned", true] spawn BIS_fnc_MP;
        [_unit, false] remoteExec ["phx_fnc_SetDowned", 0];
    };
};
_ret
