// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================

// This script will automatically generate an ORBAT page.

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots","_side","_freq","_chNum","_chArray","_color"];
_side = side group player;
_orbatText = "<br />NOTE: The ORBAT below is only accurate at mission start.<br />
<br />
<font size='18'>GROUP LEADERS + MEDICS</font><br /><br />";
_groups = [];

waitUntil { !isNil "phx_playerBaseChannel"; };

{
    // Add to ORBAT if side matches, group isn't already listed, and group has players
    if ((side _x == _side) && !(_x in _groups) && ({_x in (switchableUnits + playableUnits)} count units _x) > 0) then {
        _groups pushBack _x;
    };
} forEach allGroups;


// Loop through the group, print out group ID, leader name and medics if present
{
    // Don't apply leading line breaks to first group.
    if (_forEachIndex != 0) then {
        switch (_x getVariable ["phx_gps_groupSize",0]) do {
            case 0: {_orbatText = _orbatText + "  ~ "};
            case 1: {_orbatText = _orbatText + "<br /> "};
            case 2: {_orbatText = _orbatText + "<br /><br />"};
            case 3: {_orbatText = _orbatText + "<br /><br /><br />"};
        };
    };
    
    // Highlight the player's group with a different color (based on the player's side)
    _color = "#FFFFFF";
    if (_x == group player) then {
        _color = switch (side player) do {
             case west: {"#0080FF"};
             case east: {"#B40404"};
             case independent: {"#298A08"};
             default {"#8904B1"};
         };
    };
    
    // Get group's radio frequency
    _freq = _x getVariable ["phx_radioSettings",nil];
    if (isNil "_freq") then {
        _freq = "UNK";
    } else {
        _chNum = _freq select 0;
        _chNum = _chNum - 2; //Minus one since array starts at 0
        _chArray = _freq select 2;
        if (_chNum < 0) then {
            if (_chNum == -1) then {
                _freq = 0;
            };
        } else {
            _freq = _chArray select _chNum; //Get group's main channel from freq list
            if (isNil "_freq") then { //Check if frequency is out of range.
                _freq = "UNK";
                _str = format["[setGroupIDs] No radio freq found for group - '%1'",groupID _x];
                systemChat _str;
            };
        };
        if (!(_freq isEqualTo "UNK")) then {
            _freq = _freq + phx_playerBaseChannel;
        };
    };
    
    // Add group to the ORBAT
    _longName = _x getVariable ["phx_LongName",groupID _x];
    if (isNil "_freq") then {
        _orbatText = _orbatText + format ["<font color='%3'>(%4 men) <b>%1</b> -- %2</font>", _longName, name leader _x,_color,count (units _x)] + "<br />";
    } else {
        _orbatText = _orbatText + format ["<font color='%3'>(%4 men) <b>%5 MHz -- %1</b> -- %2</font>", _longName, name leader _x,_color,count (units _x),_freq] + "<br />";
    };
    
    // List medics too.
    {
        if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "attendant") == 1 && {_x != leader group _x}) then {
            _orbatText = _orbatText + format["      [M] %1",name _x] + "<br />";
        };
    } forEach units _x;
} forEach _groups;

waitUntil {!isNil "PHX_Diary"};
// Insert final result into subsection ORBAT of section Notes
player createDiaryRecord ["PHX_Diary", ["ORBAT", _orbatText]];
phx_writtenORBAT = true;
