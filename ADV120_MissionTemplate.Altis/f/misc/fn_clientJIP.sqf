// Adds a CBA PFH that listens for a server variable that lets the client know if the mission has started or not.

if (!hasInterface) exitWith {};

[{
    params ["_args","_handle"];
    _args params ["_var"];
    
    // Variable not set yet, exit
    if (isNil "phx_hasGameStarted") exitWith {}; 
    
    // Variable set, game hasn't started yet. Player must not be a JIP. Remove PFH
    if (!phx_hasGameStarted) then {
        [_handle] call CBA_fnc_removePerFrameHandler; 
        phx_didJipCheck = true;
    };
    
    // Game started, player is JIP, put him in spectate
    if ( (phx_hasGameStarted) && (isNil "phx_didJipCheck")) then {
        phx_didJipCheck = true;
        player setPos [-1000,-1000,0];
        [player,objNull,0,0,true] call f_fnc_CamInit;
        [_handle] call CBA_fnc_removePerFrameHandler;
    } else {
        diag_log format["JIP Check: Something went wrong: %1",_var];
    };
}, 0, [_this]] call CBA_fnc_addPerFrameHandler;