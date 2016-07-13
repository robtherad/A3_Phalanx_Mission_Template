// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================

// handles all the events. be afraid.
params ["_type", "_args"];

private _handled = true;
switch (_type) do {
// ==================================================================
// handles the mouse.
case "MouseButtonDown": {
    private _button = _args param [1];
    if (_button isEqualTo 1 && {f_cam_mode != 1}) then {
        f_cam_MouseButton set [_button,true];
    };
    if (_button isEqualTo 1) then {
        if (f_cam_mode isEqualTo 1) then {
            f_cam_ads = true;
            f_cam_curTarget switchCamera "gunner";
        };
    };
};
case "MouseButtonUp": {
    private _button = _args param [1];
    if (_button isEqualTo 1 && {f_cam_mode != 1}) then {
        f_cam_MouseButton set [_button,false];
        [] spawn f_fnc_HandleCamera;
    };
    if (_button isEqualTo 1) then {
        if (f_cam_mode isEqualTo 1) then {
            f_cam_ads = false;
            f_cam_curTarget switchCamera "internal";
        };
    };
};
case "MapZoom": {
    private _change = _args param [1];
    f_cam_map_zoom = f_cam_map_zoom+(_change*0.05);
    if (f_cam_map_zoom > 0.5) then {
        f_cam_map_zoom = 0.5;
    };
    if (f_cam_map_zoom < 0.05) then {
        f_cam_map_zoom = 0.05;
    };
    _handled = true;
};
case "MouseMoving": {
    private _x = _args param [1];
    private _y = _args param [2];
    f_cam_mouseCord = [_x,_y];
    [] spawn f_fnc_HandleCamera;

};
case "MouseZChanged": {
    private _change = _args param [1];
    if (!f_cam_ctrl_down) then {
        switch (f_cam_mode) do {
            case 0: {
                f_cam_zoom = ((f_cam_zoom - (_change*f_cam_zoom/5)) max 0.1) min 650;
            };
            case 3: {
                f_cam_scrollHeight = _change;
            };
        };
    } else {
        f_cam_fovZoom = ((f_cam_fovZoom - (_change*f_cam_fovZoom/5)) max 0.1) min 1;
    };
};

// ==================================================================
// handles dropboxes
case "LBListSelChanged": {
    private _lbSelection = _args param [1];
    if (count f_cam_listUnits > _lbSelection) then {
        private _unit = f_cam_listUnits param [_lbSelection];
        if (!isNil "_unit") then {
            if (typeName _unit isEqualTo "GROUP") then {_unit = leader _unit};
            f_cam_curTarget = _unit;
            if (f_cam_toggleCamera) then {
                f_cam_curTarget switchCamera "INTERNAL";
            };
            ctrlSetText [1000,format ["Spectating: %1", name f_cam_curTarget]];
            if (f_cam_mode isEqualTo 3) then {
                private _pos = getPos _unit;
                private _x = _pos param [0];
                private _y = _pos param [1];
                f_cam_freecamera setPosASL [_x,_y,((getposASL f_cam_freecamera) param [2] ) max ((getTerrainHeightASL [_x,_y])+1)];
            };
        };
    };
    ctrlEnable [2100, false];
    ctrlEnable [2100, true];
};
case "LBListSelChanged_modes": {
    private _index = _args param [1];
    switch (_index) do {
        case f_cam_lb_toggletiWHIndex: {
            f_cam_tiWHOn = !f_cam_tiWHOn;
            if (f_cam_tiWHOn) then {
                f_cam_tiBHOn = false;
                f_cam_nvOn = false;
                true setCamUseTi 0;
            } else {
                camUseNVG false;
                false setCamUseTi 0;
            };
            call F_fnc_ReloadModes;
        };
        case f_cam_lb_toggletiBHIndex: { // BlackHot
            f_cam_tiBHOn = !f_cam_tiBHOn;
            if (f_cam_tiBHOn) then {
                camUseNVG false;
                f_cam_tiWHOn = false;
                f_cam_nvOn = false;
                true setCamUseTi 1;
            } else {
                camUseNVG false;
                false setCamUseTi 0;
            };
            call F_fnc_ReloadModes;

        };
        case f_cam_lb_toggleNormal: {
                false setCamUseTi 0;
                camUseNVG false;
                f_cam_tiWHOn = false;
                f_cam_tiBHOn = false;
                f_cam_nvOn = false;
            call F_fnc_ReloadModes;
        };
        case f_cam_lb_toggletiNVIndex: { // Nightvision
            f_cam_nvOn = !f_cam_nvOn;
            if (f_cam_nvOn) then {
                false setCamUseTi 0;
                camUseNVG true;
                f_cam_tiWHOn = false;
                f_cam_tiBHOn = false;
            } else {
                camUseNVG false;
                false setCamUseTi 0;
            };
            call F_fnc_ReloadModes;
        };
    };
};
// ==================================================================
// handles keys
case "KeyDown": {
    private _key = _args param [1];
    _handled = false;
    if (!isNull (findDisplay 49)) exitWith {if (_key isEqualTo 1) then {true}};
    switch (_key) do {
        case 78: { // numpad +
            f_cam_zoom = f_cam_zoom - 1;
            _handled = true;
        };
        case 1: {
            _handled = false;
        };
        case f_cam_zeusKey: {
            if (serverCommandAvailable "#kick" || !isNull (getAssignedCuratorLogic player) ) then {
                // handler to check when we can return to the spectator system ( when zeus interface is closed and not remoteing controlling)
                [] spawn {
                    private _done = false;
                    waitUntil {sleep 0.1;!isNull (findDisplay 312)}; // wait until open
                    while {!_done} do {
                        waitUntil {sleep 0.1;isNull (findDisplay 312)}; // then wait until its not open
                        if (isnil "bis_fnc_moduleRemoteControl_unit") then { // check if someone is being remote controled
                            [player,player,player,0,true] spawn F_fnc_CamInit; // if not retoggle
                            _done = true;
                        }; // restart spectator once exit.
                    };
                };
                // force exit
                [] call F_fnc_ForceExit;


                // black out the screen
                ["F_ScreenSetup",false] call BIS_fnc_blackOut;
                if (isNull (getAssignedCuratorLogic player)) then {
                    [[player,true,playableUnits],'f_fnc_zeusInit',false] spawn BIS_fnc_MP;
                };
                [] spawn {
                    waitUntil {!isNull (getAssignedCuratorLogic player)};
                    ["F_ScreenSetup"] call BIS_fnc_blackIn;
                    openCuratorInterface;
                };
                _handled = true;
            } else {
                _handled = true;
            };
        };
        case 74: { // numpad -
            f_cam_zoom = f_cam_zoom + 1;
            f_cam_zoom = 0.3 max f_cam_zoom;
            _handled = true;
        };
        case 20: { // T
            f_cam_tracerOn = !f_cam_tracerOn;
            if (f_cam_tracerOn) then {
                systemChat "Tracers on map activated.";
            } else {
                systemChat "Tracers on map deactivated.";
            };
            _handled = true;
        };
        case 22: { // U
            f_cam_hideUI = !f_cam_hideUI;
            [] spawn f_fnc_ToggleGUI;
            _handled = true;
        };
        // Freecam movement keys
        case 17: { // W
            f_cam_freecam_buttons set [0,true];
            _handled = true;
        };
        case 31: { // S
            f_cam_freecam_buttons set [1,true];
            _handled = true;
        };
        case 30: { // A
            f_cam_freecam_buttons set [2,true];
            _handled = true;
        };
        case 32: { // D
            f_cam_freecam_buttons set [3,true];
            _handled = true;
        };
        case 49: { // N
            _index = (lbCurSel 2101)+1;
            if (_index >= (lbSize 2101 )) then { _index = 0};
            lbSetCurSel [2101,_index];
            _handled = true;
        };
        case 16: { // Q
            f_cam_freecam_buttons set [4,true];
            _handled = true;
        };
        case 44: { // Z
            f_cam_freecam_buttons set [5,true];
            _handled = true;
        };
        case 57: { // SPACE
            f_cam_freecamOn = !f_cam_freecamOn;
            if (f_cam_freecamOn) then {
                f_cam_angleY = 10;
                [f_cam_freecamera,f_cam_angleY,0] call BIS_fnc_setPitchBank;
                f_cam_freecamera cameraEffect ["internal", "BACK"];
                f_cam_mode = 3;
                f_cam_freecamera setPosASL getPosASL f_cam_camera;
                cameraEffectEnableHUD true;
                showCinemaBorder false;
            } else {
                f_cam_freecamera cameraEffect ["Terminate","BACK"];
                f_cam_angleY = 45;
                f_cam_camera cameraEffect ["internal", "BACK"];
                f_cam_mode = 0;
                cameraEffectEnableHUD true;
                showCinemaBorder false;
            };
            _handled = true;
        };
        case 35: { //  H
            ["Extra Keys\n\nPress 'F1' to see this hint again.\nPress 'U' to hide the spectator UI.\nPress 'V' to hide the remaining time UI.\nPress 'Right Arrow' to make player tags bigger.\nPress 'Left Arrow' to make player tags smaller.\n\nTo see who killed you, press your chat key (default '/') then press 'Page-Up' until you see the information in the chat area.\nPress 'P' to mute spectator voice chat and listen to players. If you focus on a player you will pick up their radio settings.\n\nPress 'F2' to hide this message and others like it.",20] call phx_fnc__hintThenClear;
            ctrlShow [1315, !ctrlVisible 1315];
            ctrlShow [1310, !ctrlVisible 1310];
            ctrlShow [1300, !ctrlVisible 1300];
            ctrlShow [1305, !ctrlVisible 1305];
            _handled = true;
        };
        case 42: { // SHIFT
            f_cam_shift_down = true;
            [] spawn f_fnc_HandleCamera;
            _handled = true;
        };
        case 56: { // ALT
            _handled = true;
        };
        case 25: { // P
            if (isNil "f_cam_nextVoiceChange" || {diag_tickTime > f_cam_nextVoiceChange}) then {
                f_cam_nextVoiceChange = diag_tickTime + 2;
                
                f_cam_muteSpectators = !f_cam_muteSpectators;
                [player, f_cam_muteSpectators] call TFAR_fnc_forceSpectator;
       
                if !(f_cam_muteSpectators) then {
                    systemChat "You are now listening to LIVE PLAYER VOICE CHAT.";
                    
                    player setVariable ["tf_unable_to_use_radio", true, true];
                    player setVariable ["tf_voiceVolume", 0.0, true];
                    
                    // Add PFH that updates player position since TFAR works off that.
                    [{
                        params ["_args", "_handle"];
                        
                        if !(f_cam_muteSpectators) then {
                            if (f_cam_mode isEqualTo 3) then {
                                player setPos (getPos f_cam_freecamera); // Freecam
                            } else {
                                player setPos (getPos f_cam_camera); // Chase cam
                            };
                        } else {
                            player setPos f_cam_originalPosition;
                            [_handle] call CBA_fnc_removePerFrameHandler;
                        };
                    }, 0, []] call CBA_fnc_addPerFrameHandler;
                } else {
                    systemChat "You are now listening to SPECTATOR VOICE CHAT.";
                    player setVariable ["tf_unable_to_use_radio", false, true];
                    player setVariable ["tf_voiceVolume", 1.0, true];
                };
            } else {
                systemChat format["Please wait %1 second(s) to change voice modes again.",(diag_tickTime-f_cam_nextVoiceChange)];
            };
        };
        case 29: { // CTRL
            f_cam_ctrl_down = true;
            [] spawn f_fnc_HandleCamera;
            _handled = true;
        };
        case 50: { // M
            f_cam_mapMode = f_cam_mapMode +1;
            if (f_cam_mapMode > 2) then {
                f_cam_mapMode = 0;
            };
            switch (f_cam_mapMode) do
            {
                // no maps
                case 0: {
                    ctrlShow [2110,true];
                    ctrlShow [2010,true];
                    ctrlShow [1350,false];
                    ctrlShow [1360,false];
                };
                case 1: {
                    ctrlShow [2110,true];
                    ctrlShow [2010,true];
                    ctrlShow [1350,true];
                    ctrlShow [1360,false];
                };
                // big map
                case 2: {
                    ctrlShow [2110,false];
                    ctrlShow [2010,false];
                    ctrlShow [1350,false];
                    ctrlShow [1360,true];
                    _displayDialog = (findDisplay 9228);
                    _fullmapWindow = _displayDialog displayCtrl 1360;
                    ctrlMapAnimClear _fullmapWindow;

                    _fullmapWindow ctrlMapAnimAdd [0.001, 0.1,getpos ([] call f_cam_GetCurrentCam)];
                    ctrlMapAnimCommit _fullmapWindow;
                };
            };
            _handled = true;
        };
        case 205: { //RIGHT ARROW KEY
            if (f_cam_tagTextSize < .05) then {
                f_cam_tagTextSize = f_cam_tagTextSize + .0005;
            } else {
                f_cam_tagTextSize = .05;
            };
        };
        case 203: { //LEFT ARROW KEY
            if (f_cam_tagTextSize >= 0.0005) then {
                f_cam_tagTextSize = f_cam_tagTextSize - .0005;
            } else {
                f_cam_tagTextSize = 0;
            };
        };
        case 59: { // F1
            ["Extra Keys\n\nPress 'F1' to see this hint again.\nPress 'U' to hide the spectator UI.\nPress 'V' to hide the remaining time UI.\nPress 'Right Arrow' to make player tags bigger.\nPress 'Left Arrow' to make player tags smaller.\n\nTo see who killed you, press your chat key (default '/') then press 'Page-Up' until you see the information in the chat area.\nPress 'P' to mute spectator voice chat and listen to players. If you focus on a player you will pick up their radio settings.\n\nPress 'F2' to hide this message and others like it.",20] call phx_fnc__hintThenClear;
        };
        case 60: { // F2
            hint "";
        };
        case 47: { // V
            phx_show_timeUI = !phx_show_timeUI;
        };
    };
    _handled
};

case "KeyUp": {
    if (!isNull (findDisplay 49)) exitWith {};
    private _key = _args param [1];
    _handled = false;
    switch (_key) do {
        case 42: {
            f_cam_shift_down = false;
            _handled = true;
        };
        case 56: {
            _handled = true;
        };
        case 1: {
            _handled = false;
        };
        case 29: {
            f_cam_ctrl_down = false;
            _handled = true;
        };
        case 203: {
            _handled = true;
        };
        case 205: {
            _handled = true;
        };
        case 24: {
            _handled = true;
        };
        case 28: {
            _handled = true;
        };
        case 49: {
            _handled = true;
        };
        case 200: {
            _handled = true;
        };
        case 208: {
            _handled = true;
        };
        case 74: {
            _handled = true;
        };
        case 78: {
            _handled = true;
        };
        case 57: {
            _handled = true;
        };
        case 17: {
            f_cam_freecam_buttons set [0,false];
            _handled = true;
        };
        case 31: {
            f_cam_freecam_buttons set [1,false];
            _handled = true;
        };
        case 30: {
            f_cam_freecam_buttons set [2,false];
            _handled = true;
        };
        case 32: {
            f_cam_freecam_buttons set [3,false];
            _handled = true;
        };
        case 16: {
            f_cam_freecam_buttons set [4,false];
            _handled = true;
        };
        case 44: {
            f_cam_freecam_buttons set [5,false];
            _handled = true;
        };
    };
    _handled
};
_handled
};
