_cargoArray = [

// ====================================================================================
/*
    All entries should be in the following format:
    [ [Vehicles],
    [Weapons],
    [Magazines],
    [Items],
    [Backpacks] ]

----------
    Vehicles: The name(s) of the vehicle(s) that you want to handle the cargo for.

        Uses the same names you gave the vehicles in the editor when you placed them.

        ex1: [ [apc1,apc2,apc3,apc4], // Handle cargo for 4 apcs
        ex2: [ [opforTruck], // Handle cargo for only 1 truck
----------
    Weapons: An array containing sub-arrays of weapons that you want added.

        Sub-array format: [Weapon String, Count]

        Weapon String: The class name of the weapon you want added.
        Count: The number of weapons you want added to the

        ex1: [ ["rhs_weap_m4a1_carryhandle",2], ["rhs_weap_akm",2] ], // Adds 2 m4s, and 2 akms to the vehicles.
        ex2: [ ], // Adds nothing
----------
    Magazines: An array containing sub-arrays of magazines that you want added.

        Sub-array format: [Magazine String, Count]

        Magazine String: The class name of the magazine you want added.
        Count: The number of magazines you want added to the

        ex1: [ ["rhs_mag_30Rnd_556x45_Mk318_Stanag",20], ["rhs_30Rnd_762x39mm",20] ],
        ex2: [ ], // Adds nothing
----------
    Items: An array containing sub-arrays of items that you want added.

        Sub-array format: [Item String, Count]

        Item String: The class name of the item you want added.
        Count: The number of items you want added to the

        ex1: [ ["ItemGPS",5], ["FirstAidKit",20] ],
        ex2: [ ], // Adds nothing
----------
    Backpacks: An array containing sub-arrays of backpacks that you want added.

        Sub-array format: [Backpack String, Count]

        Backpack String: The class name of the backpack you want added.
        Count: The number of backpacks you want added to the

        ex1: [ ["B_AssaultPack_rgr",5], ["B_FieldPack_khk",5] ] ]
        ex2: [ ], // Adds nothing
----------
    Syntax:
    [ [Vehicles],
    [Weapons],
    [Magazines],
    [Items],
    [Backpacks] ]

        ex1: // Add various items to the listed vehicles
        [ [apc1,apc2,apc3,apc4],
        [ ["rhs_weap_m4a1_carryhandle",2], ["rhs_weap_akm",2] ],
        [ ["rhs_mag_30Rnd_556x45_Mk318_Stanag",20], ["rhs_30Rnd_762x39mm",20] ],
        [ ["ItemGPS",5], ["FirstAidKit",20] ],
        [ ["B_AssaultPack_rgr",5], ["B_FieldPack_khk",5] ] ]

        ex 2: // Add only 5 AKMs to the listed vehicle
        [ [opforTruck],
        [ ["rhs_weap_akm",5] ],
        [ ],
        [ ],
        [ ] ]

        ex 3: // Add nothing to vehicles. Just clear vanilla cargo.
        [ [heli1,heli2,heli3,truck1,truck2,truck3],
        [ ],
        [ ],
        [ ],
        [ ] ]

    Syntax:
    [ [Vehicles],
    [Weapons],
    [Magazines],
    [Items],
    [Backpacks] ]
*/
// Place entries below. Make sure to separate entries with a comma and a line break!




// Always make sure there's no comma after the last entry!

// ====================================================================================

// END OF THE ARRAY CONTAING ALL VEHICLE LOCKING INFORMATION
// Do not comment or delete this line!
];
