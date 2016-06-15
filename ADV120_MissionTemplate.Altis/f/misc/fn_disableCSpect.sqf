/*
    Gets passed the spectator unit by the spectator client. Remote executes the server function and then handles disabling collision on the spectator's end.
*/
params ["_newSpectator"];

[_newSpectator] remoteExec ["phx_fnc_disableCollisions", 0];

{
    _x disableCollisionWith _newSpectator;
} forEach allUnits;