fn_phx_updateVehMarks={
    private _vehArray = _this select 0;
    {
        private _veh = _x select 0;
        private _marker = str(_veh) + "_marker";
        if ("ItemGPS" in (assignedItems player)) then {
            private _unitInside = _veh getVariable "phx_UnitInside";
            //Check to see if any units with markers attached are in a vehicle with a marker. If so attach their name to the vehicle marker.
            if (!isNil "_unitInside") then {
                private _markerText = (_veh getVariable "phx_MarkerName") + " (" + (_veh getVariable "phx_UnitInside") + ")";
                _veh setVariable ["phx_UnitInside",nil];
                _veh setVariable ["phx_LastInside",nil];
                _marker setMarkerTextLocal _markerText;
            } else {
                private _markerText = (_veh getVariable "phx_MarkerName");
                _marker setMarkerTextLocal _markerText;
            };
            _marker setMarkerAlphaLocal 1;
            _marker setMarkerPosLocal (getPos _veh);
        } else {
            _marker setMarkerAlphaLocal 0;
        };
    } forEach _vehArray;
};

{ //forEach allGroups
    private _group = _x;
    private _groupIdent = _group getVariable ["phx_groupIdentifier",groupID _group];
    if !( ((_groupIdent) in phx_ignoreMarkerArray) || {((groupID _group) in phx_ignoreMarkerArray)} ) then {
        private _marker = _group getVariable "phx_gps_markerName";
        private _marker2 = _marker + "Size";
        if ("ItemGPS" in (assignedItems player)) then { //Check if player has GPS
            if ((side (leader _x)) in phx_sidesVisibleToPlayer) then { //Check if player is supposed to be able to see this group
                _marker setMarkerAlphaLocal 1; //If player has GPS and same side, show marker
                _marker2 setMarkerAlphaLocal 1;
                
                { //forEach allUnits in _group
                    //Check members in group for GPS and update the marker to the position of the most senior member in the group who has GPS
                    private _unit = _x;
                    private _senior = _group getVariable ["phx_seniorGPS",objNull];
                    if (!("ItemGPS" in (assignedItems _senior)) || (!alive _senior) || !(group _senior isEqualTo _group)) then { //Make sure most senior unit still has GPS and is alive
                        _group setVariable ["phx_seniorGPS",objNull];
                        _senior = objNull;
                    };
                    
                    //If _senior isn't group leader make sure group leader has no gps.
                    if (_senior != leader _group) then {
                        if ("ItemGPS" in (assignedItems (leader _group)) && (alive (leader _group)) && (group (leader _group)) isEqualTo _group ) then {
                            _senior = leader _group;
                            _group setVariable ["phx_seniorGPS",(leader _group)];
                        };
                    };
                    
                    //_senior = _group getVariable ["phx_seniorGPS",objNull]; // put this here or _senior won't update for the below code block
                    if (("ItemGPS" in (assignedItems _unit)) && ((isNull _senior) || (_senior == _unit))) then { //no reason to run this stuff if _unit isn't the most senior member
                        if (isNull _senior) then {
                            _group setVariable ["phx_seniorGPS",_unit]; //no better match than _unit
                        };
                        if (vehicle _unit != _unit) then { //If unit isn't on foot and vehicle doesn't have a marker
                            private _unitInside = (vehicle _unit) getVariable "phx_UnitInside";
                            private _lastInside = (vehicle _unit) getVariable "phx_LastInside";
                            if (isNil "_lastInside") then {_lastInside = "Nobody"};
                            if ((!isNil "_unitInside") && (_lastInside != _groupIdent)) then {
                                private _string = ((vehicle _unit) getVariable "phx_UnitInside") + " | " + (groupID _group);
                                (vehicle _unit) setVariable ["phx_UnitInside",_string];
                                (vehicle _unit) setVariable ["phx_LastInside",_groupIdent];
                            } else {
                                (vehicle _unit) setVariable ["phx_UnitInside",_groupIdent];
                                (vehicle _unit) setVariable ["phx_LastInside",_groupIdent];
                            };
                            if (!isNil "phx_sideVehArray") then {
                                if (vehicle _unit in phx_sideVehArray2) then {
                                    _marker setMarkerAlphaLocal 0; //Hide marker when unit is in a vehicle that has a marker
                                    _marker2 setMarkerAlphaLocal 0;
                                } else {
                                    _marker setMarkerAlphaLocal 1; //Vehicle doesn't have a marker, show unit's marker instead
                                    _marker2 setMarkerAlphaLocal 1;
                                };
                            };
                        } else {
                            _marker setMarkerAlphaLocal 1; //Show marker when unit is not in a vehicle with a marker
                            _marker2 setMarkerAlphaLocal 1;
                        };
                        _marker setMarkerPosLocal (getPos _unit);
                        _marker2 setMarkerPosLocal (getPos _unit);
                    };
                } forEach units _group;
            };
        } else {
            _marker setMarkerAlphaLocal 0; // Player has no GPS
            _marker2 setMarkerAlphaLocal 0;
        };
    };
} forEach allGroups;

//VEHICLE MARKERS
if (!isNil "phx_sideVehArray") then {[phx_sideVehArray] call fn_phx_updateVehMarks;};