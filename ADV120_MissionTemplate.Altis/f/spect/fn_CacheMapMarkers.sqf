f_cam_cachedMarkers = [];
private _rectangles = [];
private _ellipses = [];
private _icons = [];

_fnc_convertColorToRGB = {
    params ["_color", "_alpha"];

    private _colorArray = [
        // String, RGBA
        "colorblack", [0,0,0,1],
        "colorblue", [0,0,1,1],
        "colorgreen", [0,1,0,1],
        "colorgrey", [0.5,0.5,0.5,1],
        "colorkhaki", [0.9375,0.8984,0.5468,1],
        "colororange", [1,0.6445,0,1],
        "colorpink", [1,0.75,0.7929,1],
        "colorred", [1,0,0,1],
        "colorwhite", [1,1,1,1],
        "coloryellow", [1,1,0,1],
        "colorbrown", [0.6445,0.1640,0.1640,1],
        "default", [0,0,0,1],
        
        "colorblufor", [],
        "colorwest", [],
        "colorciv", [],
        "colorcivilian", [],
        "coloreast", [],
        "coloropfor", [],
        "colorindependent", [],
        "colorguer", [],
        "colorunknown", [],
    ];
    
    private _return = [0,0,0,1]; // default to Black
    
    private _foundIndex = _colorArray find toLower(_color);
    if (_foundIndex > -1) then {
        _return = _colorArray select (_foundIndex + 1);
    };
    
    _return
};

{
    // Determine if marker was placed in editor or during mission
    private _index = [_x, "USER_DEFINED"] call CBA_fnc_find;
    if (_index > -1) exitWith {}; // Found first non-editor marker, the rest are also non-editor markers
    
    // Collect all info necessary to draw an icon for the marker and push it back into the array
    // Determine if it's a line or icon
    switch (toUpper(markerShape _x)) do {
        case "RECTANGLE": {
            // - drawRectangle
            // center
            // sizeA
            // sizeB
            // angle
            // color
            // fill
            private _center = getMarkerPos _x;
            private _size = getMarkerSize _x;
            private _angle = markerDir _x;
            private _color = getMarkerColor _x;
            private _alpha = markerAlpha _x;
            _color = [_color, _alpha] call _fnc_convertColorToRGB;
        };
        case "ELLIPSE": {
            // - drawEllipse
            // center
            // sizeA
            // sizeB
            // angle
            // color
            // fill
            private _center = getMarkerPos _x;
            private _size = getMarkerSize _x;
            private _angle = markerDir _x;
            private _color = getMarkerColor _x;
            private _alpha = markerAlpha _x;
            _color = [_color, _alpha] call _fnc_convertColorToRGB;
        };
        case "ICON": {
            // - drawIcon
            // texture
            // color
            // pos
            // width
            // height
            // angle
            // text
            
            private _color = getMarkerColor _x;
            private _alpha = markerAlpha _x;
            _color = [_color, _alpha] call _fnc_convertColorToRGB;
        };
    };
    
    nil
} count allMapMarkers;

if (count _rectangles > 0) then {
    f_cam_cachedMarkers pushBack _rectangles;
};

if (count _ellipses > 0) then {
    f_cam_cachedMarkers pushBack _ellipses;
};

if (count _icons > 0) then {
    f_cam_cachedMarkers pushBack _icons;
};
