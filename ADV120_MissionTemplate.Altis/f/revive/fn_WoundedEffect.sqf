// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// I don't know how this works but it does ;)
if (!hasInterface) exitWith {};

_damage = phx_revive_damageValue;
if (!phx_revive_UncToggle) then {
    phx_revive_UncCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0.001 max (1 min ((0.05/(_damage-0.8))-0.25))],[0.17, 0.0008, 0.0008, 1],[1, 1, 1, 0]];
    phx_revive_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[0.17, 0.0008, 0.0008, 0.218 max (1 min ((0.03/(_damage-0.819))+0.05))],[1, 1, 1, 0]];
    phx_revive_UncCC ppEffectEnable TRUE;
    phx_revive_UncCC ppEffectForceInNVG TRUE;
    phx_revive_UncCC ppEffectCommit 2.5;
    phx_revive_UncBlur ppEffectAdjust [0.5];
    phx_revive_UncBlur ppEffectEnable TRUE;
    phx_revive_UncBlur ppEffectCommit 0;

    phx_revive_UncCC ppEffectAdjust [1,1,0,[0.15, 0.0, 0.0, (3.33*_damage)-2.83], [1.0, 0.5, 0.5, 1-((3.33*_damage)-2.83)], [0.587, 0.199, 0.114, 0.0]];
    phx_revive_UncCC ppEffectEnable TRUE;
    phx_revive_UncCC ppEffectForceInNVG TRUE;
    phx_revive_UncCC ppEffectCommit 2.5;

    phx_revive_UncBlur ppEffectAdjust [0.8];
    phx_revive_UncBlur ppEffectEnable TRUE;
    phx_revive_UncBlur ppEffectCommit 0;
    phx_revive_UncToggle = true;
} else {
    phx_revive_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0]];
    phx_revive_UncCC ppEffectCommit 3.5; //2.5

    phx_revive_UncRadialBlur ppEffectAdjust [0.0, 0.0, 0.5, 0.5];
    phx_revive_UncRadialBlur ppEffectCommit 2.5;  //2.5

    phx_revive_UncBlur ppEffectAdjust [0];
    phx_revive_UncBlur ppEffectCommit 2.5;  //2.5
    //sleep 3.5;
    phx_revive_UncBlur ppEffectEnable FALSE;
    phx_revive_UncToggle = false;
};
