// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_unit", "_dragger"];

_dragger setVariable ["phx_revive_dragging",_unit,true];
_unit setVariable ["phx_revive_beingDragged",true,true];

if (_dragger isEqualTo player) then {
    missionNamespace setVariable ["phx_revive_currentlyBusy",true];
};

// the dragger gets a release option.
if (_dragger isEqualTo player) then {
    private _releaseIndex = _dragger addAction [
        format["<t color='#FF4040'>Release</t> %1",name _unit],
        {
            params ["_unit", "_dragger", "_actionID"];
            _dragger removeAction _actionID;
            _dragger setVariable ["phx_revive_releaseIndex",-1];
            _dragger setVariable ["phx_revive_dragging",nil,true];
        }, 
        nil, 
        99, 
        false, 
        true, 
        "", 
        "true"
    ];
    _dragger setVariable ["phx_revive_releaseIndex",_releaseIndex];
    
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

// Add a PFH that waits for a change in state
[{
    params ["_args", "_handle"];
    _args params ["_dragger", "_draggedUnit"];
    
    if ( isNil {_dragger getVariable ["phx_revive_dragging",nil]} || {!alive _dragger} || {_dragger getVariable ["phx_revive_down",false]} || {!isNull objectParent _dragger} || {isNil "_draggedUnit"} ) then {
        // Remove PFH - No need to keep checking
        [_handle] call CBA_fnc_removePerFrameHandler;
    
        // Check to see if action was removed
        if (_dragger isEqualTo player) then {
            private _getReleaseIndex = _dragger getVariable ["phx_revive_releaseIndex",-1];
            if (_getReleaseIndex > -1) then {
                _dragger removeAction _getReleaseIndex;
                _dragger setVariable ["phx_revive_releaseIndex",-1];
                _dragger setVariable ["phx_revive_dragging",nil,true];
            };
        };
    
        if (isNull objectParent _dragger) then {
            // Dragger isn't in vehicle
            
            // Release unit
            detach _draggedUnit;
            _newPos = _dragger modelToWorld [0,2,0];
            _draggedUnit setPos _newPos;

            // If dragger didn't go down then play release animation on unit
            if (!(_dragger getVariable ["phx_revive_down",false])) then {
                _draggedUnit switchMove "AinjPpneMstpSnonWrflDb_release";
            };
        } else {
            // Dragger is in vehicle
            detach _draggedUnit;
            
            // If dragger didn't go down then play release animation on unit
            if (!(_dragger getVariable ["phx_revive_down",false])) then {
                _draggedUnit switchMove "AinjPpneMstpSnonWrflDb_release";
            };
        };
        
        // Wait 0.1 seconds for the releasing animation to finish
        [{
            params ["_dragger", "_draggedUnit"];
            
            // Set dragger as no longer busy so he can do other actions
            if (_dragger isEqualTo player) then {
                missionNamespace setVariable ["phx_revive_currentlyBusy",false];
            };
            
            _draggedUnit setVariable ["phx_revive_beingDragged",false,true];
            
            // Play animation depending upon if unit is down or not
            if (_draggedUnit getVariable ["phx_revive_down",false]) then {
                _draggedUnit switchMove "acts_InjuredLookingRifle02";
                _draggedUnit setDir ((getDir _draggedUnit) + 180);
            } else {
                _draggedUnit switchMove "amovppnemstpsraswrfldnon";
            };

            // Play animations if dragger isn't in a vehicle
            if (isNull objectParent _dragger) then {
                if (_dragger getVariable ["phx_revive_down",false]) then {
                    _dragger switchMove "acts_InjuredLookingRifle02";
                } else {
                    _dragger switchMove "";
                };
            };
        }, [_dragger, _draggedUnit], 0.1] call CBA_fnc_waitAndExecute;
    };
}, 0, [_dragger, _unit]] call CBA_fnc_addPerFrameHandler;
