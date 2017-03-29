private ["_nextLoc","_nextType","_locSize","_locPos","_typeName","_objPos","_3dObjPos","_objTriggerArea","_objHold","_objMarker"];
_nextLoc  = _this select 0;
_nextType = _this select 1;
_locSize  = _nextLoc select 1;
_locPos   = _nextLoc select 2;
_locDir   = _nextLoc select 3;
_typeName = _nextType select 0;

// Randomizing objPos
//_objAreaMarker = "objAreaMarker";
//_objAreaMarker setMarkerPos _locPos;
//_objAreaMarker setMarkerSize [(_locSize select 0)*0.1, (_locSize select 1)*0.1];
//_objAreaMarker setMarkerDir _locDir;
//_objPos = [_objAreaMarker, false] call CBA_fnc_randPosArea;
_objPos = _locPos;
_3dObjPos = [_objPos select 0, _objPos select 1, 0];
_objTriggerArea = [sizeOfObjHold, sizeOfObjHold, 0, false];

phx_sector_1 setPos _3dObjPos;
phx_sector_1 setTriggerArea _objTriggerArea;

/*
switch (_typeName) do {
    case "Hold": {
        objBlue setPos _3dObjPos;
        objBlue setTriggerArea _objTriggerArea;
        objBlueSeize setPos _3dObjPos;
        objBlueSeize setTriggerArea _objTriggerArea;

        objRed setPos _3dObjPos;
        objRed setTriggerArea _objTriggerArea;
        objRedSeize setPos _3dObjPos;
        objRedSeize setTriggerArea _objTriggerArea;

        objGreen setPos _3dObjPos;
        objGreen setTriggerArea _objTriggerArea;
        objGreenSeize setPos _3dObjPos;
        objGreenSeize setTriggerArea _objTriggerArea;

        objPurple setPos _3dObjPos;
        objPurple setTriggerArea _objTriggerArea;
        objPurpleSeize setPos _3dObjPos;
        objPurpleSeize setTriggerArea _objTriggerArea;

        objNumber = objNumber + 1;
        _objHold = "objHold";
        _objHold setMarkerPos _objPos;
        _objHold setMarkerShape "ELLIPSE";
        _objHold setMarkerSize [sizeOfObjHold, sizeOfObjHold];
        _objHold setMarkerBrush "SolidBorder";
        _objHold setMarkerColor "ColorUNKNOWN";

        _colorSeize = ["blueSeize", "redSeize", "greenSeize", "purpleSeize"];
        {
            _x setMarkerPos _objPos;
            _x setMarkerSize [sizeOfObjHold, sizeOfObjHold];
            _x setMarkerAlpha 0;
            false
        } count (_colorSeize);
    };
};

_objMarker = "objMarker";
_objMarker setMarkerPos _objPos;
_objMarker setMarkerText _typeName;
*/

_locName = _nextLoc select 0;
currentLoc = _nextLoc;
