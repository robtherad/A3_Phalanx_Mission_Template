//====================================================================================================
// Server Scripts
if !(isServer) exitWith {};

// Initialize Variables - End conditions
phx_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
phx_missionRunTime = ["phx_missionTimelimit",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
phx_missionRuntimeMins = phx_missionRunTime + phx_missionSafeTime;
phx_alertOver = 1; // Time elapsed warning
phx_alertEnd = 0; // Time elapsed warning
phx_alertSoon = 0; // 15 minute warning

// Start check ending conditions
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

//====================================================================================================
phx_serverInitFinished = true;

// Call mixed scripts, but only if server is not a player
if !(hasInterface) then {
    call phX_fnc_init_shared;
};
