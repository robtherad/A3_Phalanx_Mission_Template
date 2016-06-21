// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

params ["_unit", "_bool"];

// ====================================================================================
if (_bool && alive _unit) then {
    /// Check if they already down, don't down them again.
    if (_unit getVariable ["phx_revive_down",false]) exitWith {};

    // The ai is a bit too triggerhappy so lets set the units as captive
    _unit setVariable ["phx_revive_down",true];
    _unit setCaptive 1;


    // If the unit is local and a player, remove their magazines (otherwise they can throw grenades while down)
    if (local _unit && isPlayer _unit) then {
        _unit setVariable ["phx_revive_down_mags",magazines _unit];
        {
            _unit removeMagazine _x;
        } forEach magazines _unit;
        // this disables the actionmenu for the users
        showHud false;
    };

    // Just a safety switch to ensure that the unit is wounded enough to have the firstaid option
    if (damage _unit < 0.251) then { _unit setDamage 0.251};

    // if _unit is not in a vehicle, play this animation otherwise fetch the dead animations from the vehicles.
    if (vehicle _unit == _unit) then {
        _unit switchmove "acts_InjuredLookingRifle02";
    } else {
        _anim = getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo");
            _unit switchmove (_anim select 0);
            _veh = vehicle _unit;
            _veh addAction [
            "<t color='#7f0000'>Pull out wounded</t>", 
            {
                _this remoteExec ["phx_fnc_EjectWounded", 0];
            }, 
            nil, 
            5, 
            false, 
            true, 
            "", 
            "_target distance _this < 5 && [_target] call phx_fnc_HasWounded"
        ];
    };
} else {
    if (!(_unit getVariable ["phx_revive_down",false])) exitWith {};

    _unit setVariable ["phx_revive_down",false];
    // if the unit is not in a vehicle, play pretty animation otherwise just reset to thier default animation
    if (vehicle _unit == _unit) then {
        _unit switchmove "AinjPpneMstpSnonWnonDnon_rolltofront";
    } else {
        _unit switchmove "";
    };
    // clean up.
    _unit setCaptive 0;
    _dragIndex = _unit getVariable ["phx_revive_dragIndex",-1];
    if (_dragIndex >= 0) then {_unit removeAction _dragIndex};
    _unit setVariable ["phx_revive_dragIndex",-1];

    // give the unit back his magazines if hes local
    if (local _unit) then {
        _mags = _unit getVariable ["phx_revive_down_mags",magazines _unit];
        {
            _unit addMagazine _x;
        } forEach _mags;

        showHud true;
        // reset the PP
        phx_revive_UncToggle = true;
        [] spawn phx_fnc_WoundedEffect;
        sleep 0.1;
        // force him into prone otherwise he can get stuck in the rolltofrontanimation.
        _unit playMove "amovppnemstpsraswrfldnon";
    };
};
