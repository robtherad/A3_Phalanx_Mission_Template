private ["_bGiveWeapons"];
_bGiveWeapons = _this select 0;
if (!alive player) then {
  waitUntil {alive player};
  //[] call fnc_addActions;
};
//player setVariable ["preferDriver", preferDriver, true];
//player setVariable ["vehicleRole", [objNull, false]];
player setVariable ["playerAllowDamage", false, true];
call phx_fnc_loadout_set;
//[_bGiveWeapons] call phx_fnc_fireteams_assignGear;
player setFatigue 0;

if (roundInProgress && !isPlaying) then {
  //[] call phx_fnc_fireteams_nextSpectateUnit;
} else {
  spectateUnit = player;
  //[] call phx_fnc_fireteams_switchCamera;
};
