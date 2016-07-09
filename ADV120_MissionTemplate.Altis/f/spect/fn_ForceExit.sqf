f_cam_forcedExit = true;
closeDialog 1;
removeMissionEventHandler ["Draw3D", f_cam_tagDrawEH];
["f_spect_cams","onEachFrame"] call bis_fnc_removeStackedEventHandler;
[f_cam_updateValues] call CBA_fnc_removePerFrameHandler;
(call f_cam_GetCurrentCam) cameraEffect ["terminate","back"];
phx_isSpectator = nil;
hintSilent "Spectator system has been forcefully closed";
{
    private _var = _x getVariable ["f_cam_fired_eventid",nil];
    if (!isNil "_var") then {
        _x removeEventHandler ["fired",_var];
    };
    nil
} count (allunits + vehicles);
