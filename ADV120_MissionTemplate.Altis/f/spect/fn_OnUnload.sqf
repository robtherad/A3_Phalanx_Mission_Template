disableSerialization;
uisleep 0.5;

if (f_cam_forcedExit) ExitWith {};

// Reopen spectator
createDialog "f_spec_dialog";

// Reset unit list
f_cam_listUnits = [];
lbClear 2100;

// Reset camera vision modes
call f_fnc_ReloadModes;

// Fix button texts
ctrlSetText [2112,(f_cam_sideNames select f_cam_sideButton)];
if (f_cam_playersOnly) then { ctrlSetText [2111,"Players only"];} else { ctrlSetText [2111,"All units"];};
if (f_cam_toggleCamera) then { ctrlSetText [2114,"Third Person"];} else { ctrlSetText [2114,"First Person"];};

// Set up minimap
private _displayDialog = (findDisplay 9228);
private _mapWindow = _displayDialog displayCtrl 1350;
private _fullmapWindow = _displayDialog displayCtrl 1360;
_mapWindow ctrlShow false;
_fullmapWindow ctrlShow false;
_fullmapWindow mapCenterOnCamera false;
_mapWindow mapCenterOnCamera false;

// Hide help popup
private _helpWindow = _displayDialog displayCtrl 1310;
_helpWindow ctrlSetStructuredText parseText (f_cam_helptext);
ctrlShow [1315, !ctrlVisible 1315];
ctrlShow [1310, !ctrlVisible 1310];
ctrlShow [1300, !ctrlVisible 1300];
ctrlShow [1305, !ctrlVisible 1305];
