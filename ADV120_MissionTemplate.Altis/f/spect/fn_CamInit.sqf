// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
//_this = [this,objNull,0,0,true] execVM "f\spect\fn_CamInit.sqf";
// params

if (!isNil "phx_isSpectator") exitWith {diag_log "fn_CamInit: Already ran, exiting early."};
if (isNil "phx_isSpectator") then {
    phx_isSpectator = true;
};

_this spawn {
_unit = [_this, 0, player,[objNull]] call BIS_fnc_param;
_oldUnit = [_this, 1, objNull,[objNull]] call BIS_fnc_param;
_forced = [_this, 4, false,[false]] call BIS_fnc_param;
if(isNil "f_cam_isJIP") then { f_cam_isJIP = false; };
// if they are jip, these are null
if(isNull _unit ) then {_unit = cameraOn;f_cam_isJIP=true;};
// escape the script if you are not a seagull unless forced
if (typeof _unit != "seagull" && !_forced || !hasInterface) ExitWith {};
// disable this to instantly switch to the spectator script.
waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true] || isNull (_oldUnit) || f_cam_isJIP || _forced };

// ====================================================================================

if(!isnil "BIS_fnc_feedback_allowPP") then {
  // disable effects death effects
  BIS_fnc_feedback_allowPP = false;
};
//diag_log "fn_camInit: Stop feedback";

if(f_cam_isJIP || _forced) then {
  ["F_ScreenSetup",false] call BIS_fnc_blackOut;
  systemChat "Initializing Spectator Script";
  uiSleep 3;
  ["F_ScreenSetup"] call BIS_fnc_blackIn;
};
//diag_log "fn_camInit: JIP check";

// Create a Virtual Agent to act as our player to make sure we get to keep Draw3D
if(isNil "f_cam_VirtualCreated") then {
  createCenter sideLogic;
  _newGrp = createGroup sideLogic;
  _newUnit = _newGrp createUnit ["VirtualCurator_F", [0,0,5], [], 0, "FORM"];
  _newUnit allowDamage false;
  _newUnit hideObjectGlobal true;
  _newUnit enableSimulationGlobal false;
  _newUnit setpos [0,0,5];
  selectPlayer _newUnit;
  waituntil{player == _newUnit};
  deleteVehicle _unit;
  f_cam_VirtualCreated = true;
};
//diag_log "fn_camInit: Create virtual player";

private ["_oldUnit"];
if(isNull _oldUnit ) then {if(count playableUnits > 0) then {_oldUnit = (playableUnits select 0)} else {_oldUnit = (allUnits select 0)};};
if (isNil "_oldUnit") then {
    createCenter civilian;
    _grp = createGroup civilian;
    _oldUnit = _grp createUnit ["C_man_1", [0,0,5], [], 0, "FORM"];
    //_oldUnit enableSimulationGlobal false;
    _oldUnit disableAI "MOVE";
    _oldUnit allowDamage false;
};
//diag_log "fn_camInit: Determine old unit";
// ====================================================================================

// Set spectator mode for whichever radio system is in use
[player, true] call TFAR_fnc_forceSpectator;
//diag_log "fn_camInit: TFAR Spect";
// ====================================================================================

_listBox = 2100;
lbClear _listBox;
// set inital values.
#include "macros.hpp"
f_cam_controls = [F_CAM_HELPFRAME,F_CAM_HELPBACK,F_CAM_MOUSEHANDLER,F_CAM_UNITLIST,F_CAM_MODESCOMBO,F_CAM_SPECTEXT,F_CAM_SPECHELP,F_CAM_HELPCANCEL,F_CAM_HELPCANCEL,F_CAM_MINIMAP,F_CAM_FULLMAP,F_CAM_BUTTIONFILTER,F_CAM_BUTTIONTAGS,F_CAM_BUTTIONTAGSNAME,F_CAM_BUTTIONFIRSTPERSON,F_CAM_DIVIDER];
f_cam_units = [];
f_cam_players = [];
f_cam_startX = 0;
f_cam_startY = 0;
f_cam_detlaX = 0;
f_cam_detlaY = 0;
f_cam_zoom = 0;
f_cam_hideUI = false;
f_cam_map_zoom = 0.5;
f_cam_mode = 0;
f_cam_toggleCamera = false;
f_cam_playersOnly = false;
f_cam_toggleTags = true;
f_cam_ads = false;
f_cam_nvOn = false;
f_cam_tiBHOn = false;
f_cam_tiWHOn = false;
f_cam_tagsEvent = -1;
f_cam_mShift = false;
f_cam_freecamOn = false;
f_cam_toggleTagsName = true;
f_cam_mapMode = 0;
f_cam_MouseButton = [false,false];
f_cam_mouseCord = [0.5,0.5];
f_cam_mouseDeltaX = 0.5;
f_cam_mouseDeltaY = 0.5;
f_cam_mouseLastX = 0.5;
f_cam_mouseLastY = 0.5;
f_cam_angleYcached  = 0;
f_cam_angleX = 0;
f_cam_tracerOn = false;
f_cam_angleY = 60;
f_cam_ctrl_down = false;
f_cam_shift_down = false;
f_cam_freecam_buttons = [false,false,false,false,false,false];
f_cam_forcedExit = false;
f_freecam_x_speed = 0;
f_freecam_y_speed = 0;
f_freecam_z_speed = 0;
f_cam_tagTextSize = 0.025;
phx_show_timeUI = true;

f_cam_timestamp = time;
f_cam_muteSpectators = true;
//diag_log "fn_camInit: Define initial values";
// ====================================================================================
// Menu (Top left)
f_cam_menuControls = [2111,2112,2113,2114,2101,4302];
f_cam_menuShownTime = 0;
f_cam_menuShown = true;
f_cam_menuWorking = false;
f_cam_sideButton = 0; // 0 = ALL, 1 = BLUFOR , 2 = OPFOR, 3 = INDFOR , 4 = Civ
f_cam_sideNames = ["All Sides","Blufor","Opfor","Indfor","Civ"];
//diag_log "fn_camInit: Define menu values";
// ====================================================================================
// Colors

f_cam_blufor_color = [BLUFOR] call bis_fnc_sideColor;
f_cam_opfor_color = [OPFOR] call bis_fnc_sideColor;
f_cam_indep_color = [independent] call bis_fnc_sideColor;
f_cam_civ_color = [civilian] call bis_fnc_sideColor;
f_cam_empty_color = [sideUnknown] call bis_fnc_sideColor;
f_cam_gray_color = [0.75,0.75,0.75,1];
//diag_log "fn_camInit: Define colors";
// ================================
// Camera
f_cam_angle = 360;
f_cam_zoom = 3;
f_cam_height = 3;
f_cam_fovZoom = 1.2;
f_cam_scrollHeight = 0;
f_cam_cameraMode = 0; // set camera mode (default)
//diag_log "fn_camInit: Define camera values";
// ====================================================================================

f_cam_listUnits = [];

f_cam_ToggleFPCamera = {
    f_cam_toggleCamera = !f_cam_toggleCamera;
    if(f_cam_toggleCamera) then {
        f_cam_mode = 1; //(view)
        f_cam_camera cameraEffect ["terminate", "BACK"];
        f_cam_curTarget switchCamera "internal";
    }
    else
    {
        f_cam_mode = 0;
        f_cam_camera cameraEffect ["internal", "BACK"];
    };
    call F_fnc_ReloadModes;
};
f_cam_GetCurrentCam = {
  _camera = f_cam_camera;
  switch(f_cam_mode) do
  {
    case 0:
    {
        _camera = f_cam_camera; // Standard
    };
    case 1:
    {
      _camera = cameraOn; // FP
    };
    case 3:
    {
      _camera = f_cam_freecamera; // freecam
    };
  };
  _camera
};

//diag_log "fn_camInit: Set up camera functions";
// =============================================================================

// create the UI
createDialog "f_spec_dialog";
// add keyboard events
// hide minimap
((findDisplay 9228) displayCtrl 1350) ctrlShow false;
((findDisplay 9228) displayCtrl 1350) mapCenterOnCamera false;

// hide big map
((findDisplay 9228) displayCtrl 1360) ctrlShow false;
((findDisplay 9228) displayCtrl 1360) mapCenterOnCamera false;

["Extra Keys\n\nPress 'F1' to see this hint again.\nPress 'U' to hide the spectator UI.\nPress 'V' to hide the remaining time UI.\nPress 'Right Arrow' to make player tags bigger.\nPress 'Left Arrow' to make player tags smaller.\n\nTo see who you killed as well as who killed you, press your chat key (default '/') then press 'Page-Up' until you see the information in the chat area.\n\nPress 'F2' to hide this message and others like it.",20] call phx_fnc__hintThenClear;
f_cam_helptext = "<t color='#EAA724'>Press F1 to see more keys.<br />Hold right-click to pan the camera.<br />Use the scroll wheel or numpad+/- to zoom in and out.<br />Use ctrl + rightclick to fov zoom<br />Press H to show and close the help window.<br />Press M to toggle between no map,minimap and full size map.<br />T for switching on tracers on the map<br/>Space to switch to freecam <br/>Use the left and right arrow keys to adjust size of player tags.</t>";
((findDisplay 9228) displayCtrl 1310) ctrlSetStructuredText parseText (f_cam_helptext);
// create the camera and set it up.
f_cam_camera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];

f_cam_fakecamera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];

f_cam_curTarget = _oldUnit;
f_cam_freecamera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];
f_cam_camera camCommit 0;
f_cam_fakecamera camCommit 0;
f_cam_camera cameraEffect ["internal","back"];
f_cam_camera camSetTarget f_cam_fakecamera;
f_cam_camera camSetFov 1.2;
f_cam_freecamera camSetFov 1.2;
f_cam_zeusKey = 21;
if( count (actionKeys "curatorInterface") > 0 ) then {
    f_cam_zeusKey = (actionKeys "curatorInterface") select 0;
};
f_cam_MouseMoving = false;
cameraEffectEnableHUD true;
showCinemaBorder false;
f_cam_fired = [];
{
  _event = _x addEventHandler ["fired",{f_cam_fired = f_cam_fired - [objNull];f_cam_fired pushBack (_this select 6)}];
  _x setVariable ["f_cam_fired_eventid",_event];

} foreach (allunits + vehicles);

//diag_log "fn_camInit: Create UI";
// ====================================================================================
// spawn sub scripts
call f_fnc_ReloadModes;
lbSetCurSel [2101,0];
//diag_log "fn_camInit: Reload modes";
//f_cam_freeCam_script = [] spawn F_fnc_FreeCam;
f_cam_updatevalues_script = [] spawn F_fnc_UpdateValues;
 ["f_spect_tags", "onEachFrame", {_this call F_fnc_DrawTags}] call BIS_fnc_addStackedEventHandler;
 ["f_spect_cams", "onEachFrame", {_this call F_fnc_FreeCam}] call BIS_fnc_addStackedEventHandler;
 //diag_log "fn_camInit: Added onEachFrame handlers";
};
