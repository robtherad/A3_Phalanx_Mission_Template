// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// gets all the player groups and filter out the AI.
private _players = [];
private _ai = [];
{
    private _isPlayerGroup = false;
    private _aiUnitCount = 0;
    if (isNil "f_cam_side" || {side _x isEqualTo f_cam_side}) then {
        {
            if (_isPlayerGroup) exitWith {};
            if (_x getVariable ["phx_isUnitSpectator",false] && {alive _x}) then {
                if (isPlayer _x) then {
                    _isPlayerGroup = true;
                } else {
                    _aiUnitCount = _aiUnitCount + 1;
                };
            };
            nil
        } count (units _x);
        
        if (_isPlayerGroup) then {
            _players pushBack _x;
        } else {
            if (_aiUnitCount > 0) then {
                _ai pushBack _x;
            };
        };
    };
    nil
} count allGroups;
[_players,_ai]
