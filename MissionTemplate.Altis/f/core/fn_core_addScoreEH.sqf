if (!isServer) exitWith {};

{
    _x addEventHandler ["HandleScore",{false}];
} forEach (playableUnits + switchableUnits);
