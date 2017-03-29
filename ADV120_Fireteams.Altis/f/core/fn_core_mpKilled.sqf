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

// Player has died and 
if (player isEqualTo _unit && {!(missionNamespace getVariable ["ACE_isDead",false])}) then {
    // Check for real killer, just in case
    if (isNull _killer) then {_killer = missionNamespace getVariable ["ace_medical_lastDamageSource",objNull];
    private _name = "UNKNOWN"
    private _killDist = 0;
    if !(isNull _killer) then {
        _name = name _killer;
        _killDist = ceil (_killer distance _unit);
    };
    
    private _friendly = "";
    if ((side group player) isEqualTo (side group _killer)) then {
        _friendly = " - [FRIENDLY]";
        if (player isEqualTo _killer) then {
            _friendly = " - [SELF]";
        };
    };
    // Commence Readout
    private _kills = "You were killed by - " + _name + " (" + str(_killDist) + "m)" + _friendly;
    {
        systemChat format ["%1",_x];
    } forEach phx_kills2;
};