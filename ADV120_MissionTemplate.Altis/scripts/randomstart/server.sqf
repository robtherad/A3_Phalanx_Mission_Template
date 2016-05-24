/*
This script will allow a team to be randomly placed at one of any predetermined markers.

For this script to be effective you will need at least three markers. One marker must be called 'placemark' and must be placed near the team that you wish to be moved. The other two markers can be called anything you want but they must be defined in the server.sqf file in the _markerArray on line 18. If you wish to change the team being moved, change the _ranTeam variable on line 18 in the client.sqf file.

This file is run on the server to randomly select a marker from an array of markers. Once a marker is randomly selected the name of the marker is broadcast to all clients.

Call this file on THE SERVER from init.sqf using the command below.

[] execVM "scripts\randomstart\server.sqf";

DO NOT FORGET TO CALL THE CLIENT SIDE OF THIS SCRIPT FROM INIT.SQF!

[] execVM "scripts\randomstart\client.sqf";
*/
if (!isServer) exitWith {};
//Fill this array with the names of all markers you want to be considered for the randomized start.
#include "settings.sqf";

_randomTeamArray = []; //

//Select a marker from each array at random then broadcast to all clients
// BLUFOR
if (_randomizeWest && (count _markerArrayWest > 0)) then {
    phx_rs_WestMark = selectRandom _markerArrayWest;
    publicVariable "phx_rs_WestMark";
    _randomTeamArray pushBack [_placeMarkerWest, phx_rs_WestMark, _objectArrayWest , "WEST"];
};
// OPFOR
if (_randomizeEast && (count _markerArrayEast > 0)) then {
    phx_rs_EastMark = selectRandom _markerArrayEast;
    _overlapWest = true;
    while {_overlapWest} do {
        if (!isNil "phx_rs_WestMark") then {
            if (phx_rs_WestMark == phx_rs_EastMark) then {
                phx_rs_EastMark = selectRandom _markerArrayEast;
                _overlapWest = true;
            } else {
                _overlapWest = false;
            };
        } else {
            _overlapWest = false;
        };
    };
    publicVariable "phx_rs_EastMark";
    _randomTeamArray pushBack [_placeMarkerEast, phx_rs_EastMark, _objectArrayEast, "EAST"];
};
// INDFOR
if (_randomizeIndependent && (count _markerArrayIndependent > 0)) then {
    phx_rs_GuerMark = selectRandom _markerArrayIndependent;
    _overlapWest = true;
    _overlapEast = true;
    while {_overlapWest || _overlapEast} do {
        if (!isNil "phx_rs_WestMark") then {
            if (phx_rs_WestMark == phx_rs_GuerMark) then {
                phx_rs_GuerMark = selectRandom _markerArrayIndependent;
                _overlapWest = true;
            } else {
                _overlapWest = false;
            };
        } else {
            _overlapWest = false;
        };
        if (!isNil "phx_rs_EastMark") then {
            if (phx_rs_EastMark == phx_rs_GuerMark) then {
                phx_rs_GuerMark = selectRandom _markerArrayIndependent;
                _overlapEast = true;
            } else {
                _overlapEast = false;
            };
        } else {
            _overlapEast = false;
        };
    };
    publicVariable "phx_rs_GuerMark";
    _randomTeamArray pushBack [_placeMarkerIndependent, phx_rs_GuerMark, _objectArrayIndependent, "INDEPENDENT"];
};

{ //forEach _randomTeamArray

    // Unpack variables
    _placeMark = _x select 0;
    _randomMark = _x select 1;
    _objectArray = _x select 2;
    _teamName = _x select 3;

    //Move any objects which are defined in _objectArray
    if (count _objectArray > 0) then {
        _startMarkPos = getMarkerPos _randomMark;
        _placeMarkerPos = getMarkerPos _placeMark;
        {
            if (isNil {_objectArray select _forEachIndex}) then {
                _str = "[randomstart] ERROR - Tried to move non-existent object for team: " + _teamName;
                _str remoteExecCall ["systemChat", 0];
            } else {
                //Find object distance and direction to the placement marker.
                _dis = _x distance2D _placeMarkerPos;
                _dir = ((_x getDir _placeMarkerPos) + (markerDir _randomMark)) - 180;

                //Returns a position that is a specified distance and compass direction from the passed position or object.
                _newPos = _startMarkPos getPos [_dis, _dir];

                //Move object
                _x setPos [(_newPos select 0), (_newPos select 1)];
                _x setDir ((markerDir _randomMark) + (getDir _x));
            };
        } forEach _objectArray;
    };
} forEach _randomTeamArray;
