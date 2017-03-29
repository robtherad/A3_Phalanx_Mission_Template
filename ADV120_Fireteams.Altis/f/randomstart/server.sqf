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
    bc_randomMarkerWest = selectRandom _markerArrayWest;
    publicVariable "bc_randomMarkerWest";
    _randomTeamArray pushBack [_placeMarkerWest, bc_randomMarkerWest, _objectArrayWest , "WEST"];
};
// OPFOR
if (_randomizeEast && (count _markerArrayEast > 0)) then {
    bc_randomMarkerEast = selectRandom _markerArrayEast;
    _overlapWest = true;
    while {_overlapWest} do {
        if (!isNil "bc_randomMarkerWest") then {
            if (bc_randomMarkerWest == bc_randomMarkerEast) then {
                bc_randomMarkerEast = selectRandom _markerArrayEast;
                _overlapWest = true;
            } else {
                _overlapWest = false;
            };
        } else {
            _overlapWest = false;
        };
    };
    publicVariable "bc_randomMarkerEast";
    _randomTeamArray pushBack [_placeMarkerEast, bc_randomMarkerEast, _objectArrayEast, "EAST"];
};
// INDFOR
if (_randomizeIndependent && (count _markerArrayIndependent > 0)) then {
    bc_randomMarkerIndependent = selectRandom _markerArrayIndependent;
    _overlapWest = true;
    _overlapEast = true;
    while {_overlapWest || _overlapEast} do {
        if (!isNil "bc_randomMarkerWest") then {
            if (bc_randomMarkerWest == bc_randomMarkerIndependent) then {
                bc_randomMarkerIndependent = selectRandom _markerArrayIndependent;  
                _overlapWest = true;
            } else {
                _overlapWest = false;
            };
        } else {
            _overlapWest = false;
        };
        if (!isNil "bc_randomMarkerEast") then {
            if (bc_randomMarkerEast == bc_randomMarkerIndependent) then {
                bc_randomMarkerIndependent = selectRandom _markerArrayIndependent;  
                _overlapEast = true;
            } else {
                _overlapEast = false;
            };
        } else {
            _overlapEast = false;
        };
    };
    publicVariable "bc_randomMarkerIndependent";
    _randomTeamArray pushBack [_placeMarkerIndependent, bc_randomMarkerIndependent, _objectArrayIndependent, "INDEPENDENT"];
};
// CIV
if (_randomizeCivilian && (count _markerArrayCivilian > 0)) then {
    bc_randomMarkerCivilian = selectRandom _markerArrayCivilian;
    _overlapWest = true;
    _overlapEast = true;
    _overlapIndep = true;
    while {_overlapWest || _overlapEast || _overlapIndep} do {
        if (!isNil "bc_randomMarkerWest") then {
            if (bc_randomMarkerWest == bc_randomMarkerCivilian) then {
                bc_randomMarkerCivilian = selectRandom _markerArrayCivilian;  
                _overlapWest = true;
            } else {
                _overlapWest = false;
            };
        } else {
            _overlapWest = false;
        };
        if (!isNil "bc_randomMarkerEast") then {
            if (bc_randomMarkerEast == bc_randomMarkerCivilian) then {
                bc_randomMarkerCivilian = selectRandom _markerArrayCivilian;  
                _overlapEast = true;
            } else {
                _overlapEast = false;
            };
        } else {
            _overlapEast = false;
        };
        if (!isNil "bc_randomMarkerIndependent") then {
            if (bc_randomMarkerIndependent == bc_randomMarkerCivilian) then {
                bc_randomMarkerCivilian = selectRandom _markerArrayCivilian;  
                _overlapIndep = true;
            } else {
                _overlapIndep = false;
            };
        } else {
            _overlapIndep = false;
        };
    };
    publicVariable "bc_randomMarkerCivilian";
    _randomTeamArray pushBack [_placeMarkerCivilian, bc_randomMarkerCivilian, _objectArrayCivilian, "CIV"];
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
                _x setPosATL [(_newPos select 0), (_newPos select 1),0.5];
                _x setDir ((markerDir _randomMark) + (getDir _x));
            };
        } forEach _objectArray;
    };
} forEach _randomTeamArray;