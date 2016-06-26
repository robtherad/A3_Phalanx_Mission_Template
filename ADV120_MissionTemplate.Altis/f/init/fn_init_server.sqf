//====================================================================================================
// Server Scripts
if !(isServer) exitWith {};
diag_log format["serverInit: canSuspend:%1",canSuspend];
// Check ending conditions
phx_end_checkTime = [phx_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
phx_end_checkAlive = [phx_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;

// Generate frequencies for preset radios
call phx_fnc_radio_genFreqs;

// Create respawn markers in bottom left corner of map
{
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
} forEach ["respawn", "respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];

// Add EH for kill display
call phx_fnc_core_addKilledEH;

//====================================================================================================
phx_serverInitFinished = true;

// Call mixed scripts, but only if server is not a player
if !(hasInterface) then {
    call phX_fnc_init_shared;
};
