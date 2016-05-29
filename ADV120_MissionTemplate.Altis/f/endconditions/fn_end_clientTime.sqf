if (!hasInterface) exitWith {};
disableSerialization;
if (phx_show_timeUI) then {
    _missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
    _missionRunTimeMins = ["phx_missionTimelimit",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
    _missionTime = _missionRuntimeMins + _missionSafeTime;
    //Create displays in bottom left
    ("timeRsc" call BIS_fnc_rscLayer) cutRsc ["timeleftStructText", "PLAIN"];
    //If displays weren't created then exit the script
    if (uiNameSpace getVariable "timeleftStructText" == displayNull) exitWith {hint "TIMELEFT display not defined in description.ext"};

    //Update text in the displays to match the points markers
    _display = uiNameSpace getVariable "timeleftStructText";
    _setText = _display displayCtrl 1003;
    if (time <= (_missionTime*60)) then {
        _mins = (_missionTime - floor(time/60)) -1;
        _secs = 60-floor(time%60);
        if ((_secs < 10) || (_secs == 60)) then {
            if (_secs == 60) then {
                if (_secs == 60) then {
                    _secs = "00";
                    _mins = (_missionTime - floor(time/60));
                };
            } else {
                _secs = "0" + str(60-floor(time%60));
            };
        };
        _setText ctrlSetStructuredText (parseText format ["Approximate Time Remaining: %1:%2",_mins,_secs]);
    } else {
        _mins = floor((time-(_missionTime*60))/60);
        _secs = floor((time-(_missionTime*60))%60);
        if (_secs < 10) then {
            if (_secs == 0) then {
                _secs = "00";
                _mins = floor((time-(_missionTime*60))/60);
            };
            _secs = "0" + str(floor((time-(_missionTime*60))%60));
        };
        _setText ctrlSetStructuredText (parseText format ["Approximate Overtime: + %1:%2",_mins,_secs]);
    };
} else {
    ("timeRsc" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};
