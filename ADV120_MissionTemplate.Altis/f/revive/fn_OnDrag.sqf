// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_unit", "_dragger"];

_dragger setVariable ["phx_revive_dragging",_unit,true];

// the dragger gets a release option.
if (local _dragger) then {
    _dragger addAction [
        format["<t color='#7f0000'>Release %1</t>",name _unit],
        {(_this select 1) setVariable ["phx_revive_dragging",nil];(_this select 1) removeAction (_this select 2);}, 
        nil, 
        6, 
        false, 
        true, 
        "", 
        "true"
    ];


    switch (currentWeapon _dragger) do {
        case (primaryWeapon _dragger): {
            _dragger switchMove "acinpknlmstpsraswrfldnon";
        };
       case (secondaryWeapon _dragger): {
            _dragger switchMove "AcinPknlMstpSnonWnonDnon";
       };
    };
};
_unit switchMove "AinjPpneMrunSnonWnonDb";

if (local _unit) then {
    // setup the unit and all that fun stuff.
    _unit attachTo [_dragger, [0, 1.1, 0.092]];
    _unit setDir 180;
    _unit setPos (getpos _unit);
};

// lets wait a while.
waitUntil {
    sleep 0.1;
    _dude =  _dragger getVariable ["phx_revive_dragging",nil];
    ( isNil "_dude" || !alive _dragger || (_dragger getVariable ["phx_revive_down",false]))
};


_dragger setVariable ["phx_revive_dragging",nil,true];
// release unit.
detach _unit;
_unit setPosATL getposATL _dragger;

if (!(_dragger getVariable ["phx_revive_down",false])) then {
    _unit switchMove "AinjPpneMstpSnonWrflDb_release";
};

sleep 0.1;
if (_unit getVariable ["phx_revive_down",false]) then {
    _unit switchMove "acts_InjuredLookingRifle02";
} else {
    _unit switchMove "amovppnemstpsraswrfldnon";
};

if (_dragger getVariable ["phx_revive_down",false]) then {
    _dragger switchMove "acts_InjuredLookingRifle02";
} else {
    _dragger switchMove "";
};
