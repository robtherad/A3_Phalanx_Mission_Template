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

if (local _unit && {_unit isEqualTo player}) then {
    missionNamespace setVariable ["phx_revive_bleeding",_value];
    missionNamespace setVariable ["phx_revive_bleedFast",_bleedFast];
    if (!_value) then {[] spawn phx_fnc_WoundedEffect;};
};
