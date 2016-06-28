/*
When the player dies they will have a hint pop up and display who they were killed by as well as all phx_kills that they got during the mission.

This script is executed every time a unit is killed during the mission. Don't call this script from any init.sqf files.

0 unit: Object - Object the event handler is assigned to
1 killer: Object - Object that killed the unit
Contains the unit itself in case of collisions
*/

// No need for server to be running this script.
if (!hasInterface) exitWith {};

params ["_unit", "_killer"];

showSubtitles false; //Apparently when you get a team kill it changes this variable?

// Make sure variable 'phx_kills' isn't empty. If so, initialize.
if (isNil {phx_kills}) then {
    phx_kills = "You killed: \n";
    phx_killCount = 0;
    phx_killsStruct = [phx_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["phx_killsStruct",phx_killsStruct];
};

// Player has killed.
if (vehicle player isEqualTo _killer && {!(_unit getVariable ["phx_revive_respawnRevive",false])}) then {
    // Check for friendly fire
    if (side group player isEqualTo side group _unit) then {
        phx_friendly = " - [FRIENDLY]";
        if (player isEqualTo _unit) then {
            phx_friendly = " - [SELF]";
        };
    } else {
        phx_friendly = "";
    };
    phx_killDist = ceil (_killer distance _unit);
    phx_killCount = phx_killCount + 1;
    // Build string for use in readout.
    phx_kills = phx_kills + str(phx_killCount) + ". " + (name _unit) + " (" + str(phx_killDist) + "m)" + phx_friendly + "\n";
    phx_killsStruct = [phx_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["phx_killsStruct",phx_killsStruct];
};

// Player has died and bypassed the revive script
if (player isEqualTo _unit && {!(missionNamespace getVariable ["phx_revive_respawnRevive",false])}) then {
    // Check for friendly fire
    if ((side group player) isEqualTo (side group _killer)) then {
        phx_friendly = " - [FRIENDLY]";
        if (player isEqualTo _killer) then {
            phx_friendly = " - [SELF]";
        };
    } else {
        phx_friendly = "";
    };
    phx_killDist = ceil (_killer distance _unit);
    // Commence Readout
    phx_kills = "You were killed by - " + (name _killer) + " (" + str(phx_killDist) + "m)" + phx_friendly + "\n-\n" + phx_kills;
    phx_kills3 = phx_kills;
    phx_killsStruct = [phx_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["phx_killsStruct",phx_killsStruct];
    phx_kills2 = [phx_kills3, "\n"] call CBA_fnc_split;
    {
        systemChat format ["%1",_x];
    } forEach phx_kills2;
};