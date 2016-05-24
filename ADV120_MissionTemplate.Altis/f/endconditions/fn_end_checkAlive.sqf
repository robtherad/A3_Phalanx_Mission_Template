#include "settings.sqf";

_sideArray = [0,0,0];
if (_bluforEliminatedMessage) then {
    _aliveB = {side _x == west} count allUnits;
    if (_aliveB == 0) then {_sideArray set [0,1];} else {_sideArray set [0,0];};
};
if (_redforEliminatedMessage) then {
    _aliveR = {side _x == east} count allUnits;
    if (_aliveR == 0) then {_sideArray set [1,1];} else {_sideArray set [1,0];};
};
if (_greenforEliminatedMessage) then {
    _aliveG = {side _x == independent} count allUnits;
    if (_aliveG == 0) then {_sideArray set [2,1];} else {_sideArray set [2,0];};
};

_hintStr = "";
_fill = " have been eliminated.\n";
switch _sideArray do {
    case [0,0,0]: { _hintStr = ""; };
    case [0,1,0]: { _hintStr = "OPFOR" + _fill; };
    case [0,0,1]: { _hintStr = "INDFOR" + _fill; };
    case [0,1,1]: { _hintStr = "OPFOR" + _fill + "INDFOR" + _fill; };
    case [1,0,0]: { _hintStr = "BLUFOR" + _fill; };
    case [1,1,0]: { _hintStr = "BLUFOR" + _fill + "OPFOR" + _fill; };
    case [1,0,1]: { _hintStr = "BLUFOR" + _fill + "INDFOR" + _fill; };
    case [1,1,1]: { _hintStr = "BLUFOR" + _fill + "OPFOR" + _fill + "INDFOR" + _fill; };
};
if !(_sideArray isEqualTo [0,0,0]) then {
    _hintStr remoteExecCall ["hint", 0,true];
};
