// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_unit", "_value"];

_unit setVariable ["phx_revive_bleeding",_value];
if (!_value) then {[] spawn phx_fnc_WoundedEffect;};
