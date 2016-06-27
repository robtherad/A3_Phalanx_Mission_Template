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
        _bstr = format ["OVERVIEW<br/>
    When a player is wounded to the point of being 'incapacitated' they become a casualty. Casualties are prone and unable to move or speak. Certain wounds such as headshots have a high chance of instantly killing a player instead of causing them to become a casualty.
<br/><br/>
TREATING CASUALTIES<br/>
    Players can use a First Aid Kit on a casualty to slow their rate of blood loss, consuming the First Aid Kit in the process. Players equipped with a Medikit can revive a casualty by moving close to the casualty and using the revive action.
<br/><br/>
BLEEDING OUT<br/>
    A casualty only has a few minutes before their wounds become fatal. Without any intervention, a casualty can survive for up to 2 minutes. If a player uses a First Aid Kit on a casualty, the casualty's rate of blood loss will slow, allowing the casualty to survive for up to 8 minutes. A casualty's ability to survive for longer periods of time while bleeding out depends on how long, and how recently, they were previously wounded. A fresh casualty should survive for the full duration, but a player who becomes a casualty multiple times within a short time period will have a shorter window for getting treatment each time they go down.
<br/><br/>
DRAGGING CASUALTIES<br/>
    Players can drag a casualty by moving next to them and selecting the relevant action menu option. Whilst dragging, the player has an action menu option for releasing the casualty.
<br/><br/>
CREDITS<br/>
    Based on the F3 Mission Framework's Simple Wounding System. Modified for Phalanx by robtherad."];
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
    if (alive player) then {
        missionNamespace setVariable ["phx_revive_loadout", getUnitLoadout player]; // So we can get the linkeditems back
        [player, [missionNamespace, "phx_revive_lastLoadout"]] call BIS_fnc_saveInventory; // For everything else
        missionNamespace setVariable ["phx_revive_lastSavedLoadoutTime",diag_tickTime]; // Update value for last time the loadout was saved
    };
}];
player addEventHandler ["InventoryOpened",{
    if (alive player) then {
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
            if ( ((diag_tickTime-4.9) > missionNamespace getVariable ["phx_revive_lastSavedLoadoutTime",0]) && {!(missionNamespace getVariable ["phx_revive_down",false])} && {alive player}) then {
                missionNamespace setVariable ["phx_revive_loadout", getUnitLoadout player]; // So we can get the linkeditems back
                [player, [missionNamespace, "phx_revive_lastLoadout"]] call BIS_fnc_saveInventory; // For everything else
                missionNamespace setVariable ["phx_revive_lastSavedLoadoutTime",diag_tickTime]; // Update value for last time the loadout was saved
            };
        } else {
            [_handle] call CBA_fnc_removePerFrameHandler; // Player is spectator, no need for loadouts to be saved anymore
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
};