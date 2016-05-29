date params ["_year", "_month", "_day", "_hour", "_minute"];

_paramTime = ["phx_core_weatherSettings",-1] call BIS_fnc_getParamValue;
if !(_paramTime isEqualTo -1) then {
    switch (_paramTime) do {
        case 0: { 0 setFog 0.4; 0 setRain 0; 0 setOvercast 0.4; }; // Light Fog
        case 1: { 0 setFog 0.8; 0 setRain 0; 0 setOvercast 0.8; }; // Fog
        case 2: { 0 setRain 0.4; }; // Light Rain
        case 3: { 0 setRain 1; }; // Rain
        case 4: { 0 setRain 0; 0 setFog 0; 0 setOvercast 0;}; // Clear
    };
};