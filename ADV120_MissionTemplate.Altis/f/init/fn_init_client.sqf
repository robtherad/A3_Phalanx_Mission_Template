//====================================================================================================
// Client init - Player is not null by this point

// Set loadouts
call phx_fnc_loadout_set;

// Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

f_param_radios = ["phx_param_radios",0] call BIS_fnc_getParamValue;
if (f_param_radios isEqualTo 1) then {
  // Preset radios
  phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
};

// Add mission boundary
phx_playerBoundsCheck_PFH = [phx_fnc_core_playerBoundsCheck, 5, []] call CBA_fnc_addPerFrameHandler;

// Add nametags
phx_core_showTags = [phx_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;

// Time remaining display - TODO: Remove and just add this into the spectator script?
phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;

// Create briefing
[] execVM "briefing.sqf";

// Generate ORBAT page
[] execVM "f\briefing\f_orbatNotes.sqf";

// Add condition for blocking ACE features when player becomes spectator
["isnotphxspectator", {
    private _return = false;
    if !(missionNamespace getVariable ["phx_isSpectator",false]) then {
        _return = true;
    };
    _return
}] call ACE_common_fnc_addCanInteractWithCondition;

// Initialize variables for spectator script later on
phx_spect_playerGroup = group player;
private _str = str player;
phx_spect_playerGroupNumber = parseNumber (_str select [(_str find ":") + 1]);

// Add EH for kill display
call phx_fnc_core_addKilledEH;

//====================================================================================================
phx_clientInitFinished = true;

// Call init function for scripts that are shared between clients and server
call phX_fnc_init_shared;
