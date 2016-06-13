if ((!isNil "phx_isSpectator") && (isNil "phx_end_clientTime")) then {
    [phx_end_clientWait] call CBA_fnc_removePerFrameHandler;
    phx_end_clientTime = [phx_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
};
