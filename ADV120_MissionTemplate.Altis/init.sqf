//init.sqf - Executed when mission is started (before briefing screen)

diag_log format["init.sqf: ran init"];

// Activates the trigger used for the mission area. Delete the line below and the trigger if you want no mission boundary.
if (hasInterface) then {phx_playerBoundsCheck_PFH = [phx_fnc_core_playerBoundsCheck, 5, []] call CBA_fnc_addPerFrameHandler;};
diag_log format["init.sqf: Added boundary"];
//Create briefing
[] execVM "briefing.sqf";
diag_log format["init.sqf: Added briefing"];
//Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";
diag_log format["init.sqf: Setup groupIDs"];
//Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";
diag_log format["init.sqf: Added ORBAT notes"];
//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";
diag_log format["init.sqf: Added safestart"];
//Call PHX Template
[] execVM "f\phxInit.sqf";
diag_log format["init.sqf: Ran template init"];