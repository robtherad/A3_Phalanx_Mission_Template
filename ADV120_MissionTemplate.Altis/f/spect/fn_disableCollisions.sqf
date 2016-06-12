/*
    Gets passed the new spectator unit and then disables collision between it and all local units.
*/
params ["_newSpectator"];

if (_newSpectator isEqualTo player) exitWith {};
diag_log format ["fn_disableCollisionSpect - params: %1",_this];
diag_log format ["fn_disableCollisionSpect - _newSpectator: %1",_newSpectator];
{
    if (local _x) then {
        _newSpectator disableCollisionWith _x;
    };
} forEach allUnits;