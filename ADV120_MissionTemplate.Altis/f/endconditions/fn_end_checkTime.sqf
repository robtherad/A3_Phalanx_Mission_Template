// Time Limits
if ((phx_missionRuntimeMins - 15) <= (CBA_missionTime/60) && (phx_alertSoon == 0)) then {
    _hintStr = "15 minutes remaining.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertSoon = 1;
};
if (phx_missionRuntimeMins <= (CBA_missionTime/60) && (phx_alertEnd < 1)) then {
    _hintStr = "The mission time limit has been reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertEnd = phx_alertEnd + 1;
};
if ((phx_missionRuntimeMins + (1*phx_alertOver)) <= (CBA_missionTime/60)) then {
    _hintStr = str(1*phx_alertOver) + " minute(s) since limit.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertOver = phx_alertOver + 1;
};
