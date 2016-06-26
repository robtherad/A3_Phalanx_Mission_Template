// Adds a CBA PFH that checks to see if the group leader HUD is showing or not

private _showHUDArray = [
    true,    // Scripted HUD (same as showHUD command)
    true,    // Vehicle + soldier info
    true,    // Vehicle radar [HIDDEN]
    true,    // Vehicle compass [HIDDEN]
    true,    // Tank direction indicator
    true,    // Commanding menu
    false,   // Group Bar
    true     // HUD Weapon Cursors
];

[{
    params ["_args", "_handle"];
    _args params ["_showHUDArray"];
    
    if (!(shownHUD isEqualTo _showHUDArray) && {!(missionNamespace getVariable ["phx_revive_hiddenHUD",false])}) then {
        showHUD _showHUDArray;
    };
    
    if (!isNil "phx_isSpectator") then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 10, [_showHUDArray]] call CBA_fnc_addPerFrameHandler;
