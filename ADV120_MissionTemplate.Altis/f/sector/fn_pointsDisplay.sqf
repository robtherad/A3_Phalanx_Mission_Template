/*
Initializes the settings for and then adds a PFH to handle displaying the capture time remaining in the bottom right corner of client's screens.

Runs on clients.
*/

if (!hasInterface) exitWith {};

// Make sure the sector control script has been running long enough
phx_show_timeUI = true;
private _totalCapTime = ["phx_auto_sectorTime",25] call BIS_fnc_getParamValue;

phx_auto_westPointsPublic = 0;
phx_auto_eastPointsPublic = 0;

[{
    params ["_args","_handle"];
    _args params ["_totalCapTime"];
    
    disableSerialization;
    
    if (phx_show_timeUI) then {
        // Figure out time left for both teams
        {       
            _x params ["_stringVar", "_pointsVar", "_teamVar"];
            
            private _string = format ["%1 Capture Progress: %2/%3",_teamVar,_pointsVar,_totalCapTime];
            missionNamespace setVariable [_stringVar, _string];
            
        } forEach [["phx_auto_westPointsString", phx_auto_westPointsPublic, "BLUFOR"], ["phx_auto_eastPointsString", phx_auto_eastPointsPublic, "REDFOR"]];
        
        // Create displays in bottom left
        ("bluRsc" call BIS_fnc_rscLayer) cutRsc ["redforStructText", "PLAIN"];
        ("redRsc" call BIS_fnc_rscLayer) cutRsc ["bluforStructText", "PLAIN"];
        
        // Update text in the displays to match the points markers
        private _display = uiNameSpace getVariable "redforStructText";
        private _setText = _display displayCtrl 1001;
        _setText ctrlSetStructuredText (parseText format ["%1",phx_auto_eastPointsString]);
                
        private _display2 = uiNameSpace getVariable "bluforStructText";
        private _setText2 = _display2 displayCtrl 1002;
        _setText2 ctrlSetStructuredText (parseText format ["%1",phx_auto_westPointsString]);
    } else {
        ("bluRsc" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
        ("redRsc" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    };
}, 1, [_totalCapTime]] call CBA_fnc_addPerFrameHandler;