params ["_control", "_unused", "_xCord", "_yCord"];

private _pos = _control ctrlMapScreenToWorld [_xCord, _yCord];
if (f_cam_mapMode isEqualTo 2) then {
    if (f_cam_mode isEqualTo 0 || f_cam_mode isEqualTo 1) then {
        private _chosen = nil;
        private _dist = 99999;
        private _ents = _pos nearEntities [["CAManBase","AllVehicles"],10];
        
        {
            {
                if (_pos distance _x <= _dist && {_x in f_cam_listUnits}) then {
                    _chosen = _x;
                    _dist = _pos distance _x;
                };
                nil
            } count crew _x;
            nil
        } count _ents;
        
        if (!isNil "_chosen") then {
            f_cam_curTarget = _chosen;
            if (f_cam_toggleCamera) then {
              f_cam_curTarget switchCamera "INTERNAL";
            };

            // hide map
            f_cam_mapMode = 0;
            ctrlShow [2110,true];
            ctrlShow [2010,true];
            ctrlShow [1350,false];
            ctrlShow [1360,false];

            ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
        };
    };
    
    if (f_cam_mode isEqualTo 3) then {
        private _x = _pos select 0;
        private _y = _pos select 1;
        f_cam_freecamera setPosASL [_x,_y,((getposASL f_cam_freecamera) select 2 ) max ((getTerrainHeightASL [_x,_y])+1)];
        // hide map
        f_cam_mapMode = 0;
        ctrlShow [2110,true];
        ctrlShow [2010,true];
        ctrlShow [1350,false];
        ctrlShow [1360,false];
    };
};
true