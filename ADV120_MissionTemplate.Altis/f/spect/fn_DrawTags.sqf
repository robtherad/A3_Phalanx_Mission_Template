// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if (!f_cam_toggleTags || f_cam_mapMode isEqualTo 2 ) exitWith{};

{
    private _drawUnits = [];
    private _drawGroup = false;
    private _isPlayerGroup = false;
    {
        private _distToCam = (call f_cam_GetCurrentCam) distance _x;
        private _isSpectator = _x getVariable ["phx_isUnitSpectator",false];
        if ( (isPlayer _x) && {!_isSpectator} ) then {_isPlayerGroup = true};
        if ( (_distToCam < 200) && {!_isSpectator} ) then {
            _drawUnits pushBack _x;
        } else {
            if ( ((leader _x) isEqualTo _x) && {!_isSpectator}) then {
                _drawGroup = true;
            };
        };
        nil
    } count (units _x);
    private _color = switch (side _x) do {
        case blufor: {f_cam_blufor_color};
        case opfor: {f_cam_opfor_color};
        case independent: {f_cam_indep_color};
        case civilian: {f_cam_civ_color};
        default {f_cam_empty_color};
    };
    if (_drawGroup) then {
        private _visPos = getPosATLVisual leader _x;
        if (surfaceIsWater _visPos) then {_visPos = getPosASLVisual leader _x;};
        if (_isPlayerGroup) then {
            _color set [3,0.7];
        } else {
            _color set [3,0.4];
        };
        private _str = _x getVariable ["f_cam_nicename",""];
        if (_str isEqualTo "") then {
            _str = (toString(toArray(_x getVariable ["phx_LongName",(groupID _x)]) - [45]));
            _x setVariable ["f_cam_nicename",_str];
        };
        drawIcon3D ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color, [_visPos select 0, _visPos select 1, (_visPos select 2)+30], 1, 1, 0, _str, 2, 0.025, "TahomaB"];
    };
    
    {
        if ( ((isNull objectParent _x) && (alive _x)) || (!(isNull objectParent _x) && (((crew vehicle _x) select 0) isEqualTo _x) && (alive _x)) ) then {
            private _visPos = getPosATLVisual _x;
            if (surfaceIsWater _visPos) then {_visPos = getPosASLVisual _x;};
            private _icon = "\A3\ui_f\data\map\markers\military\dot_CA.paa";
            _color set [3,0.9];
            private _iconSize = .7;
            if (_x getVariable ["ACE_isUnconscious",false]) then {
                _icon = "\a3\ui_f_exp_a\Data\Displays\RscDisplayEGSpectator\reviveicon_ca.paa";
                _color set [3,0.4];
                _iconSize = 2;
            };
            private _str = "";
            if (isPlayer _x) then {
                _str = name _x;
            };
            drawIcon3D [_icon, _color, [_visPos select 0, _visPos select 1, (_visPos select 2)+3], _iconSize, _iconSize, 0, _str, 2, f_cam_tagTextSize, "TahomaB"];
        };
        nil
    } count _drawUnits;
    nil
} count allGroups;
