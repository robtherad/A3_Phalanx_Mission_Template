/*
This script creates markers on units that have a GPS on them. These markers are only visible to a player if they also have a GPS.

If a unit with a GPS marker gets in a vehicle their marker will disappear. The text of the vehicle's marker though will change to the name of the vehicle with the name of the unit inside of it in parentheses next to it.
If a unit with a GPS marker dies their marker will be transferred to the next person in their group that has a GPS. If nobody else in the group has a GPS then the marker will stay where the person with GPS last was until a unit from that group picks up a GPS.
If a player who has a GPS drops it they will no longer be able to see the markers on their map. 
If a unit without a GPS picks one up they will be able to see all GPS marks on the map.

Vehicle Markers
    If you do have vehicles in your mission, make sure they are named and then add that name to the array for the team they are on. Either _westVehArray or _eastVehArray on lines 49 and 50 in this file. 

        //No vehicles in mission
        _westVehArray = nil;
        _eastVehArray = nil;

        //Vehicles in mission
        _westVehArray = [bluforTruck1,bluforTruck2]; 
        _eastVehArray = [opforTruck]; 

    If you want the vehicle to have a custom name instead of something weird looking like 'bluTruck' then add the following line to the vehicles initialization field in the editor to change the GPS marker name to whatever you want:

        this setVariable ["phx_MarkerName", "GPS Marker Text Goes Here"];
    
Excluding groups from being marked
    By default, all groups will have markers generated for them even if their leader doesn't have GPS. If you wish to exclude a group from having a marker generated and updated, add it's groupID to the array phx_ignoreMarkerArray on line 51. In the default template all groups have their groupIDs set by the file "f\setGroupID\f_setGroupID.sqf" so you will want to use the values defined there. Make sure when you enter a groupID you surround it with quotes since it is a string. 
    
    For example, if I wanted to exclude groups with the groupIDs "P", "AV", "BV", "CV" and "DV" from having markers created I would set phx_ignoreMarkerArray to:

    phx_ignoreMarkerArray = ["P","AV","BV","CV","DV"];
    
    To make sure all groups have markers set phx_ignoreMarkerArray to be an empty array. If you have just downloaded the template off GITHUB then this should be the default setting. To do this use the following line:
    
    phx_ignoreMarkerArray = [];
*/
//Local script, dedicated server not needed
if (isDedicated) exitWith {};
//Check to see if mission parameters have markers enabled - Default ON
_useMarkers = ["phx_gps_markersEnabledParam",1] call BIS_fnc_getParamValue;
if (_useMarkers == 0) exitWith {};

#include "settings.sqf";

switch (side player) do {
    case west: { if (!isNil "_westVehArray") then {phx_sideVehArray = _westVehArray;} else {phx_sideVehArray = nil;}; };
    case east: { if (!isNil "_eastVehArray") then {phx_sideVehArray = _eastVehArray;} else {phx_sideVehArray = nil;}; };
    case independent: { if (!isNil "_indVehArray") then {phx_sideVehArray = _indVehArray;} else {phx_sideVehArray = nil;}; };
    default { phx_sideVehArray = nil; };
};
if (!isNil "phx_sideVehArray") then {
    phx_sideVehArray2 = [];
    {
        _veh = _x select 0;
        _ident = _x select 1;
        phx_sideVehArray2 pushBack _veh;
    } forEach phx_sideVehArray;
};
if (!isNil "_sidesVisibleToWest" && !isNil "_sidesVisibleToEast" && !isNil "_sidesVisibleToGuer") then {
    //Set a variable that contains every side who's markers the player should be able to see
    switch (side player) do {
        case west: { phx_sidesVisibleToPlayer = _sidesVisibleToWest; };
        case east: { phx_sidesVisibleToPlayer = _sidesVisibleToEast; };
        case independent: { phx_sidesVisibleToPlayer = _sidesVisibleToGuer; };
        default { phx_sidesVisibleToPlayer = []; };
    };
};
call phx_fnc_gps_createMarks;