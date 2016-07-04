// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) ExitWith {};

// add briefing
if (isNil "phx_revive_briefing") then {phx_revive_briefing = true;};
if (isNil "phx_revive_extraFAK") then {phx_revive_extraFAK = 0};

if (phx_revive_briefing) then {
    [] spawn {
        waitUntil {!isNil "PHX_Diary"};
        _bstr = format ["
OVERVIEW<br/>
    After a player takes a enough damage to be killed they will be placed into an downed state. Downed players cannot move or use their radios but they can still use local voice to call for help.<br/><br/>
TREATMENT<br/>
    Players with a Medikit in their inventory can revive downed players and bring them back into action. Player's with at least one First Aid Kit in their inventory can slow the rate of blood loss on a downed player, giving more time for a medic to arrive and revive them. In doing this, the First Aid Kit is consumed.<br/><br/>
    Both actions have their own action separate from the BI treatment system. The revive action will display as 'Revive [player]' and the other will display as 'Slow [player]'s Bleeding'. If an action fails, a reason should be displayed towards the bottom-center of your screen.<br/><br/>
BLEEDING OUT<br/>
    A downed player only has a few minutes before their wounds become fatal. Without any intervention, a downed player can survive for up to 2 minutes. If another player uses a First Aid Kit on a downed player, the downed player's rate of blood loss will slow, allowing the downed player to survive for up to 8 minutes. A downed player's ability to survive for longer periods of time while bleeding out depends on how long, and how recently, they were previously wounded. A fresh downed player should survive for the full duration, but a player who becomes a downed player multiple times within a short time period will have a shorter window for getting treatment each time they go down.<br/><br/>
    Once a downed player has about 30 seconds of life left they will recieve a notification in the bottom-center of their screen telling them that they feel weak.<br/><br/>
DRAGGING CASUALTIES<br/>
    Players can drag a downed player by moving next to them and selecting the relevant action menu option. Whilst dragging, the player has an action menu option for releasing the downed player.<br/><br/>
CREDITS<br/>
    Based on the F3 Mission Framework's Simple Wounding System. Modified for Phalanx by robtherad.
"];
        player createDiaryRecord ["PHX_Diary", ["Revive Info",_bstr]];
    };
};

// Initialize variables
player setVariable ["phx_revive_down",false];
phx_revive_down = false;
player setVariable ["phx_revive_bleeding",false];
phx_revive_bleeding = false;
player setVariable ["phx_revive_bleedFast",true];
phx_revive_bleedFast = true;
phx_revive_blood = 100;
player setVariable ["phx_revive_dragging",nil];
player setVariable ["phx_revive_respawnRevive",true,true];
phx_revive_respawnRevive = true;
// diag_log format["[PHX] (revive) init: Disallowing permakill."];

// Lifeticker, manages bleeding and blood values.
[] spawn phx_fnc_LifeTick;

{
    _x setVariable ["phx_revive_down",false];
    _x setVariable ["phx_revive_bleedFast",true];
    _x setVariable ["phx_revive_bleeding",false];
} forEach playableUnits;

// defines the PP effects for the downed effect.
phx_revive_UncCC = ppEffectCreate ["ColorCorrections", 1603];
phx_revive_UncRadialBlur = ppEffectCreate ["RadialBlur", 280];
phx_revive_UncBlur = ppEffectCreate ["DynamicBlur", 180];
phx_revive_UncToggle = false;
phx_revive_damageValue = 1.1;

// Eventhandlers for the player.
player addEventHandler ["HandleDamage",{_this call phx_fnc_OnDamage}];
player addEventHandler ["InventoryClosed",{
    if (alive player && !(missionNamespace getVariable ["phx_revive_isPlayerDead",false])) then {
        missionNamespace setVariable ["phx_revive_loadout", getUnitLoadout player]; // So we can get the linkeditems back
        [player, [missionNamespace, "phx_revive_lastLoadout"]] call BIS_fnc_saveInventory; // For everything else
        missionNamespace setVariable ["phx_revive_lastSavedLoadoutTime",diag_tickTime]; // Update value for last time the loadout was saved
    };
}];
player addEventHandler ["InventoryOpened",{
    if (alive player && !(missionNamespace getVariable ["phx_revive_isPlayerDead",false])) then {
        missionNamespace setVariable ["phx_revive_loadout", getUnitLoadout player]; // So we can get the linkeditems back
        [player, [missionNamespace, "phx_revive_lastLoadout"]] call BIS_fnc_saveInventory; // For everything else
        missionNamespace setVariable ["phx_revive_lastSavedLoadoutTime",diag_tickTime]; // Update value for last time the loadout was saved
    };
}];

// Add a PFH to make sure the saved loadout is never more than ~30 seconds out of date
[] spawn {
    waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};
    [{
        params ["_args", "_handle"];
        
        if (isNil "phx_isSpectator") then {
            if ( ((diag_tickTime-4.9) > missionNamespace getVariable ["phx_revive_lastSavedLoadoutTime",0]) && {!(missionNamespace getVariable ["phx_revive_down",false])} && {alive player} && {!(missionNamespace getVariable ["phx_revive_isPlayerDead",false])}) then {
                missionNamespace setVariable ["phx_revive_loadout", getUnitLoadout player]; // So we can get the linkeditems back
                [player, [missionNamespace, "phx_revive_lastLoadout"]] call BIS_fnc_saveInventory; // For everything else
                missionNamespace setVariable ["phx_revive_lastSavedLoadoutTime",diag_tickTime]; // Update value for last time the loadout was saved
            };
        } else {
            [_handle] call CBA_fnc_removePerFrameHandler; // Player is spectator, no need for loadouts to be saved anymore
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
};