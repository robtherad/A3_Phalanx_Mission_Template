basePos = getPos player;
spectateUnit = player;
isPlaying = false;
isSpectating = false;

//Get offset from respawn marker position ... this is used later for spreading defenders out at the objective ... cheap trick, but effective
if (side player == west) then {
	_xOffset = (basePos select 0) - (markerPos "respawn_west" select 0);
	_yOffset = (basePos select 1) - (markerPos "respawn_west" select 1);
};
if (side player == east) then {
	_xOffset = (basePos select 0) - (markerPos "respawn_east" select 0);
	_yOffset = (basePos select 1) - (markerPos "respawn_east" select 1);
};
if (side player == independent) then {
	_xOffset = (basePos select 0) - (markerPos "respawn_guerrila" select 0);
	_yOffset = (basePos select 1) - (markerPos "respawn_guerrila" select 1);
};

//execVM "f\fireteams\fn_fireteams_afkKiller.sqf";

// If we don't know if a round is in progress,
// wait until we do or until the player dies.
// If they die, move them back to their spawn.
while {isNil "roundInProgress"} do {
	waitUntil {!isNil "roundInProgress" || !alive player};
	if (!alive player) then {
		[false] call phx_fnc_fireteams_respawn;
	};
};

if (roundInProgress) then {
	hintC "Waiting for next round";
	while {roundInProgress} do {
		waitUntil {!roundInProgress || !alive player};
		if (!alive player) then {
			[false] call phx_fnc_fireteams_respawn;
		};
	};
};

while {true} do {
  // Client will loop this process throughout the mission

	// Set the camera to be from the players perspective
	spectateUnit = player;
	//call phx_fnc_fireteams_switchCamera;

	// Set client prepared for round variables
	player setVariable ["isPlaying", false];
	player setVariable ["ready", true, true];

	while {(!roundInProgress) || (!(player getVariable ["isPlaying", false]))} do {
		waitUntil {(roundInProgress && (player getVariable ["isPlaying", false])) || !alive player};

		if (!alive player) then {
			[false] call phx_fnc_fireteams_respawn;
			player setVariable ["ready", true, true];
		};
		execVM "f\randomstart\client.sqf";
	};

	// Stop restriction checking to allow "thread-safe" round initialization.
	enableRestrictionChecking = false;
	waitUntil {!restrictionCheckingEnabled};

	//Stop player's existing movement
	player setVelocity [0,0,0];
	if (false) then {
		// Assign vehicles for loss streak
		if ((vehicle player == player) && (isNil "currentVeh")) then {
			waitUntil {!isNil "currentVeh"};
			if (vehicle player == player) then {
				[currentVeh] call currentVehHandler;
			};
		};
	} else {
		// No vehicles assigned to team
		if (side player == west) then {
			_startMarkPos = getMarkerPos bc_randomMarkerWest;
		} else {
			if (side player == east) then {
				_startMarkPos = getMarkerPos bc_randomMarkerEast;
			} else {
				if (side player == independent) then {
					_startMarkPos = getMarkerPos bc_randomMarkerIndependent;
				} else {
					if (side player == civilian) then {
						_startMarkPos = getMarkerPos bc_randomMarkerCivilian;
					};
				};
			};
		};
		_pos = [(_startMarkPos select 0) + _xOffset, (_startMarkPos select 1) + _yOffset];
		_pos = [_pos, 3] call phx_fnc_fireteams_findFlatEmpty;
		player setPos _pos;
	};

	// Reset players health
	player setDamage 0;

	// Set the isPlaying flag
	isPlaying = true;

	// Give them their weapons
	[true] call phx_fnc_fireteams_respawn;

	// Re-enable restriction checking.
	restrictionCheckingEnabled = true;
	enableRestrictionChecking = true;

	// Set conditions for allowing player damage (30 second wait or the player dies or the round ends)
	[] spawn {
		private ["_endTime"];
		_endTime = time + 30;
		waitUntil {(!(alive player)) || (!roundInProgress) || (time > _endTime)};
		if ((time > _endTime) && (alive player) && roundInProgress) then
		{
			player setVariable ["playerAllowDamage", true, true];
		};
	};

	// Wait until the round ends or the player dies
	waitUntil {!(alive player) || !roundInProgress};

	// Set their isPlaying flag
	isPlaying = false;
	player setVariable ["isPlaying", false];

	// Strip 'em
	[false] call phx_fnc_fireteams_respawn;

	// Is the round still going?
	if (roundInProgress) then {
		// [] call phx_fnc_fireteams_nextSpectateUnit;
	} else {
		// Nope, reset the player back to the spawn
		if (vehicle player != player) then {
			player action ["Eject", vehicle player];
		};
    player setPos basePos;
    player setVelocity [0,0,0];
    player setDamage 0;
	};

	waitUntil {!roundInProgress};

};
