#include "settings.sqf";

// Clear cargo if setting is active
if (isServer) then {
    if (_clearVehicleCargo) then {
        {
            _vehicleC = _x select 0;
            clearWeaponCargoGlobal _vehicleC;
            clearMagazineCargoGlobal _vehicleC;
            clearBackpackCargoGlobal _vehicleC;
            clearItemCargoGlobal _vehicleC;
        } forEach _lockArray;
    };
};

if (isDedicated) exitWith {};

if (count _lockArray > 0) then {
    { // forEach lockArray
        // Unpack variables
        _vehicle = _x select 0;
        _lockedSides = _x select 1;
        _lockedPositions = _x select 2;
        _lockedClasses = _x select 3;
        _lockedPlayers = _x select 4;
        _lockedMessage = "Your class/side isn't able to access this vehicle/role.";
        if (count _x > 5) then {_lockedMessage = _x select 5;};

        // Convert array to text
        switch (_lockedPositions) do {
            //DRIVER, GUNNER, COMMANDER, CARGO
            case [0,0,0,0]: { _lockedPositions = []; };
            // 1
            case [1,0,0,0]: { _lockedPositions = ["driver"]; };
            case [0,1,0,0]: { _lockedPositions = ["gunner"]; };
            case [0,0,1,0]: { _lockedPositions = ["commander"]; };
            case [0,0,0,1]: { _lockedPositions = ["cargo"]; };
            // 2
            case [1,1,0,0]: { _lockedPositions = ["driver","gunner"]; };
            case [0,1,1,0]: { _lockedPositions = ["gunner","commander"]; };
            case [0,0,1,1]: { _lockedPositions = ["commander","cargo"]; };
            case [1,0,0,1]: { _lockedPositions = ["driver","cargo"]; };
            case [0,1,0,1]: { _lockedPositions = ["gunner","cargo"]; };
            case [1,0,1,0]: { _lockedPositions = ["driver","commander"]; };
            // 3
            case [1,1,1,0]: { _lockedPositions = ["driver","gunner","commander"]; };
            case [1,1,0,1]: { _lockedPositions = ["driver","gunner","cargo"]; };
            case [1,0,1,1]: { _lockedPositions = ["driver","commander","cargo"]; };
            case [0,1,1,1]: { _lockedPositions = ["gunner","commander","cargo"]; };
            //4
            case [1,1,1,1]: { _lockedPositions = ["driver","gunner","commander","cargo"]; };
        };

        // ==================================================
        // Set variables to vehicle
        _vehicle setVariable ["phx_lck_Sides", _lockedSides];
        _vehicle setVariable ["phx_lck_Positions", _lockedPositions];
        _vehicle setVariable ["phx_lck_Classes", _lockedClasses];
        _vehicle setVariable ["phx_lck_Players", _lockedPlayers];
        _vehicle setVariable ["phx_lck_Message", _lockedMessage];
        // ==================================================

        if (!isNil "_vehicle") then {

            //Add getIn eventHandler
            _vehicle addEventHandler ["GetIn", {
                private ["_unit", "_veh", "_pos", "_lckClss", "_lckSide", "_lckPosn", "_lckPlyr", "_lckMsgs"];
                _unit = _this select 2;
                if (_unit == player) then {

                    _veh = _this select 0;
                    _pos = _this select 1;

                    _lckClss = _veh getVariable ["phx_lck_Classes", []]; // array
                    _lckSide = _veh getVariable ["phx_lck_Sides",[]]; // array
                    _lckPosn = _veh getVariable ["phx_lck_Positions",[]]; // array
                    _lckPlyr = _veh getVariable ["phx_lck_Players",[]];
                    _lckMsgs = _veh getVariable ["phx_lck_Message",""]; // string

                    if (count _lckSide > 0) then {
                        // LOCK BY SIDE
                        if !(side _unit in _lckSide) then {
                            // Wrong side
                            if !(_unit in _lckPlyr) then {
                                // Player not whitelisted
                                moveOut _unit;
                                titleText [_lckMsgs,"PLAIN DOWN",0.5];
                            };
                        } else {
                            if !(_unit in _lckPlyr) then {
                                if ((!(typeOf _unit in _lckClss)) && (_pos in _lckPosn)) then {
                                    //systemChat "Player not in list of players!";
                                    moveOut _unit;
                                    titleText [_lckMsgs,"PLAIN DOWN",0.5];
                                };
                            };
                        };
                    } else {
                        // LOCK BY CLASS/PLAYER ONLY
                        if !(_unit in _lckPlyr) then {
                            if (!(typeOf _unit in _lckClss) && (_pos in _lckPosn)) then {
                                moveOut _unit;
                                titleText [_lckMsgs,"PLAIN DOWN",0.5];
                            };
                        };
                    };
                };
            }]; //End addEventHandler

            //Add switch eventHandler
            _vehicle addEventHandler ["SeatSwitched", {
                private ["_unit", "_veh", "_pos", "_lckClss", "_lckSide", "_lckPosn", "_lckPlyr", "_lckMsgs"];
                _unit = _this select 1;
                if (_unit == player) then {
                    _veh = _this select 0;
                    _pos = assignedVehicleRole _unit;
                    _pos = _pos select 0;

                    _lckClss = _veh getVariable ["phx_lck_Classes", []]; // array
                    _lckSide = _veh getVariable ["phx_lck_Sides",[]]; // array
                    _lckPosn = _veh getVariable ["phx_lck_Positions",[]]; // array
                    _lckPlyr = _veh getVariable ["phx_lck_Players",[]];
                    _lckMsgs = _veh getVariable ["phx_lck_Message",""]; // string

                    if (_pos == "Turret") then {_pos = "gunner"};
                    if (count _lckSide > 0) then {
                        // LOCK BY SIDE
                        if !(side _unit in _lckSide) then {
                            // Wrong side
                            if !(_unit in _lckPlyr) then {
                                // Player not whitelisted
                                moveOut _unit;
                                titleText [_lckMsgs,"PLAIN DOWN",0.5];
                            };
                        } else {
                            // Unit on correct side
                            if !(_unit in _lckPlyr) then {
                                if (!(typeOf _unit in _lckClss) && (_pos in _lckPosn)) then {
                                    // But incorrect role for the position it's in
                                    moveOut _unit;
                                    _unit assignAsCargo _veh;
                                    _unit moveInCargo _veh;
                                    titleText [_lckMsgs,"PLAIN DOWN",0.5];
                                };
                            };
                        };
                    } else {
                        // LOCK BY CLASS/PLAYER ONLY
                        if !(_unit in _lckPlyr) then {
                            if (!(typeOf _unit in _lckClss) && (_pos in _lckPosn)) then {
                                // Unit is in position it shouldn't be
                                moveOut _unit;
                                _unit assignAsCargo _veh;
                                _unit moveInCargo _veh;
                                titleText [_lckMsgs,"PLAIN DOWN",0.5];
                            };
                        };
                    };
                };
            }]; //End addEventHandler
        };
    } forEach _lockArray;
};
