private ["_nextLoc","_locPos","_objAreaMarker","_marker","_check","_randomPos","_placedMarkerPos"];
_nextLoc = _this select 0;
_locPos  = _nextLoc select 2;

#include "..\randomstart\settings.sqf";

//Move the random start markers around the perim. of the AO (800m circle around the _nextLoc position)
_objAreaMarker = "objAreaMarker";
_objAreaMarker setMarkerPos _locPos;
_objAreaMarker setMarkerSize [sizeOfSpawnAO, sizeOfSpawnAO];

checkRandomStartPos = {
    private ["_pos","_placedPos","_check","_checkWater"];
    _pos       = _this select 0;
    _placedPos = _this select 1;

    _check = false;
    // Fail check if pos is in water
    _checkWater = !(surfaceIsWater _pos);

    // Fail check if pos is too close to other markers
    _checkDist = true;
    {
        _placed = _x;
        _dist = _placed distance2D _pos;
        //
        if (_dist < minDistBetweenSpawn) exitWith {_checkDist=false};
    } forEach _placedPos;

    // AND all checks together; all must be true for check to pass
    _check = _checkWater && _checkDist;
    _check
};

_placedMarkerPos = [];
{
    _marker = _x;
    _check = false;

    // Continually try a new randomPos until checkRandomStartPos returns true
    _iterations = 0;
    while { !_check && (_iterations < 50) } do {
        _iterations = _iterations + 1;
        _randomPos = [_objAreaMarker, true] call CBA_fnc_randPosArea;
        _check = [_randomPos, _placedMarkerPos] call checkRandomStartPos;
    };

    // Found a good random pos
    _marker setMarkerPos _randomPos;

    // Keep that marker pos for further checks
    _placedMarkerPos pushBack _randomPos;

} forEach _markerArrayWest;

// Now that all markers are randomly set, call serverside randomstart
[] execVM "f\randomstart\server.sqf";

// After the civilian team is assigned a random spawn marker,
// we actually want them to start in the AO instead of the perimeter.
waitUntil {!isNil "bc_randomMarkerCivilian"};
bc_randomMarkerCivilian setMarkerPos _locPos;
