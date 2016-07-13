// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Menu shown/hidden
/*
if (abs (f_cam_menuShownTime - CBA_missionTime) <= 0.1 && {!f_cam_menuShown}) then {// disable due to being a bit wonky
    [true] spawn f_fnc_showMenu;
};
if (abs (f_cam_menuShownTime - CBA_missionTime) >= 1 && {f_cam_menuShown}) then {// disable due to being a bit wonky
    [false] spawn f_fnc_showMenu;
};
*/

// ====================================================================================
// if freemode.
f_cam_camera camSetFov f_cam_fovZoom;
if (f_cam_mode isEqualTo 0) then {
    private _commitTime = ((1.0 - ((speed vehicle f_cam_curTarget)/65))/3) max 0.1;
    private _delta = (-(2*(0.3 max f_cam_zoom)));
    private _zLevel = sin(f_cam_angleY)*(2*(0.3 max f_cam_zoom));
    private _visPos = visiblePositionASL f_cam_curTarget;
    if (!(surfaceIsWater _visPos)) then {_visPos = ASLtoATL (_visPos)};
    f_cam_fakecamera camSetPos [_visPos select 0,_visPos select 1,(_visPos select 2) + 1.5];
    f_cam_fakecamera camCommit _commitTime;
    f_cam_camera camSetRelPos[(sin(f_cam_angleX)*_delta)*cos(f_cam_angleY), (cos(f_cam_angleX)*_delta)*cos(f_cam_angleY), _zLevel];
    f_cam_camera camCommit _commitTime;
};
// first person
if (f_cam_mode isEqualTo 1) then {
    if (!isNull objectParent cameraOn) then {
        private _mode = "internal";
        if (gunner (vehicle cameraon) isEqualTo cameraon) then {_mode = "gunner"};
        if (driver (vehicle cameraon) isEqualTo cameraon) then {_mode = "gunner"};
        if (commander (vehicle cameraon) isEqualTo cameraon) then {_mode = "gunner"};
        vehicle cameraOn switchCamera _mode;
    } else {
        if (!f_cam_ads) then {
            cameraon switchCamera "internal";
        };
    };
};

if (f_cam_mode isEqualTo 3) then {
    private _delta = (CBA_missionTime - f_cam_timestamp)*10;
    f_cam_freecamera camSetFov f_cam_fovZoom;
    private _currPos = getposASL f_cam_freecamera;
    private _mX = 0;
    private _mY = 0;
    private _mZ = 0;
    private _height = 0 max (((getPosATL f_cam_freecamera) select 2));
    private _accel = 0.2 max (_height/8); // 0.8
    private _accelshift = _accel*4.25;//2;
    if (f_cam_freecam_buttons select 0) then {// W
        if (f_cam_shift_down) then {
            _mY = _accelshift;
        } else {
            _mY = _accel;
        };
    };
    if (f_cam_freecam_buttons select 1) then {// S
        if (f_cam_shift_down) then {
            _mY = -_accelshift;
        } else {
            _mY = -_accel;
        };
    };
    if (f_cam_freecam_buttons select 2) then {// A
        if (f_cam_shift_down) then {
            _mX = -_accelshift;
        } else {
            _mX = -_accel;
        };
    };
    if (f_cam_freecam_buttons select 3) then {// D
        if (f_cam_shift_down) then {
            _mX = _accelshift;
        } else {
            _mX = _accel;
        };
    };
    if (f_cam_freecam_buttons select 4) then {// Q
        private _scroll = 1*((sqrt _height)/2)*_delta;
        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then { _scroll = -0.1;} else { _scroll = 0.1;};
        };
        _mZ = _scroll;
    };
    if (f_cam_freecam_buttons select 5) then {// Z
        private _scroll = -1*((sqrt _height)/2)*_delta;
        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then { _scroll = -0.1;} else { _scroll = 0.1;};
        };
        _mZ = _scroll;
    };
    if (f_cam_scrollHeight <0 || f_cam_scrollHeight > 0) then {
        private _scroll = -f_cam_scrollHeight * _delta*3;//was 3 and was positive
        f_cam_scrollHeight = _scroll;
        if (f_cam_scrollHeight < 0.2 && {f_cam_scrollHeight > -0.2}) then {
            f_cam_scrollHeight = 0;
        };
        _scroll = _scroll*((sqrt _height)/2);
        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then { _scroll = -0.1;} else { _scroll = 0.1;};
        };
        _mZ = _mZ + _scroll;
    };

    //Max speed 50 m/s
    _mX = _delta * ((_mX min 50) max -50);
    _mY = _delta * ((_mY min 50) max -50);
    f_freecam_x_speed = f_freecam_x_speed * 0.5 + _mX;
    f_freecam_y_speed = f_freecam_y_speed * 0.5 + _mY;
    f_freecam_z_speed = f_freecam_z_speed * 0.5 + _mZ;

    private _x = (_currPos select 0) + (f_freecam_x_speed * (cos f_cam_angleX)) + (f_freecam_y_speed * (sin f_cam_angleX));
    private _y = (_currPos select 1) - (f_freecam_x_speed * (sin f_cam_angleX)) + (f_freecam_y_speed * (cos f_cam_angleX));
    private _newHeight = (getTerrainHeightASL [_x,_y]);
    private _z = ((_currPos select 2) + f_freecam_z_speed) min (650 + _newHeight);
    f_cam_freecamera setPosASL [_x,_y,_z max _newHeight];
    f_cam_freecamera setDir f_cam_angleX;
    [f_cam_freecamera,f_cam_angleY,0] call BIS_fnc_setPitchBank;
    
    /*
    // Smooth transition from freecam to 3rd person
    f_cam_camera camSetPos [_x,_y,_z max _newHeight];
    f_cam_camera camCommit 0;
    f_cam_fakecamera camSetPos [_x,_y,_z max _newHeight];
    f_cam_fakecamera camCommit 0;
    */
    // Instant transition from freecam to 3rd person
    _delta = (-(2*(0.3 max f_cam_zoom)));
    private _zLevel = sin(f_cam_angleY)*(2*(0.3 max f_cam_zoom));
    private _visPos = visiblePositionASL f_cam_curTarget;
    if (!(surfaceIsWater _visPos)) then {_visPos = ASLtoATL (_visPos)};
    f_cam_fakecamera camSetPos [_visPos select 0,_visPos select 1,(_visPos select 2) + 1.5];
    f_cam_fakecamera camCommit 0;
    f_cam_camera camSetRelPos[(sin(f_cam_angleX)*_delta)*cos(f_cam_angleY), (cos(f_cam_angleX)*_delta)*cos(f_cam_angleY), _zLevel];
    f_cam_camera camCommit 0;
    
    f_cam_scrollHeight = 0;
    f_cam_timestamp = CBA_missionTime;
};
//MAKE SURE PLAYER IS HIDDEN + NOT SIMULATED
if (simulationEnabled player) then {
    player enableSimulationGlobal false;
};
if (!isObjectHidden player) then {
    player hideObjectGlobal true;
};
cameraEffectEnableHUD true;
showCinemaBorder false;
// =======================================================================================================================================
