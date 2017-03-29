private ["_nextLoc","_nextType"];
[false] execVM "f\timeweather\server.sqf";
[[[],"f\fireteams\fn_fireteams_cinematicNext.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
//call phx_fnc_fireteams_objClean;
_nextLoc = selectRandom objLocations;
_nextType = selectRandom objTypes;
[_nextLoc, _nextType] call phx_fnc_fireteams_objMove;
[_nextLoc] call phx_fnc_fireteams_playerRespawn;
//[_nextLoc] call phx_fnc_fireteams_spawnItems; // Spawn items last because it may take some time
