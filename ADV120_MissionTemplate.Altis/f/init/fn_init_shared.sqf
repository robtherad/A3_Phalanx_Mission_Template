//====================================================================================================
// Shared Scripts

// Add event handlers for rating and score
call phx_fnc_core_addRatingEH;
call phx_fnc_core_addScoreEH;

// Set up time of day + weather
call phx_fnc_core_setDate;
call phx_fnc_core_setWeather;

// Run safestart script
[] execVM "f\safeStart\f_safeStart.sqf";

//====================================================================================================
phx_sharedInitFinished = true;

// Wait for mission to start, then execute post briefing init
[{CBA_missionTime > 0}, {
    call phx_fnc_init_postBriefing;
}, []] call CBA_fnc_waitUntilAndExecute;