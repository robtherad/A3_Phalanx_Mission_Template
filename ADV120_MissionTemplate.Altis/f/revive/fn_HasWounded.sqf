// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Pass a vehicle to this function and it will return wether or not the vehicle contains downed players
params ["_veh"];

_ret = false;
{
    if (_x getVariable ["phx_revive_down",false]) then {
        _ret = true;
    };
} forEach crew _veh;
_ret
