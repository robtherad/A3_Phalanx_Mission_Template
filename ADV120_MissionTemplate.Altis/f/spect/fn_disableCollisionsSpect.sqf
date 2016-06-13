/*
    Gets passed the spectator unit by the spectator client. Remote executes the server function and then handles disabling collision on the spectator's end.
*/
params ["_newSpectator"];

diag_log format ["fn_disableCollisionSpect - params: %1",_this];
diag_log format ["fn_disableCollisionSpect - _newSpectator: %1",_newSpectator];

[_newSpectator] remoteExec ["f_fnc_disableCollisions", 0];

{
    _x disableCollisionWith _newSpectator;
} forEach allUnits;