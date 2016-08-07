// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (hasInterface && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================
// Create Phalanx Diary Entry
PHX_Diary = player createDiarySubject ["PHX_Diary", "[PHX] Misc Info"];
player createDiaryRecord ["PHX_Diary", ["Bug Reports", "  This mission uses the Phalanx Mission Template. If you notice any bugs please contact robtherad via discord or send an email to robtherad@gmail.com with as much information as you can. Please include the mission name and version."]];

// ====================================================================================
// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (isMultiplayer) then {
    if (serverCommandAvailable "#kick") then {
        #include "f\briefing\f_briefing_admin.sqf"
    };
} else {
    #include "f\briefing\f_briefing_admin.sqf"
};
// ====================================================================================
