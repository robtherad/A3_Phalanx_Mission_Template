private ["_nextLoc","_nextType"];
_nextLoc = selectRandom objLocations;
_nextType = selectRandom objTypes;
[false] execVM "f\timeweather\server.sqf";
[[[_nextLoc],"f\fireteams\fn_fireteams_cinematicStart.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
[_nextLoc, _nextType] call phx_fnc_fireteams_objMove;
[_nextLoc] call phx_fnc_fireteams_playerStart;
//[_nextLoc] call phx_fnc_fireteams_spawnItems; // Spawn items last because it may take some time
