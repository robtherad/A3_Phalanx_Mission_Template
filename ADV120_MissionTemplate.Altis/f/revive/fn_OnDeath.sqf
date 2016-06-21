// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// this just makes sure that the wounded people die and ragdoll after a while.
params ["_unit"];
if (_unit getVariable ["phx_revive_down",false]) then {
    // [[_unit,false], "phx_fnc_SetDowned", true] spawn BIS_fnc_MP;
    [_unit, false] remoteExec ["phx_fnc_SetDowned", 0];
};
