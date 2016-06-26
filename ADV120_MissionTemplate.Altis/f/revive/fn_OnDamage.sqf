// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_unit", "_selection", "_damage"];

if !(_unit isEqualTo player) exitWith {_damage};

private _totalDamage = damage _unit + _damage;
if (_totalDamage >= 1 && {_damage > 0.1} && {!(missionNamespace getVariable ["phx_revive_down",false])} && {diag_frameNo > missionNamespace getVariable ["phx_revive_lastDamageFrameNo",0]} && {!(_selection isEqualTo "")}) then {
    // Set the frame number of the last significant damage that should have killed the player into a variable. This prevents multiple _instantKill dice rolls from happening from the same damage source, as long as all the damage is applied in one frame.
    missionNamespace setVariable ["phx_revive_lastDamageFrameNo",diag_frameNo];
    
    // Determine if player should be instantly killed or not based on where he got shot
    private _instantKill = false;
    private _randomNumber = random 100;
    if (_damage > 0.2) then {
        diag_log format["phx_revive_OnDamage: _damage: %1 -- _selection: '%2'",_damage,_selection];
        switch (_selection) do {
            case "face_hub"; 
            case "head":    {if (_randomNumber > 10) then {_instantKill = true; diag_log format ["phx_revive_OnDamage: Headshot (>10) - Number: %1",_randomNumber];};}; // 90% chance of instant death
            case "arms":    {}; // 0% chance of instant death
            case "legs":    {}; // 0% chance of instant death
            case "body":    {if (_randomNumber > 95) then {_instantKill = true;}; diag_log format ["phx_revive_OnDamage: Body Shot (>95) - Number: %1",_randomNumber];}; // 5% chance of instant death
            case "spine1":  {}; // 0% chance of instant death
            case "spine2":  {}; // 0% chance of instant death
            case "spine3":  {}; // 0% chance of instant death
        };
    };
    diag_log format ["phx_revive_OnDamage: _instantKill: %1",_instantKill];
    if (!_instantKill) then {
        // Player wasn't instantly killed
        if (!(missionNamespace getVariable ["phx_revive_down",false])) then {
            // Player isn't down
            if !(isNull objectParent _unit) then {
                // Player is in a vehicle, skip the ragdoll part and just set them as downed
                _damage = 0;
                [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];
                
                // Stop player from dying from followup shots for a short period
                [_unit] spawn {
                    params ["_unit"];
                    _unit allowDamage false;
                    sleep 1;
                    _unit allowDamage true;
                };
            } else {
                // Player is not in a vehicle, apply full damage and add a function to 
                [_unit] spawn {
                    params ["_unit"];
                    waitUntil {isNull _unit}; // Wait for body to get deleted after player respawns
                    [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];
                };
            };
        } else {
            // Player's already down, shouldn't be reviveable again
            _unit setVariable ["phx_revive_respawnRevive",false,true];
            missionNamespace setVariable ["phx_revive_respawnRevive",false];
        };
    } else {
        // Player got instantly killed, shouldn't be reviveable
        _unit setVariable ["phx_revive_respawnRevive",false,true];
        missionNamespace setVariable ["phx_revive_respawnRevive",false];
    };
};

if (isBleeding _unit && {!(missionNamespace getVariable ["phx_revive_bleeding",false])}) then {
    [_unit, true, true] remoteExec ["phx_fnc_SetBleeding", 0];
};
_damage
