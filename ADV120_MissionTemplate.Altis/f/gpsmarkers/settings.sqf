/*
    Settings file for the phx\gpsmarkers\ module.
    
    Vehicle Markers
        If you do have vehicles in your mission, make sure they are named and then add that name to the array for the team they are on. If vehicles exist in your mission but are not entered into this settings file they will not have markers in game.  

            //No vehicles in mission
            _westVehArray = nil;
            _eastVehArray = nil;
            _indVehArray = nil;

            //Vehicles in mission
            _westVehArray = [bluforTruck1,bluforTruck2]; 
            _eastVehArray = [opforTruck]; 
            _indVehArray = [independentTruck];

        If you want the vehicle to have a custom name instead of something weird looking like 'bluTruck' then add the following line to the vehicles initialization field in the editor to change the GPS marker name to whatever you want:

            this setVariable ["phx_MarkerName", "GPS Marker Text Goes Here"];
        
    Excluding groups from being marked
        By default, all groups will have markers generated for them even if their leader doesn't have GPS. If you wish to exclude a group from having a marker generated and updated, add it's groupID to the array phx_ignoreMarkerArray on line 51. In the default template all groups have their groupIDs set by the file "f\setGroupID\f_setGroupID.sqf" so you will want to use the values defined there. Make sure when you enter a groupID you surround it with quotes since it is a string. 
        
        For example, if I wanted to exclude groups with the groupIDs "P", "AV", "BV", "CV" and "DV" from having markers created I would set phx_ignoreMarkerArray to:

            phx_ignoreMarkerArray = ["P","AV","BV","CV","DV"];
        
        To make sure all groups have markers set phx_ignoreMarkerArray to be an empty array. If you have just downloaded the template off GITHUB then this should be the default setting. To do this use the following line:
    
            phx_ignoreMarkerArray = [];
        
    Letting players see infantry GPS icons that belong to multiple sides
        By default there are three variables for this, one each for BLUFOR, OPFOR, and INDFOR. These variables are "_sidesVisibleToWest", "_sidesVisibleToEast", and "_sidesVisibleToGuer". Each variable contains an array of sides which will be visible to the side that uses that variable. By default these variables contain only the side of the side they belong to so that no side can see any other side's markers.
        
        For example if you want BLUFOR to be able to see INDFOR's GPS markers as well as their own but have INDFOR only able to see their own markers and not BLUFOR's with OPFOR also only being able to see their own markers you would do...
        
            _sidesVisibleToWest = [west, independent]; //BLUFOR
            _sidesVisibleToEast = [east]; //OPFOR
            _sidesVisibleToGuer = [independent]; //INDFOR
        
        This will only set up the default settings for the markers. You can change the way markers are displayed mid-mission by setting the variable "phx_sidesVisibleToPlayer" to an array of sides. Let's assume two sides, BLUFOR and INDFOR, are friendly with each other and are able to see each others markers. The situation changes and they are no longer friendly so you want to have them only able to see their own team's markers. You could do this by executing the following code:
        
            {
                if(side player == west) then {phx_sidesVisibleToPlayer = [west];};
                if(side player == independent) then {phx_sidesVisibleToPlayer = [independent];};
            } forEach allPlayers;
            
        This system should allow for more in depth missions featuring three sides.
*/
// 0 = armor, 1 == helicopter, 2 == plane
_westVehArray = nil;
_eastVehArray = nil;
_indVehArray = nil;
phx_ignoreMarkerArray = []; //if blank set to []
_sidesVisibleToWest = [west]; //BLUFOR (west)
_sidesVisibleToEast = [east]; //OPFOR (east)
_sidesVisibleToGuer = [independent]; //INDEPENDENT (independent)