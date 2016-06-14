// Adds a CBA PFH that listens for a server variable that lets the client know if the mission has started or not.

if (!hasInterface) exitWith {};

[{
    params ["_args","_handle"];
    _args params ["_var"];
    
    // Variable not set yet, exit
    if (isNil "phx_hasGameStarted") exitWith {}; 
    
    private _typeOf = typeOf player;
    
    // Virtual Specator - Shouldn't get killed and placed into F3
    if (_typeOf isEqualTo "VirtualSpectator_F") then {
        diag_log format["JIP Check: Player is spectator."];
        phx_isSpectator = true;
        [_handle] call CBA_fnc_removePerFrameHandler;
    } else {
        // Player's in singleplayer, there is no JIP
        if (!isMultiplayer) then {
            diag_log format["JIP Check: Game is singleplayer, removing PFH."];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
        
        private _safeTimer = ["f_param_mission_timer",10] call BIS_fnc_getParamValue;
        
        // Variable set, game hasn't started yet. Player must not be a JIP. Remove PFH
        if (( !phx_hasGameStarted || (phx_hasGameStarted && didJip && (_safeTimer isEqualTo 0)) ) && {isMultiplayer}) then {
            diag_log format["JIP Check: Game didn't start yet, removing PFH."];
            [_handle] call CBA_fnc_removePerFrameHandler; 
            phx_didJipCheck = true;
        };
        
        // Game started, player is JIP, put him in spectate
        if (((phx_hasGameStarted) && (isNil "phx_didJipCheck")) && {isMultiplayer}) then {
            phx_didJipCheck = true;
            [_handle] call CBA_fnc_removePerFrameHandler;
            diag_log format["JIP Check: Game started, removing PFH, adding waitUntilAndExec."];
            [{diag_log "JIP Check: Waiting for non-null player."; (!isNull player) && (player == player)}, {
                // Execution
                player setPos [-1000,-1000,0];
                player setVariable ["phx_loadoutAssigned",false];
                diag_log format["JIP Check: waitUntilAndExec passed: Spawning spectator script."];
                [player,objNull,0,0,true] spawn f_fnc_CamInit;
            }, []] call CBA_fnc_waitUntilAndExecute;
        };
    };
}, 0, [_this]] call CBA_fnc_addPerFrameHandler;