// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
private _listBox =  2100;
// updaes values for the units listbox.
f_cam_checkIndex = {
    {
        _x setVariable ["f_spect_listBoxIndex",_forEachIndex];
    } foreach f_cam_listUnits;
};

// ====================================================================================
f_cam_updateValues = [{
    params ["_args", "_handle"];
    _args params ["_listBox"];

    // ====================================================================================
    // make the mini map track the player.
    ctrlMapAnimClear ((findDisplay 9228) displayCtrl 1350);
    ((findDisplay 9228) displayCtrl 1350) ctrlMapAnimAdd [0, f_cam_map_zoom, visiblePosition (camTarget f_cam_camera)];
    ctrlMapAnimCommit ((findDisplay 9228) displayCtrl 1350);
    ctrlSetFocus ((findDisplay 9228) displayCtrl 1315);
    // ====================================================================================
    // update string.
    if (alive f_cam_curTarget) then {
        ctrlSetText [1000,format ["Spectating: %1", name f_cam_curTarget]];
        f_cam_fixedTagsAlready = false;
    } else {
        ctrlSetText [1000,format ["Spectating: %1", "Dead"]];
        if (isNil "f_cam_calledTagFix" && {!f_cam_fixedTagsAlready}) then {
            f_cam_fixedTagsAlready = true;
            f_cam_calledTagFix = true;
            [f_cam_fixTagBug, [], 2.5] call CBA_fnc_waitAndExecute;
        };
    };
    // ====================================================================================
    // fetch units
    private _groupArr = call F_fnc_GetPlayers;
    f_cam_units = ((_groupArr select 0) + (_groupArr select 1));
    f_cam_players = _groupArr select 0;
    // ====================================================================================
    // get the list for players or players/ai
    private _tempArr = [];
    if (f_cam_playersOnly) then {
        _tempArr = f_cam_players;
    } else {
        _tempArr = f_cam_units;
    };

    // ====================================================================================
    // Check it and see if they have been added already
    // TODO: Rewrite so each group's units aren't interated over twice
    private _specTypes = ["VirtualMan_F", "B_VirtualCurator_F", "O_VirtualCurator_F", "I_VirtualCurator_F", "C_VirtualCurator_F", "VirtualCurator_F"];
    {
        if (!(_x in f_cam_listUnits) && ({ private _spectator = _x getVariable ["phx_isUnitSpectator",false]; (alive _x) && {!_spectator} } count units _x) > 0 ) then {
            private _text = toString(toArray(groupID _x) - [45]);
            private _index = lbAdd [_listBox,_text];
            _x setVariable ["f_spect_listBoxIndex",_index];
            f_cam_listUnits pushBack _x;
            lbSetColor [_listBox,_index,([side _x,false] call BIS_fnc_sideColor)];
            {
                if (alive _x) then {
                    private _spectator = _x getVariable ["phx_isUnitSpectator",false];
                    if (!(_x in f_cam_listUnits) && {!((typeOf _x) in _specTypes)} && {!_spectator}) then {
                        f_cam_listUnits pushBack _x;
                        _text = "    " + name _x;
                        _index = lbAdd [_listBox,_text];
                        _x setVariable ["f_spect_listBoxIndex",_index];
                    };
                };
                nil
            } count units _x;
        };
        nil
    } count _tempArr;

    // ====================================================================================
    // Prune any entries that shouldn't be there
    {
        private _index = _x getVariable ["f_spect_listBoxIndex",-1];
        if (_index >= 0) then {
            if (typeName _x isEqualTo "GROUP") then {
                private _count = ({private _spectator = _x getVariable ["phx_isUnitSpectator",false]; !_spectator && {alive _x}} count units _x);
                if (_count >= 0 && {lbText [_listBox,_index] != (toString(toArray(groupID _x) - [45]))}) then {
                    // there is no lbSetText, so just punt it out of the list and fix it up there..
                    lbDelete [_listBox,_index];
                    f_cam_listUnits deleteAt _index;
                    [] call f_cam_checkIndex;
                };
                if (_count isEqualTo 0) then {
                    lbDelete [_listBox,_index];
                    f_cam_listUnits deleteAt _index;
                    [] call f_cam_checkIndex;
                };
            } else {
                _val = lbText [_listBox,_index] != "    " + name _x;
                if (_val && {alive _x}) then {
                    // there is no lbSetText, so just punt it out of the list and fix it up there..
                    lbDelete [_listBox,_index];
                    f_cam_listUnits deleteAt _index;
                    [] call f_cam_checkIndex;
                };
                if (!alive _x || isNull _x || _x getVariable ["phx_isUnitSpectator",false]) then {
                    lbDelete [_listBox,_index];
                    f_cam_listUnits deleteAt _index;
                    [] call f_cam_checkIndex;
                };
            };
        };
        nil
    } count f_cam_listUnits;
    
    // Failsafe - Makes sure data counts match
    if (count f_cam_listUnits !=  lbSize _listBox) then {
        // Bad count - Refresh data
        f_cam_listUnits = [];
        lbClear _listBox;
    };
    
}, 1, [_listBox]] call CBA_fnc_addPerFrameHandler;