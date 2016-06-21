// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_unit", "_selection", "_damage"];

_totalDamage = damage _unit + _damage;
if (phx_revive_var_debugMode == 1) then {
    player sidechat format["%1 - '%2' - %3 - %4",_unit,_selection,_damage,_totalDamage];
};

// if selection is not head or hands or "" check if we can save him.
if ((_selection != "head") &&  _selection != ""  && _selection != "hands" && _totalDamage > 1) then {
    if (!(_unit getVariable ["phx_revive_down",false])) then {
        // [[_unit,true], "phx_fnc_SetDowned", true] spawn BIS_fnc_MP;
        [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];

        _damage = 0;
        _unit spawn {_this allowDammage false;sleep 1;_this allowDammage true};
    };
};

if (isBleeding _unit && _unit getVariable ["phx_revive_bleeding",false]) then {
    _unit setVariable ["phx_revive_bleeding",true];
};
_damage
