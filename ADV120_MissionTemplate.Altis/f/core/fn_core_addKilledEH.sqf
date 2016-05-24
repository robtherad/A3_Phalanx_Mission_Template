if (!isServer) exitWith {};

{
    _x addMPEventHandler ["MPKilled",{_this call phx_fnc_core_mpKilled;}];
} forEach playableUnits;
