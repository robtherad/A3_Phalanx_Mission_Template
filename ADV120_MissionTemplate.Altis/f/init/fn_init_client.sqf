//====================================================================================================
// Client init - Player is not null by this point
diag_log format["clientInit: canSuspend:%1",canSuspend];
// Set loadouts
call phx_fnc_loadout_set;

// Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

// Preset radios
phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;

// Add mission boundary
phx_playerBoundsCheck_PFH = [phx_fnc_core_playerBoundsCheck, 5, []] call CBA_fnc_addPerFrameHandler;

// Add nametags
phx_core_showTags = [phx_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;

// Time remaining display - TODO: Remove and just add this into the spectator script?
phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;

// Revive script
call phx_fnc_reviveInit;

// Create briefing
[] execVM "briefing.sqf";

// Generate ORBAT page
[] execVM "f\briefing\f_orbatNotes.sqf";

//====================================================================================================
phx_clientInitFinished = true;

// Call init function for scripts that are shared between clients and server
call phX_fnc_init_shared;
