_lockArray = [

// ====================================================================================
/*
    All entries should be in the following format:
    [Vehicle, [Sides], [Positions], [Classes], [Players], "Message"]
    
----------
    Vehicle: The name of the vehicle that you want to lock.
    
        Uses the same name you gave the vehicle in the editor when you placed it.
----------
    Sides: Sides that are able to enter any spot in the vehicle.
    
        Uses any combination of the following sides surrounded by square brackets. If using multiple sides separate them with commas:
            east            - BLUFOR
            west            - REDFOR
            independent     - GREENFOR
            
            ex1.    [east]                          - REDFOR are able to enter the unlocked slots in the vehicle.
            ex2.    [independent, west, east]       - BLUFOR, REDFOR, and GREENFOR are able to enter the vehicle's unlocked slots.
            ex3.    []                              - All players can enter the vehicle's unlocked slots.
            
----------
    Positions: Spots in the vehicle to lock based on class. 
        
        Takes positions in an array with values of 0 or 1 for each position. 0 being unlocked and 1 being locked:
            [driver, commander, gunner, cargo]
                Driver is usually the same thing as pilot as far as ARMA is concerned. Commander is sometimes the co-pilot. Gunner is self explanatory. Cargo refers to a vehicles passengers. If a vehicle doesn't have a gunner or commander you still need to set the variable for them.
            
            ex1. [1,1,1,0]      - Driver, Commander and Gunner slots are locked by class, cargo spots are not.
            ex2. [0,1,1,0]      - Commander and Gunner slots are locked by class. Anyone can drive as long as they 
----------
    Classes: Player classes that can enter the locked positions.
        
        Player classes are the same ones used in the loadout script. In the 2D editor the player's class is shown in the top right of the window that pops up when you edit/place a player.
        
            ex1. ["B_officer_F", "B_medic_F"]       - Only BLUFOR officers and medics can enter the locked positions of the vehicle.
            ex2. ["B_officer_F"]                    - Only BLUFOR officers can enter the locked positions of the vehicle.
            ex3. []                                 - Nobody can enter the locked positions of the vehicle.
----------
    Players: The names given to playable characters in the editor. These characters will be able to enter locked slots in the vehicle regardless of their side or class.
        
        You can have as many or as few names as you want.
            
            ex1. [bluforPilot1, bluforPilot2]           - These two characters will be able to enter the locked positions of the vehicle.
            ex2. []                                     - Nobody specific characters will be able to enter the locked positions of the vehicle. Players with the correct class and side will still be able to however.
            ex3. [bluforCrewman]                        - This one character can enter locked positions of the vehicle.
----------
    Message: A custom message to display when a player isn't able to enter a locked vehicle or switch seats to a locked position.

        This is an optional message in case you want to give more information about why the player is unable to enter the vehicle for whatever reason. By default a message will pop up saying "Your class/side isn't able to access this vehicle/role.".
        
        ex1. "Only BLUFOR are allowed to access this vehicle."
----------
    Syntax: 
    [Vehicle, [Sides], [Driver, Commander, Gunner, Cargo], [Classes], [Players], "Message"]
    
    ex1: [bluforAPC, [west], [1,1,1,0], ["B_crew_F"], [], "Non-Default Lock message."]   // Only BLUFOR can be passengers. Only BLUFOR crew can drive/gun/command. Non default lock message.
    ex2: [opforAPC, [east], [0,1,1,0], ["O_crew_F"], []]   // Only OPFOR can be passengers. Only OPFOR crew can drive/gun/command. Default lock message.
    ex3: [bluforAPC, [], [1,1,1,0], ["B_crew_F"], [opforSmarty]]   // Anyone can be a passenger, but only BLUFOR crewmen can drive, gun, or command. The player named opforSmarty can also drive/gun/command the vehicle.
    ex4: [indforTruck, [independent], [0,0,0,0], [], [opforLeader]   // Only INDFOR can enter the truck. No position restrictions for them. The player named opforLeader can also enter the truck without any restrictions.
    ex5: // Separate entries by a comma and then a line break as shown below
        [bluforAPC1, [west], [1,1,1,0], ["B_crew_F"], [], "Only Warthog 1 can crew this."],
        [bluforAPC2, [west], [1,1,1,0], ["B_crew_F"], [], "Only Warthog 2 can crew this."], 
        [bluforAPC3, [west], [1,1,1,0], ["B_crew_F"], [], "Only Warthog 3 can crew this."]

        
    Syntax:
    [ Vehicle, [Sides], [Driver, Commander, Gunner, Cargo], [Classes], [Players], "Message"]
*/
// Place entries below. Make sure to separate entries with a comma and a line break!



// Always make sure there's no comma after the last entry!

// ====================================================================================

// END OF THE ARRAY CONTAING ALL VEHICLE LOCKING INFORMATION
// Do not comment or delete this line!
];

// ====================================================================================

// When true, clears the cargo of all vehicles that are handled by the locking script.
_clearVehicleCargo = true; // true OR false
