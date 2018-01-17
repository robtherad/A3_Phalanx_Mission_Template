/*
    Gets passed the new spectator unit and then disables collision between it and all local units.
*/
params ["_newSpectator"];

if (isServer) then {
    _newSpectator hideObjectGlobal true;
    _newSpectator enableSimulationGlobal false;
};

if (_newSpectator isEqualTo player) exitWith {};

{
    if (local _x) then {
        _newSpectator disableCollisionWith _x;
    };
} forEach allUnits;