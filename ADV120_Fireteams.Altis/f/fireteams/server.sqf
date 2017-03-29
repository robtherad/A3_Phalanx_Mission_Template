// Fireteam Gamemode

// Description:
// * Players start with an unarmed vehicle around the objective.
// * Objective type and location is placed randomly.
// * New objectives will be assigned after the current objective is completed and will only be placed in adjacent locations.
// * A player will remain dead until the objective is complete.
// * Dead players will respawn upon a new objective being assigned.
// * Equipment will spawn in buildings around the current objective AO.

// Configuration:
// fireteam.sqf          - sizeOfSpawnAO    // Circle that items spawn in and players spawn around
// fireteam.sqf          - sizeOfObjHold    // Circle that players must hold for objective type "Hold"
// fireteam.sqf          - objTickTime      // How many seconds until seizeMarker increases for obj "Hold"
// fireteam.sqf          - objNumberOfTicks // How many ticks a team must hold obj "Hold" to win
// fireteam.sqf          - minDistBetweenSpawn // How far to spawn teams apart
// randomloot\server.sqf - _maxSpawns     // Maxmimum number of items per building
// randomloot\server.sqf - _probability   // Probability that the item spawns in a building
//

if (!isServer) exitWith {};

#include "..\randomstart\settings.sqf";

roundInProgress  = false;
publicVariable "roundInProgress";
sizeOfSpawnAO    = 100;  // default 500: Circle that items spawn in and players spawn around
sizeOfObjHold    = 25;   // default 25: Circle that players must hold for obj type "Hold"
objTickTime      = 1;    // default 1: How many seconds until seizeMarker increases for obj "Hold"
objNumberOfTicks = 60*3; // default 60*3: How many ticks (objTickTime) a team must hold obj "Hold" to win
objSizeTick = (sizeOfSpawnAO - sizeOfObjHold) / objNumberOfTicks; //How much to increase the seizeMarker
minDistBetweenSpawn = 250; // default 250: Be careful with this! It is not robust enough to check that all markers can be placed with this constraint, meaning, you can cause teams to not have spawn points.
scoreBLUFOR = 0;
scoreOPFOR = 0;
scoreINDFOR = 0;
lossStreakBLUFOR = 0;
lossStreakOPFOR = 0;
lossStreakINDFOR = 0;
publicVariable "scoreBLUFOR";
publicVariable "scoreOPFOR";
publicVariable "scoreINDFOR";
publicVariable "lossStreakBLUFOR";
publicVariable "lossStreakOPFOR";
publicVariable "lossStreakINDFOR";

objNumber  = 0;   // Keeps track of the current number obj
currentLoc = nil; // Keeps track of the current obj location

// Array of Locations: [name, size, pos, angle]
objLocations = [];

switch (toLower worldName) do {
    case "altis": {
        objLocations = [
            ["Abdera",          [160,160], [9428.6553,20241.711], 0],
            ["Kore",            [150,150], [7156.0981,16473.186], 0],
            ["Negades",         [200,150], [4915.6445,16181.08],  0],
            ["Poliakko",        [200,200], [10955.016,13446.202], 0],
            ["Alikampos",       [150,150], [11135.173,14554.855], 0],
            ["Lakka",           [300,300], [12399.981,15723.699], 0],
            ["Telos",           [275,175], [16360.756,17247.285], 0],
            ["Charkia",         [250,200], [18129.295,15239.145], 0],
            ["Agios Dionysios", [460,230], [9372.5176,15907.256], 345],
            ["Frini",           [175,175], [14630.977,20801.369], 0],
            ["Panochori",       [200,200], [5085.7744,11255.75],  0],
            ["Neri",            [150,150], [4166.3979,11750.202], 0],
            ["Zaros",           [150,150], [9109.4814,11982.389], 0],
            ["Therisa",         [150,150], [10660.85,12256.249],  0],
            ["Rodopoli",        [150,150], [18813.949,16626.662], 0],
            ["Paros",           [150,150], [20953.289,16983.402], 0],
            ["Kalochori",       [150,150], [21427.215,16356.371], 0],
            ["Sofia",           [150,150], [25680.68,21345.486],  0],
            ["Molos",           [150,150], [27012.621,23235.025], 0],
            ["Dorida",          [150,150], [19394.307,13264.557], 0],
            ["Chalkeia",        [150,150], [20258.314,11690.445], 0],
            ["Panagia",         [150,150], [20531.992,8880.8848], 0],
            ["Feres",           [150,150], [21686.83,7577.3218],  0],
            ["Selakano",        [150,150], [20818.33,6739.6821],  0],
            ["Pyrgos",          [150,150], [16864.756,12691.786], 0],
            ["Anthrakia",       [150,150], [16657.893,16123.546], 0],
            ["Gravia",          [150,150], [14510.347,17623.906], 0],
            ["Athira",          [150,150], [14042.524,18714.863], 0],
            ["Galati",          [150,150], [10330.641,19049.908], 0],
            ["Syrta",           [150,150], [8631.876,18267.607],  0],
            ["Stavros",         [150,150], [12982.067,15043.031], 0]
        ];
        /* Altis Locations that aren't good enough yet
            ["Aggelochori",     [300,300], [3822.207,13685.973],  0],
            ["Agia Triada",     [50,200],  [16617.021,20575.688], 323],
            ["Topolia",         [75,150],  [7378.4136,15335.224], 0],
            ["Katalaki",        [150,150], [11761.309,13712.03],  0],
            ["Kavala",          [300,300], [3599.1462,13059.67],  0],
            ["Neochori",        [150,150], [12584.114,14326.683], 0]
            ["Ghost Hotel",     [150,150], [21969.797,21026.451], 0], // too few buildings
            ["Oreokastro",      [150,150], [4599.4292,21405.762], 0], // too few buildings & cliffs
        */
    };

    case "chernarus": {
        objLocations = [
            ["Chernogorsk",     [200,200], [6711.0625,2650.7988], 0],
            ["Elekrozavodsk",   [200,200], [10322.455,2122.6682], 0]
        ];
        /* Chernarus Locations that aren't good enough yet
        ["Berezino",        [200,200], [12042.515,9102.0742], 0],
        ["Berezino Docks",  [200,200], [12885.655,9982.2178], 0]
            ["Zelenogorsk",     [200,200], [2728.0989,5269.583],  0]
        */
    };

    case "sara_dbe1": {
        objLocations = [
            ["Arcadia", [200, 250], [7622.8159, 6435.5762], 320],
            ["Eponia", [500, 500], [12585.727, 15133.22], 0]
        ];
    };

};

// Array of Objective Types: [name]
objTypes = [
    ["Hold"]
];

/* Incomplete Objectives
    ["Steal"],
    ["Destroy"],
    ["Hold"]
    ["kill"],
    ["transport"],
    ["resupply"],
    ["locate"],
    ["capture"],
    ["inform"],
    ["disguise"]
*/

bFirstRound = true;

while {true} do {
  // Server will loop this process throughout the mission

  // ===========================================================================
  // PREPARE ROUND
  roundInProgress=false;

  // Publish variables to clients
	publicVariable "roundInProgress";

  // Run cleanup for bodies, items and vehicles

  bWinBLUFOR = false;
  bWinOPFOR = false;
  bWinINDFOR = false;

  /*
  // Create list of participating players
  _bluforUnitArr = [];
  _opforUnitArr = [];
  _indforUnitArr = [];
  _bluforUnitCount = 0;
  _opforUnitCount = 0;
  _indforUnitCount = 0;
  {
    if ((isPlayer _x) && (alive _x) && (_x getVariable ["ready", false])) then {
      if (side _x == west) then {
        _bluforUnitArr set [_bluforUnitCount, _x];
        _bluforUnitCount = _bluforUnitCount + 1;
      } else {
        if (side _x == east) then {
          _opforUnitArr set [_opforUnitCount, _x];
          _opforUnitCount = _opforUnitCount + 1;
        } else {
          if (side _x == independent) then {
            _indforUnitArr set [_indforUnitCount, _x];
            _indforUnitCount = _indforUnitCount + 1;
          };
        };
      };
      _x setVariable ["ready", false];
      _x setVariable ["isPlaying", true, true];
    };
  } forEach allUnits;
  */

  if (!bFirstRound) then {
    [] call phx_fnc_fireteams_objNext;
  } else {
    bFirstRound = false;
    [] call phx_fnc_fireteams_objFirst;
  };

  sleep 5;
  roundInProgress = true;
	publicVariable "roundInProgress";

  // ===========================================================================
  // ROUND BEGINS
  waitUntil {
    bWinBLUFOR || bWinOPFOR || bWinINDFOR
  };

  // ===========================================================================
  // ROUND ENDED
  if (bWinBLUFOR) then {
    scoreBLUFOR = scoreBLUFOR + 1;
    publicVariable "scoreBLUFOR";
    lossStreakBLUFOR = 0;
    lossStreakOPFOR = lossStreakOPFOR + 1;
    lossStreakINDFOR = lossStreakINDFOR + 1;
  } else {
    if (bWinOPFOR) then {
      scoreOPFOR = scoreOPFOR + 1;
      publicVariable "scoreOPFOR";
      lossStreakOPFOR = 0;
      lossStreakBLUFOR = lossStreakBLUFOR + 1;
      lossStreakINDFOR = lossStreakINDFOR + 1;
    } else {
      if (bWinINDFOR) then {
        scoreINDFOR = scoreINDFOR + 1;
        publicVariable "scoreINDFOR";
        lossStreakINDFOR = 0;
        lossStreakOPFOR = lossStreakOPFOR + 1;
        lossStreakBLUFOR = lossStreakBLUFOR + 1;
      };
    };
  };
  publicVariable "lossStreakBLUFOR";
  publicVariable "lossStreakOPFOR";
  publicVariable "lossStreakINDFOR";

}
