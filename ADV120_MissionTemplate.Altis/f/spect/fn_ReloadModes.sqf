private _listBox = 2101;
private _curIndex = lbCurSel _listBox;
lbClear _listBox;
// Normal
if (!f_cam_tiWHOn && {!f_cam_tiBHOn} && {!f_cam_nvOn}) then {
    f_cam_lb_toggleNormal = lbAdd [_listBox,"[Normal]"];
} else {
    f_cam_lb_toggleNormal = lbAdd [_listBox,"Normal"]
};
// NV
if (f_cam_nvOn) then {
    f_cam_lb_toggletiNVIndex = lbAdd[_listBox,"[NV]"];
} else {
    f_cam_lb_toggletiNVIndex = lbAdd[_listBox,"NV"];
};

// Blackhot
if (f_cam_tiBHOn) then {
    f_cam_lb_toggletiBHIndex = lbAdd[_listBox,"[TI - Blackhot]"];
} else {
    f_cam_lb_toggletiBHIndex = lbAdd[_listBox,"TI - Blackhot"];
};

// Whitehot
if (f_cam_tiWHOn) then {
    f_cam_lb_toggletiWHIndex = lbAdd[_listBox,"[TI - Whitehot]"];
} else {
    f_cam_lb_toggletiWHIndex = lbAdd[_listBox,"TI - Whitehot"];
};

