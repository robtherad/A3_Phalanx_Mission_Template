/*
This file will start all scripts part of the default BC template. Call this file from init.sqf using the following line of code.

[] execVM "f\bcInit.sqf";

*/
//====================================================================================================
//Initialize Variables - End conditions
bc_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
bc_missionRunTime = ["mission_runtime",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
bc_missionRuntimeMins = bc_missionRunTime + bc_missionSafeTime;
bc_alertOver = 1; // Time elapsed warning
bc_alertEnd = 0; // Time elapsed warning
bc_alertSoon = 0; // 15 minute warning

//====================================================================================================
//difficulty Message
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
        [_hintStr,15] remoteExecCall ["bc_fnc__hintThenClear", 0];
    };
};

//====================================================================================================
//Cancel unneeded calculations
disableRemoteSensors true;

//====================================================================================================
//Pre Briefing Client Scripts
if (hasInterface) then {
    bc_core_showTags = [BC_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;
    bc_radHandle1 = [BC_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
    bc_end_clientWait = [BC_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};

//====================================================================================================
//Pre Briefing Server Scripts
if (isServer && isNil "bc_serverInit") then {
    bc_end_checkTime = [BC_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
    bc_end_checkAlive = [BC_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;

    bc_serverInit = true; //Set this so that the server stuff only runs once
};

//====================================================================================================
//Wait for mission to start
waitUntil {time > 0};

//====================================================================================================
//Post Briefing Client Scripts
if (hasInterface) then {
    call BC_fnc_gps_init;
};

//====================================================================================================
//Disable AI contact reports
player setspeaker "NoVoice";
showSubtitles false;
enableSentences false;
enableRadio false;
player disableConversation true;
