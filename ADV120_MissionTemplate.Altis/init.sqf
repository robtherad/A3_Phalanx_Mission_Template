if (isServer) then {phx_fnc_init_server call CBA_fnc_directCall;};

if (hasInterface) then {
    // Make sure init isn't called until player is ready
    [{!isNull player}, {call phx_fnc_init_client;}, []] call CBA_fnc_waitUntilAndExecute;
};