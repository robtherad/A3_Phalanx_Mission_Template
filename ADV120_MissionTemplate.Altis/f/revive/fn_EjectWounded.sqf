// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Remotely executed onto all machines
if (!hasInterface) exitWith {};

params ["_veh", "_caller"];

{
    if (_x getVariable ["phx_revive_down",false]) then {
        if (local _x) then {
            moveOut _x;
        };
        waitUntil {isNull objectParent _x}; // Wait until they aren't in the vehicle anymore
        _x switchMove "acts_InjuredLookingRifle02";
    };
} forEach crew _veh;

// Remove eject action
private _actionID = _veh getVariable ["phx_revive_ejectIndex",-1];
if (_actionID > -1) then {
    _veh removeAction _actionID;
    _veh setVariable ["phx_revive_ejectIndex",-1];
};
