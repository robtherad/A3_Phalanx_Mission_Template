// Adds a CBA PFH that listens for a server variable that lets the client know if the mission has started or not.

if (!hasInterface) exitWith {};

[{
    params ["_args","_handle"];
    _args params ["_var"];
    
    // Variable not set yet, exit
    if (isNil "phx_hasGameStarted") exitWith {}; 
    
    // Player's in singleplayer, there is no JIP
    if (!isMultiplayer) then {
        diag_log format["JIP Check: Game is singleplayer, removing PFH."];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    
    // Variable set, game hasn't started yet. Player must not be a JIP. Remove PFH
    if (!phx_hasGameStarted && {isMultiplayer}) then {
        [_handle] call CBA_fnc_removePerFrameHandler; 
        phx_didJipCheck = true;
    };
    
    // Game started, player is JIP, put him in spectate
    if ( ((phx_hasGameStarted) && (isNil "phx_didJipCheck")) && {isMultiplayer}) then {
        phx_didJipCheck = true;
        player setPos [-1000,-1000,0];
        player setVariable ["phx_loadoutAssigned",false];
        [player,objNull,0,0,true] call f_fnc_CamInit;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_this]] call CBA_fnc_addPerFrameHandler;