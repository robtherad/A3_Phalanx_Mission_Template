//Get parameters from slotting screen.
phx_sectorControl = missionNamespace getVariable "phx_sectorControlActive";
if (isNil "phx_sectorControl") then {    //Check to see if the sector control script is running.
    phx_sectorControl = false;
};

//Function that adds the current point totals to hint popups when the sector control script is running.
fnc_sectorControl = {
    if (phx_sectorControl) then {
        _opfPercent = round ((((phx_eastPoints) / (phx_endPoints))*100)*100) / 100;
        _bluPercent = round ((((phx_westPoints) / (phx_endPoints))*100)*100) / 100;

        _opfPercentStr = parseText format [" - (%1&#37;)",_opfPercent];
        _bluPercentStr = parseText format [" - (%1&#37;)",_bluPercent];

        _hintStr = _hintStr + "\n\n\nSector Points\nBLUFOR - " + str(phx_westPoints) + " / " + str(phx_endPoints) + str(_bluPercentStr) + "\n" + "OPFOR - " + str(phx_eastPoints) + " / " + str(phx_endPoints) + str(_opfPercentStr);
    };
};

//Time Limits
if ((phx_missionRuntimeMins - 15) <= (time/60) && (phx_alertSoon == 0)) then {
    _hintStr = "15 minutes remaining.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertSoon = 1;
};
if (phx_missionRuntimeMins <= (time/60) && (phx_alertEnd < 1)) then {
    _hintStr = "The mission time limit has been reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertEnd = phx_alertEnd + 1;
};
if ((phx_missionRuntimeMins + (1*phx_alertOver)) <= (time/60)) then {
    _hintStr = str(1*phx_alertOver) + " minute(s) since limit.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertOver = phx_alertOver + 1;
};
