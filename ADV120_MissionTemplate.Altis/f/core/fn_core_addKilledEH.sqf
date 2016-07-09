if (!isServer) exitWith {};

{
    _x addEventHandler ["Killed",{_this call phx_fnc_core_mpKilled;}];
} forEach playableUnits;
