// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

// handles the woundeffect
[{
    params ["_args", "_handle"];
    
    if (isNil "phx_isSpectator") then {
        _downed = missionNamespace getVariable ["phx_revive_down",false];
        _bleeding = missionNamespace getVariable ["phx_revive_bleeding",false];
        if (_downed || _bleeding) then {
            [] call phx_fnc_WoundedEffect;
        };
    } else {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 2.5, []] call CBA_fnc_addPerFrameHandler;

// ticker for life, calculates death and blood.
[{
    params ["_args", "_handle"];
    
    if (isNil "phx_isSpectator") then {
        if (alive player) then {
            // Fetch variables
            _downed = missionNamespace getVariable ["phx_revive_down",false];
            _bleeding = missionNamespace getVariable ["phx_revive_bleeding",false];
            _blood = missionNamespace getVariable ["phx_revive_blood",100];
            _bleedRate = 0.833;
            if !(player getVariable ["phx_revive_bleedFast",true]) then {
                _bleedRate = 0.208;
            };
            
            if (_downed || _bleeding) then {
                // Blood Loss
                missionNamespace setVariable ["phx_revive_blood",_blood - _bleedRate max 0];
                if (damage player < 0.26) then {player setDamage 0.26;}; // Make sure player can stop his own bleeding with a FAK
                if (getBleedingRemaining player <= 0) then {player setBleedingRemaining 10;}; // Make sure blood drips out of player
                
            } else {
                // Blood regen
                missionNamespace setVariable ["phx_revive_blood",_blood + 0.1 min 100];
            };
            
            // ----------------------------------------------------------------------------------------------------
            // Bleed out warnings
            if (_blood/_bleedRate <= 35 && {_bleeding} && {!(player getVariable ["phx_revive_bloodLossWarning",false])} ) then {
                titleText ["You feel extremely weak.", "PLAIN DOWN"];
                player setVariable ["phx_revive_bloodLossWarning",true];
            };
            
            // Reset blood loss warning
            if (!_bleeding && {_blood > 10} && {player getVariable ["phx_revive_bloodLossWarning",false]} ) then {
                titleText ["You start to feel a bit better.", "PLAIN DOWN"];
                player setVariable ["phx_revive_bloodLossWarning",false];
            };
            // ----------------------------------------------------------------------------------------------------
            
            // Player bled out, RIP, no revive
            if (_blood <= 0) then {
                player setVariable ["phx_revive_respawnRevive",false,true];
                missionNamespace setVariable ["phx_revive_respawnRevive",false];
                //diag_log format["[PHX] (revive) lifeTick: Player bled out. Permakilling player."];
                titleText ["You have bled out.", "PLAIN DOWN"];
                player setdamage 1;
            };
        };
    } else {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
