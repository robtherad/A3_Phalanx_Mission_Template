// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_unit", "_selection", "_damage"];

private _totalDamage = damage _unit + _damage;

if (_totalDamage >= 1 && {!(_unit getVariable ["phx_revive_downed",false])}) then {
    // Determine if player should be instantly killed or not based on where he got shot
    private _instantKill = false;
    private _randomNumber = random 100;
    switch (_selection) do {
        case "head":    {if (_randomNumber > 10) then {_instantKill = true; diag_log format ["phx_revive_OnDamage: Headshot (>10) - Number: %1",_randomNumber];};}; // 90% chance of instant death
        case "arms":    {}; // 0% chance of instant death
        case "legs":    {}; // 0% chance of instant death
        case "body":    {if (_randomNumber > 95) then {_instantKill = true;}; diag_log format ["phx_revive_OnDamage: Body Shot (>95) - Number: %1",_randomNumber];}; // 5% chance of instant death
        case "spine1":  {}; // 0% chance of instant death
        case "spine2":  {}; // 0% chance of instant death
        case "spine3":  {}; // 0% chance of instant death
    };
    
    if (!_instantKill) then {
        if (!(_unit getVariable ["phx_revive_down",false])) then {
            [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];

            // Make sure the unit doesn't die from this hit or any following hits for the next second or so
            _damage = 0;
            _unit spawn {
                _this allowDamage false;
                sleep 1;
                _this allowDamage true
            };
        };
    };
};

if (isBleeding _unit && {_unit getVariable ["phx_revive_bleeding",false]}) then {
    [_unit, true, true] remoteExec ["phx_fnc_SetBleeding", 0];
};
_damage
