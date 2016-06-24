// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_unit", "_dragger"];

_dragger setVariable ["phx_revive_dragging",_unit,true];

if (_dragger isEqualTo player) then {
    missionNamespace setVariable ["phx_revive_currentlyBusy",true];
};

// the dragger gets a release option.
if (local _dragger) then {
    _dragger addAction [
        format["<t color='#FF4040'>Release</t> %1",name _unit],
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
            diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","draggingRifle",_dragger];
        };
       case (secondaryWeapon _dragger): {
            _dragger switchMove "AcinPknlMstpSnonWnonDnon";
            diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","draggingLauncher",_dragger];
       };
    };
};
_unit switchMove "AinjPpneMrunSnonWnonDb";
diag_log format ["changedAnimation: _anim:%1 -- _unit:%2","dragged",_unit];

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
    
    diag_log format["OnDrag PFH: 1:%1 - 2:%2 - 3:%3 - 4:%4 - 5:%5",
        isNil {_dragger getVariable ["phx_revive_dragging",nil]}, 
        !alive _dragger, 
        _dragger getVariable ["phx_revive_down",false], 
        !isNull objectParent _dragger,
        isNil "_draggedUnit"
    ];
    
    if ( isNil {_dragger getVariable ["phx_revive_dragging",nil]} || {!alive _dragger} || {_dragger getVariable ["phx_revive_down",false]} || {!isNull objectParent _dragger} || {isNil "_draggedUnit"} ) then {
        diag_log "OnDrag PFH: Conditions passed!";
        
        // Remove PFH - No need to keep checking
        [_handle] call CBA_fnc_removePerFrameHandler;
    
        // Release unit
        _dragger setVariable ["phx_revive_dragging",nil,true];
        detach _draggedUnit;
        _newPos = _dragger modelToWorld [0,2,0];
        _draggedUnit setPos _newPos;

        // If dragger didn't go down then play release animation on unit
        if (!(_dragger getVariable ["phx_revive_down",false])) then {
            _draggedUnit switchMove "AinjPpneMstpSnonWrflDb_release";
            diag_log format ["changedAnimation: _anim:%1 -- _draggedUnit:%2","draggedRelease",_draggedUnit];
        };
        
        // Wait 0.1 seconds for the releasing animation to finish
        [{
            params ["_dragger", "_draggedUnit"];
            
            diag_log "OnDrag waitAndExecute: Waited. Executing.";
            
            // Set dragger as no longer busy so he can do other actions
            if (_dragger isEqualTo player) then {
                missionNamespace setVariable ["phx_revive_currentlyBusy",false];
            };

            // Play animation depending upon if unit is down or not
            if (_draggedUnit getVariable ["phx_revive_down",false]) then {
                _draggedUnit switchMove "acts_InjuredLookingRifle02";
                diag_log format ["changedAnimation: _anim:%1 -- _draggedUnit:%2","injuredNormalOnDrag",_draggedUnit];
                _draggedUnit setDir ((getDir _draggedUnit) + 180);
            } else {
                _draggedUnit switchMove "amovppnemstpsraswrfldnon";
                diag_log format ["changedAnimation: _anim:%1 -- _draggedUnit:%2","layonbackdrag??",_draggedUnit];
            };

            // Play animation depending upon if dragger does down or not
            if (_dragger getVariable ["phx_revive_down",false]) then {
                _dragger switchMove "acts_InjuredLookingRifle02";
                diag_log format ["changedAnimation: _anim:%1 -- _draggedUnit:%2","injuredNormalOnDrag2",_dragger];
            } else {
                _dragger switchMove "";
                diag_log format ["changedAnimation: _anim:%1 -- _draggedUnit:%2","emptyAnim",_dragger];
            };
        }, [_dragger, _draggedUnit], 0.1] call CBA_fnc_waitAndExecute;
    };
}, 0, [_dragger, _unit]] call CBA_fnc_addPerFrameHandler;
