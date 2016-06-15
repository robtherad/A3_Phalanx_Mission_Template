params [
    ["_jipPlayer", objNull, [objNull]], 
    ["_spectList", [], [[]]]
];

diag_log format["PHX fn_disableCJIP: _this:%1",_this];

if (isNull _jipPlayer) exitWith {};
if (count _spectList isEqualTo 0) exitWith {};

{
    if ((local _x) || (local _jipPlayer)) then {
        _jipPlayer disableCollisionWith _x;
    };
} forEach _spectList;

diag_log format["PHX fn_disableCJIP: _this:%1",_this];