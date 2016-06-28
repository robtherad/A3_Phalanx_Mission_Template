/*
Creates sector(s) and then adds a PFH to poll them every ~10 seconds for changes..

Runs on server.
*/
if (!isServer) exitWith {};

#include "settings.sqf"

// Initialize variables
private _markerNameIterator = 0;
phx_sector_westPoints = 0;
phx_sector_westPointsPublic = 0;

phx_sector_eastPoints = 0;
phx_sector_eastPointsPublic = 0;

phx_sector_playing = true;
phx_sector_sectorControl = true;
missionNamespace setVariable ["phx_sector_sectorControlActive", true, true]; // Used to check if sector control module is running or not

if (isNil "phx_sector_quickestTime") then {
    // Time in minutes it would take to win if one team owned all points uncontested
    phx_sector_quickestTime = ["phx_sector_sectorTime",25] call BIS_fnc_getParamValue;
};
phx_sector_endPoints = (phx_sector_quickestTime * 60) * (count phx_sector_triggerArray);

// Create markers for players to see whats going on
{// forEach phx_sector_triggerArray
    // Get variables for a marker
    private _markerName = str(_markerNameIterator) + "_phxSectorMark";
    private _markerNameText = str(_markerNameIterator) + "_phxSectorMarkText";
    private _markerSize = triggerArea _x;
    private _markerPos = getPos _x;

    // Just in case this script has already been run
    if (!isNil "phx_sector_sectorsAlreadyCreated") then {
        deleteMarker _markerName;
        deleteMarker _markerNameText;
    };
    
    // Build marker for area
    private _marker = createMarker [_markerName,_markerPos];
    _marker setMarkerSize [_markerSize select 0,_markerSize select 1];
    _marker setMarkerDir (_markerSize select 2);
    _marker setMarkerColor "ColorBlack";
    _marker setMarkerBrush "SolidBorder";
    // Get marker's shape
    if (_markerSize select 3) then {
        _marker setMarkerShape "RECTANGLE";
    } else {
        _marker setMarkerShape "ELLIPSE";
    };

    // Build marker for text
    _marker = createMarker [_markerNameText,_markerPos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_dot";
    _marker setMarkerText (triggerText _x + " - Neutral");

    // Create flag
    _flag = createVehicle ["Flag_White_F", (getPos _x), [], 0, "CAN_COLLIDE"];
    _flag allowDamage false;
    _x setVariable ["phx_sector_flagPole",_flag,true];
    
    // Set sector status to neutral for later
    _x setVariable ["phx_sector_curOwner",3,true];
    _x setVariable ["phx_sector_lastOwner",3];
    _markerNameIterator = _markerNameIterator + 1;
} forEach phx_sector_triggerArray;

if (isNil "phx_sector_sectorsAlreadyCreated") then {
    phx_sector_sectorsAlreadyCreated = true;

    [phx_fnc_watchSector, _delay, [phx_sector_triggerArray, _delay, _sectorType]] call CBA_fnc_addPerFrameHandler;
};