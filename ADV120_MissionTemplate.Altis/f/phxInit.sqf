/*
This file will start all scripts part of the default phx template. Call this file from init.sqf using the following line of code.

[] execVM "f\phxInit.sqf";

*/
//====================================================================================================
// Initialize Variables - End conditions
phx_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
phx_missionRunTime = ["phx_missionTimelimit",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
phx_missionRuntimeMins = phx_missionRunTime + phx_missionSafeTime;
phx_alertOver = 1; // Time elapsed warning
phx_alertEnd = 0; // Time elapsed warning
phx_alertSoon = 0; // 15 minute warning

//====================================================================================================
// Initialize Spectator Variables
if (hasInterface) then {
    [] spawn {
        waitUntil {!isNull (group player)};
        phx_spect_playerGroup = group player;
        
        private _vvn = vehicleVarName player;
        private _str = str player;
        phx_spect_playerGroupNumber = parseNumber (_str select [(_str find ":") + 1]);
    };
};
//====================================================================================================
// Difficulty Message
if (isServer) then {
    [] spawn {
        sleep 1;
        _diff = "Undefined";
        switch(difficulty) do {
            case 0: {_diff = "Recruit";};
            case 1: {_diff = "Regular";};
            case 2: {_diff = "Veteran";};
            case 3: {_diff = "Elite";};
        };
        _hintStr = "Mission Difficulty Setting = " + _diff;
        [_hintStr,15] remoteExecCall ["phx_fnc__hintThenClear", 0];
    };
};

//====================================================================================================
// Cancel unneeded calculations
disableRemoteSensors true;

//====================================================================================================
// Pre Briefing Client Scripts
if (hasInterface) then {
    phx_core_showTags = [phx_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;
    phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
    phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};

//====================================================================================================
// Pre Briefing Server Scripts
if (isServer && isNil "phx_serverInit") then {
    phx_end_checkTime = [phx_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
    phx_end_checkAlive = [phx_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;

    // Create respawn markers in bottom left corner of map
    {
        private _marker = createMarker [_x, [-1000,-1000,0]];
        _marker setMarkerShape "ICON";
        _marker setMarkerType "Empty";
    } forEach ["respawn", "respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];
    
    phx_serverInit = true; //Set this so that the server stuff only runs once
};

//====================================================================================================
// Wait for mission to start
waitUntil {CBA_missionTime > 0};

//====================================================================================================
// Post Briefing Client Scripts
if (hasInterface) then {
    call phx_fnc_gps_init;
    enableEnvironment false;
};

//====================================================================================================
// Disable AI contact reports
player setspeaker "NoVoice";
showSubtitles false;
enableSentences false;
enableRadio false;
player disableConversation true;
