// F3 - Simple Wounding System -- Modified by robtherad
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

params ["_unit", "_selection", "_damage"];

if !(_unit isEqualTo player) exitWith {_damage};
private _totalDamage = damage _unit + _damage;
// diag_log format["[PHX] (revive) onDamage: _selection:%1 -- _damage:%2 -- _totalDamage:%3",_selection,_damage,_totalDamage];
if (_totalDamage >= 1 && {_damage > 0.1} && {!(missionNamespace getVariable ["phx_revive_down",false])} && {diag_frameNo > missionNamespace getVariable ["phx_revive_lastDamageFrameNo",0]} && {!(_selection isEqualTo "")}) then {
    // Set the frame number of the last significant damage that should have killed the player into a variable. This prevents multiple _instantKill dice rolls from happening from the same damage source, as long as all the damage is applied in one frame.
    missionNamespace setVariable ["phx_revive_lastDamageFrameNo",diag_frameNo];
    // diag_log format["[PHX] (revive) onDamage: Activated calculations."];
    
    // Determine if player should be instantly killed or not based on where he got shot
    private _instantKill = false;
    /*
    private _randomNumber = random 100;
    if (_damage > 0.2) then {
        diag_log format["[PHX] (revive) onDamage: _damage: %1 -- _selection: '%2'",_damage,_selection];
        switch (_selection) do {
            case "face_hub"; 
            case "head":    {if (_randomNumber > 10) then {_instantKill = true; diag_log format ["[PHX] (revive) onDamage: Headshot (>10) - Number: %1",_randomNumber];};}; // 90% chance of instant death
            case "arms":    {}; // 0% chance of instant death
            case "legs":    {}; // 0% chance of instant death
            case "body":    {if (_randomNumber > 95) then {_instantKill = true;}; diag_log format ["[PHX] (revive) onDamage: Body Shot (>95) - Number: %1",_randomNumber];}; // 5% chance of instant death
            case "spine1":  {}; // 0% chance of instant death
            case "spine2":  {}; // 0% chance of instant death
            case "spine3":  {}; // 0% chance of instant death
        };
    };
    diag_log format ["[PHX] (revive) onDamage: _instantKill: %1",_instantKill];
    */
    if (!_instantKill) then {
        // Player wasn't instantly killed
        if (!(missionNamespace getVariable ["phx_revive_down",false])) then {
            // Player isn't down
            if !(isNull objectParent _unit) then {
                // Player is in a vehicle, skip the ragdoll part and just set them as downed
                if (alive objectParent _unit) then {
                    // But only set them as downed if the vehicle is still alive
                    _damage = 0;
                    [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];
                    
                    // Stop player from dying from followup shots for a short period
                    _unit allowDamage false;
                    [{
                        params ["_unit"];
                        _unit allowDamage true;
                    }, [_unit], 1] call CBA_fnc_waitAndExecute;
                } else {
                    // If it's not, kill them permanently
                    _unit setVariable ["phx_revive_respawnRevive",false,true];
                    missionNamespace setVariable ["phx_revive_respawnRevive",false];
                    //diag_log format["[PHX] (revive) onDamage: Player is in a vehicle, but vehicle is dead. Permakilling player."];
                };
            } else {
                // Player is not in a vehicle, apply full damage and add a function to 
                [{
                    params ["_unit"];
                    //diag_log _unit;
                    isNull _unit
                }, {
                    params ["_unit"];
                    [_unit, true] remoteExec ["phx_fnc_SetDowned", 0];
                }, []] call CBA_fnc_waitUntilAndExecute;
            };
        } else {
            // Player's already down, shouldn't be reviveable again
            _unit setVariable ["phx_revive_respawnRevive",false,true];
            missionNamespace setVariable ["phx_revive_respawnRevive",false];
            //diag_log format["[PHX] (revive) onDamage: Player is already down. Permakilling player."];
        };
    } else {
        // Player got instantly killed, shouldn't be reviveable
        _unit setVariable ["phx_revive_respawnRevive",false,true];
        missionNamespace setVariable ["phx_revive_respawnRevive",false];
        //diag_log format["[PHX] (revive) onDamage: Player rolled an instant kill. Permakilling player."];
    };
};

if (isBleeding _unit && {!(missionNamespace getVariable ["phx_revive_bleeding",false])}) then {
    [_unit, true, true] remoteExec ["phx_fnc_SetBleeding", 0];
};
_damage
