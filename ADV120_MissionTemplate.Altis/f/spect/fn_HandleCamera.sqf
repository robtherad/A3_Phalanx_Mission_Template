f_cam_mouseCord params ["_x", "_y"];
f_cam_MouseButton params ["_leftMB", "_rightMB"];

f_cam_mouseDeltaX = f_cam_mouseLastX - (_x);
f_cam_mouseDeltaY = f_cam_mouseLastY - (_y);

if (_rightMB && {!_leftMB}) then {
    f_cam_angleX = (f_cam_angleX - (f_cam_mouseDeltaX*360));
    f_cam_angleY = (f_cam_angleY + (f_cam_mouseDeltaY*180)) min 89 max -89;
};
if (f_cam_ctrl_down && {_rightMB} && {_leftMB}) then {
    f_cam_fovZoom = 0.7;
};

f_cam_mouseLastX = (f_cam_mouseCord select 0);
f_cam_mouseLastY = (f_cam_mouseCord select 1);
