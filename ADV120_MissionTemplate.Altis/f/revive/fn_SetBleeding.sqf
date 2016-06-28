// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params [
    "_unit", 
    "_value", 
    ["_bleedFast", true, [true]]
];

_unit setVariable ["phx_revive_bleeding",_value];
_unit setVariable ["phx_revive_bleedFast",_bleedFast];

// If bleeding was already slowed on a unit, remove the action
if !(_bleedFast) then {
    private _bleedIndex = _unit getVariable ["phx_revive_bleedIndex",-1];
    if (_bleedIndex > -1) then {
        _unit removeAction _bleedIndex;
    };
};

if (local _unit && {_unit isEqualTo player}) then {
    missionNamespace setVariable ["phx_revive_bleeding",_value];
    missionNamespace setVariable ["phx_revive_bleedFast",_bleedFast];
    if (!_value) then {[] spawn phx_fnc_WoundedEffect;};
};
