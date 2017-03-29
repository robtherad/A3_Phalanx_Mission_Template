/*
    Settings file for the randomstart module.

   _randomizeX - true or false. Allow randomstart script to select a starting location for team X.

        ex: _randomizeWest = true; // Randomstart selects a starting location for BLUFOR
        ex: _randomizeWest = false; // Randomstart does nothing for BLUFOR


==============================
    _placeMarkerX - The marker name to be used as the placemarker for team X. The placemarker is the point from which player and object positions are measured. They are then moved to the new starting location and placed in the same positions relative to the starting marker as they were in relative to the placemarker. Player and object facing is not affected by the facing of the placemark, only the facing of the object and the starting location marker.

        ex: _placeMarkerWest = "placemarkBlue";


==============================
    _markerArrayX - An array of marker names (strings) which will be used as starting locations for team X. Make sure all markers in this array actually exist or if a non-existent marker is selected players on team X will spawn in the bottom left corner of the map.

        ex: _markerArrayWest = ["randomstart","randomstart_1","randomstart_2"];


==============================
    _objectArrayX - An array of objects to be moved with team X. Objects are any 'unit' you can place in the editor. Vehicles, players, boxes, etc. If you don't want to move any extra objects then set it to [] as shown in the example below.

        ex 1: _objectArrayWest = [blueHelicopter,blueBox,greenHostage];    // MOVES PLAYERS ON BLUFOR AND OBJECTS NAMED 'blueHelicopter', 'blueBox' AND 'greenHostage' to BLUFOR starting location
        ex 2: _objectArrayWest = [bluHelicopter];                          // MOVES PLAYERS ON BLUFOR AND OBJECT NAMED 'blueHelicopter' to BLUFOR starting location
        ex 3: _objectArrayWest = [];                                       // MOVES NOTHING BUT THE PLAYERS ON BLUFOR to BLUFOR starting location


==============================
*/

// WEST (BLUFOR)
_randomizeWest = true; // true OR false - use randomstart script with this team
_placeMarkerWest = "placemarkBlue"; // Name of the marker to be used as the 'placemark' for BLUFOR
_markerArrayWest = ["random_0","random_1","random_2","random_3","random_4","random_5","random_6","random_7"];
_objectArrayWest = []; // If empty make equal to [].


// EAST (REDFOR)
_randomizeEast = true; // true OR false - use randomstart script with this team
_placeMarkerEast = "placemarkRed"; // Name of the marker to be used as the 'placemark' for REDFOR
_markerArrayEast = ["random_0","random_1","random_2","random_3","random_4","random_5","random_6","random_7"];
_objectArrayEast = []; // If empty make equal to []


// INDEPENDENT (GREENFOR)
_randomizeIndependent = true; // true OR false - use randomstart script with this team
_placeMarkerIndependent = "placemarkGreen"; // Name of the marker to be used as the 'placemark' for GREENFOR
_markerArrayIndependent = ["random_0","random_1","random_2","random_3","random_4","random_5","random_6","random_7"];
_objectArrayIndependent = []; // If empty make equal to [].


// CIVILIAN (PURPFOR)
_randomizeCivilian = true; // true OR false - use randomstart script with this team
_placeMarkerCivilian = "placemarkPurple"; // Name of the marker to be used as the 'placemark' for GREENFOR
_markerArrayCivilian = ["random_0","random_1","random_2","random_3","random_4","random_5","random_6","random_7"];
_objectArrayCivilian = []; // If empty make equal to [].
