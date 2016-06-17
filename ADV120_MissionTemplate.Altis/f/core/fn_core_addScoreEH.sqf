if (!isServer) exitWith {};

{
    _x addEventHandler ["HandleScore",{0}];
} forEach (playableUnits + switchableUnits);
