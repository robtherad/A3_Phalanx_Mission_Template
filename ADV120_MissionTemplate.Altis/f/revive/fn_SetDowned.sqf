// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_unit", "_bool"];

// ====================================================================================
if (_bool && {alive _unit}) then {
    // Put the unit down
    
    // Check if they already down, don't down them again.
    if (_unit getVariable ["phx_revive_down",false]) exitWith {};
    
    // Reset downed player's damage
    _unit setDamage 0;
    
    // Add actions to downed unit
    if !(player isEqualTo _unit) then {
        // Slow Bleeding Action
        private _bleedIndex = _unit addAction [
            format["<t color='#FF4040'>Slow</t> %1's <t color='#FF4040'>bleeding</t>",name _unit],
            {_this remoteExec ["phx_fnc_OnSlowBleeding", [_this select 0, _this select 1]];},
            nil, 
            6, 
            false, 
            true, 
            "", 
            "((_this distance _target) < 2) && {!(_this getVariable ['phx_revive_down',false])} && {('FirstAidKit' in (items _this))} && {!('Medikit' in (items _this))} && {alive _target} && {!(missionNamespace getVariable ['phx_revive_currentlyBusy',false])} && {isNull objectParent _this} && {(_target getVariable ['phx_revive_bleedFast',true])}"
        ];
        _unit setVariable ["phx_revive_bleedIndex",_bleedIndex];
        
        // Revive Action
        private _reviveIndex = _unit addAction [
            format["<t color='#FF4040'>Revive</t> %1",name _unit],
            {_this spawn phx_fnc_OnRevive;},
            nil, 
            6, 
            false, 
            true, 
            "", 
            "((_this distance _target) < 2) && {!(_this getVariable ['phx_revive_down',false])} && {('Medikit' in (items _this))} && {alive _target} && {!(missionNamespace getVariable ['phx_revive_currentlyBusy',false])} && {isNull objectParent _this}"
        ];
        _unit setVariable ["phx_revive_reviveIndex",_reviveIndex];
        
        // Drag Action.
        private _dragIndex = _unit addAction [
            format ["<t color='#FF4040'>Drag</t> %1", name _unit],
            {_this remoteExec ["phx_fnc_OnDrag", [_this select 0, _this select 1]];}, 
            nil, 
            6, 
            false, 
            true, 
            "", 
            "((_target distance _this) < 2) && {isNil {_this getVariable ['phx_revive_dragging',nil]}} && {_target getVariable ['phx_revive_down',false]} && {!(_this getVariable ['phx_revive_down',false])} && {alive _target} && {!(missionNamespace getVariable ['phx_revive_currentlyBusy',false])} && {isNull objectParent _this}"
        ];
        _unit setVariable ["phx_revive_dragIndex",_dragIndex];
    };
    
    // Prevent AI from shooting downed players
    _unit setCaptive 1;
    
    // Update downed variable
    _unit setVariable ["phx_revive_down",true];
    if (local _unit && {_unit isEqualTo player}) then {
        missionNamespace setVariable ["phx_revive_down",true];
    };
    
    if (_unit isEqualTo player) then {
        // Make it so player can't be downed again if they die
        player setVariable ["phx_revive_respawnRevive",false,true];
        missionNamespace setVariable ["phx_revive_respawnRevive",false];
        
        // If the unit is local and a player, remove their magazines (otherwise they can throw grenades while down)
        private _magazineList = [];
        {
            _x params ["_name", "_ammoCount", "_state", "_type", "_location"];
            
            // Remove only grenades
            if (_type isEqualTo 0) then {
                _unit removeMagazine _x;
                _magazineList pushBack _x;
            };
            
        } forEach magazinesAmmoFull _unit;
        _unit setVariable ["phx_revive_down_mags",_magazineList];
        
        // Disable TFAR speech
        _unit setVariable ["tf_unable_to_use_radio", true, true];
        _unit setVariable ["tf_voiceVolume", 0.0, true];
        
        // Disable the action menu
        showHUD false;
        missionNamespace setVariable ["phx_revive_hiddenHud",true];
    };

    if !(isNull objectParent _unit) then {
        // If unit is in a vehicle, try to find a death animation
        private _animList = getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo");
        private _newAnim = "passenger_inside_2_Die";
        private _newAnimSelected = false;
        {
            if (_x isEqualType "") then {
                if (["die",toLower(_x)] call bis_fnc_inString) then {
                    _newAnim = _x;
                    _newAnimSelected = true;
                };
            };
            if (_newAnimSelected) exitWith {};
        } forEach _animList;
        if (isNil "_newAnim") then {_newAnim = ""};
        _unit switchMove _newAnim;
        
        // Make sure 'Pull Out' action only gets added once
        if !((vehicle _unit) getVariable ["phx_revive_ejectIndex",-1] >= 0) then {
            _pullIndex = (vehicle _unit) addAction [
                "<t color='#FF4040'>Pull out wounded</t>", 
                {_this remoteExec ["phx_fnc_EjectWounded", 0];}, 
                nil, 
                5, 
                false, 
                true, 
                "", 
                "((_target distance _this) < 5) && {[_target] call phx_fnc_HasWounded} && {!(missionNamespace getVariable ['phx_revive_currentlyBusy',false])} && {isNull objectParent _this}"
            ];
            (vehicle _unit) setVariable ["phx_revive_ejectIndex",_pullIndex];
        };
    } else {
        // Unit isn't in a vehicle, play regular death anim
        _unit switchMove "acts_InjuredLookingRifle02";
        _unit setDir ((getDir _unit) + 180);
    };
    
} else { 
    // Get the unit up
    // Unit is already not down, no need to run again
    if (!(_unit getVariable ["phx_revive_down",false])) exitWith {};

    // Update downed variables
    _unit setVariable ["phx_revive_down",false];
    if (_unit isEqualTo player) then {
        missionNamespace setVariable ["phx_revive_down",false];
    };
    
    // If the unit is not in a vehicle, play pretty animation otherwise just reset to their default animation
    if (isNull objectParent _unit) then {
        _unit switchMove "AinjPpneMstpSnonWnonDnon_rfolltofront";
    };
    
    // Make AI shoot again
    _unit setCaptive 0;
    
    // Remove actions
    private _dragIndex = _unit getVariable ["phx_revive_dragIndex",-1];
    if (_dragIndex >= 0) then {_unit removeAction _dragIndex};
    _unit setVariable ["phx_revive_dragIndex",-1];

    private _reviveIndex = _unit getVariable ["phx_revive_reviveIndex",-1];
    if (_reviveIndex >= 0) then {_unit removeAction _reviveIndex;};
    _unit setVariable ["phx_revive_reviveIndex",-1];

    private _bleedIndex = _unit getVariable ["phx_revive_bleedIndex",-1];
    if (_bleedIndex >= 0) then {_unit removeAction _bleedIndex;};
    _unit setVariable ["phx_revive_bleedIndex",-1];
    
    // Do extra stuff if player is unit
    if (_unit isEqualTo player) then {
        // Return taken magazines
        private _mags = _unit getVariable ["phx_revive_down_mags",magazines _unit];
        {
            _unit addMagazine _x;
        } forEach _mags;
        
        // Reset the respawn variables
        player setVariable ["phx_revive_respawnRevive",true,true];
        missionNamespace setVariable ["phx_revive_respawnRevive",true];
        
        // Re-enable TFAR speech
        player setVariable ["tf_unable_to_use_radio", false, true];
        player setVariable ["tf_voiceVolume", 1.0, true];
        
        // Re-enable HUD
        showHUD [true, true, true, true, true, true, false, true];
        missionNamespace setVariable ["phx_revive_hiddenHud",false];
        
        // Reset the PP
        phx_revive_UncToggle = true;
        [] spawn phx_fnc_WoundedEffect;
        sleep 0.1;
        
        // Force him into prone otherwise he can get stuck in the rolltofrontanimation.
        if (isNull objectParent _unit) then {
            _unit playMove "amovppnemstpsraswrfldnon";
        };
        _unit setDamage 0;
    };
};
