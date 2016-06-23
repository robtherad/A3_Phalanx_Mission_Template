// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Triggered by an addAction on a vehicle with downed players. Ejects all downed players from that vehicle.
if (!hasInterface) exitWith {};

params ["_veh", "_caller", "_actionID"];

{
    if (_x getVariable ["phx_revive_down",false]) then {
        moveOut _x;
        waitUntil {isNull objectParent _x};
        _x switchmove "acts_InjuredLookingRifle02";
    };
} forEach crew _veh;
_veh removeAction _actionID;
