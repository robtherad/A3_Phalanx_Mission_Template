/* ----------------------------------------------------------------------------
Function: phx_fnc_serverJIP
Description:
    Sets a publicVariable with the current mission state. False for still in briefing, true for in game world.
---------------------------------------------------------------------------- */
if (!isServer) exitWith {};

phx_hasGameStarted = false;
publicVariable "phx_hasGameStarted";

addMissionEventHandler ["HandleDisconnect",{
    params ["_unit","_id","_uid","_name"];

    if (!isNil "f_var_mission_timer" && {f_var_mission_timer >= 0}) then {
        deleteVehicle _unit;
        diag_log format["fn_serverJIP: %1 disconnected during safestart. Deleting body.",_name];
    };
}];

addMissionEventHandler ["HandleConnect", {
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    
    if (_jip) then {
        private _str = format["%1 joined late during safestart.",_name];
        diag_log _str;
        _str remoteExec ["systemChat",0];
    };
}];

[{
    params ["_args","_handle"];
    
    private _safestartTime = ["f_param_mission_timer",10] call BIS_fnc_getParamValue;
    _safestartTime = _safestartTime * 60;
    if (!isNil "f_var_mission_timer" && {f_var_mission_timer <= 0}) then {
        phx_hasGameStarted = true;
        publicVariable "phx_hasGameStarted";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
