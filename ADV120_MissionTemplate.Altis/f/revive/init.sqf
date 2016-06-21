// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) ExitWith {};

// add briefing
if (isNil "phx_revive_briefing") then {phx_revive_briefing = true;};
if (isNil "phx_revive_extraFAK") then {phx_revive_extraFAK = 0};

if (phx_revive_briefing) then {
    [] spawn {
        waitUntil {!isNull player};
        waitUntil {!isNil "PHX_Diary"};
        _bstr = format ["<br/>OVERVIEW<br/>
When a player is wounded to the point of being 'incapacitated' they become a casualty. Casualties are prone and unable to move.
<br/><br/>
TREATING CASUALTIES<br/>
Players equipped with at least 1 x FAK can treat a casualty by moving next to them and selecting the relevant action menu option. Treatment uses up 1 x FAK.
<br/><br/>
DRAGGING CASUALTIES<br/>
Players can drag a casualty by moving next to them and selecting the relevant action menu option. Whilst dragging, the player has an action menu option for releasing the casualty.
<br/><br/>
BLEEDING OUT<br/>
An incapacitated player only has a few minutes before her/his wounds become fatal and they die.
<br/><br/>
CREDITS<br/>
Based on the F3 framework's Simple Wounding System. Modified for Phalanx by robtherad."];
        player createDiaryRecord ["PHX_Diary", ["Revive Info",_bstr]];
    };
};

// lets wait a bit.
sleep 5;

// default variables.
player setVariable ["phx_revive_down",false];
player setVariable ["phx_revive_bleeding",false];
player setVariable ["phx_revive_blood",100]; // other player dont need know this
player setVariable ["phx_revive_dragging",nil];

// Lifeticker, manages bleeding and blood values.
player spawn phx_fnc_LifeTick;


// HandleHeal needs to be on the player you heal.
{
    _x setVariable ["phx_revive_down",false];
    _x setVariable ["phx_revive_bleeding",false];
    _x addEventHandler ["HandleHeal",{_this call phx_fnc_OnHeal}];
    
    // Drag Action.
    _addIndex = _x addAction [
        format ["<t color='#7f0000'>Drag %1</t>", 
        name _x],
        {[_this, "phx_fnc_OnDrag", [_this select 0,_this select 1],false] spawn BIS_fnc_MP;}, 
        nil, 
        6, 
        false, 
        true, 
        "", 
        "_var = _this getVariable ['phx_revive_dragging',nil];_target distance _this < 2 && isNil '_var' && _target getVariable['phx_revive_down',false] && !(_this getVariable ['phx_revive_down',false])"
    ];
} forEach playableUnits;

// defines the PP effects for the downed effect.
phx_revive_UncCC = ppEffectCreate ["ColorCorrections", 1603];
phx_revive_UncRadialBlur = ppEffectCreate ["RadialBlur", 280];
phx_revive_UncBlur = ppEffectCreate ["DynamicBlur", 180];
phx_revive_UncToggle = false;
phx_revive_damageValue = 1.1;

// Eventhandlers for the player.
player addEventHandler ["killed", {_this call phx_fnc_OnDeath}];
player addEventHandler ["HandleDamage",{_this call phx_fnc_OnDamage}];
