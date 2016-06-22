// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// handles the woundeffect
[] spawn {
    while {alive player && {isNil "phx_isSpectator"}} do {
        _downed = player getVariable ["phx_revive_down",false];
        _bleeding = player getVariable ["phx_revive_bleeding",false];
        if (_downed || _bleeding) then {
            [] call phx_fnc_WoundedEffect;
        };
        sleep 2.5;
    };
};

// ticker for life, calculates death and blood.
while {alive player && {isNil "phx_isSpectator"}} do {
    // Fetch variables
    _downed = player getVariable ["phx_revive_down",false];
    _bleeding = player getVariable ["phx_revive_bleeding",false];
    _blood = player getVariable ["phx_revive_blood",100];
    _bleedRate = 0.833;
    if !(player getVariable ["phx_revive_bleedFast",true]) then {
        _bleedRate = 0.208;
    };
    
    if (_downed || _bleeding) then {
        // Blood Loss
        player setVariable ["phx_revive_blood",_blood - _bleedRate max 0];
        if (damage player < 0.26) then {player setDamage 0.26;}; // Make sure player can stop his own bleeding with a FAK
        if (getBleedingRemaining player <= 0) then {player setBleedingRemaining 10;}; // Make sure blood drips out of player
        
    } else {
        // Blood regen
        player setVariable ["phx_revive_blood",_blood + 0.1 min 100];
    };
    
    // Display warning if blood level is getting low
    if (_blood <= 10 && {_bleeding} && {!(player getVariable ["phx_revive_bloodLossWarning",false])} ) then {
        titleText ["You are feeling weak... Maybe you should stop your bleeding.", "PLAIN DOWN"];
        player setVariable ["phx_revive_bloodLossWarning",true];
    };
    
    // Reset blood loss warning
    if (!_bleeding && {_blood > 10} && {player getVariable ["phx_revive_bloodLossWarning",false]} ) then {
        
    };
    
    // Player bled out, RIP
    if (_blood <= 0) then {player setdamage 1;};
    sleep 1;
};
