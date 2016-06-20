#include "settings.sqf"

if (isServer) then {
    call phx_fnc_createSector;
};

// Only add points and time display to clients when the mission uses sector control type
if (hasInterface && {_sectorType isEqualTo 2}) then {
    call phx_fnc_pointsDisplay;
    phx_end_clientTime = [phx_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
    
    // Add briefing note
    #include "briefing_include.sqf"
};