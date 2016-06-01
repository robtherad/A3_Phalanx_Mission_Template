/* ----------------------------------------------------------------------------
Function: phx_fnc_serverJIP
Description:
    Sets a publicVariable with the current mission state. False for still in briefing, true for in game world.
---------------------------------------------------------------------------- */
if (!isServer) exitWith {};

phx_hasGameStarted = false;
publicVariable "phx_hasGameStarted";

[{
    params ["_args","_handle"];
    
    if (CBA_missionTime > 0) then {
        phx_hasGameStarted = true;
        publicVariable "phx_hasGameStarted";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
