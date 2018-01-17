date params ["_year", "_month", "_day", "_hour", "_minute"];

_paramTime = ["phx_core_timeOfDay",-1] call BIS_fnc_getParamValue;

if !(_paramTime isEqualTo -1) then {
    // Use parameter setting
    private _sunriseSunset = [date] call BIS_fnc_sunriseSunsetTime;
    _sunriseSunset params ["_sunrise", "_sunset"];
    
    private _sunriseHour = floor (_sunrise);
    private _sunriseMinute = round((_sunrise - _sunriseHour) * 60);
    private _sunsetHour = floor (_sunset);
    private _sunsetMinute = round((_sunset - _sunsetHour) * 60);
    
    private _timeArray = switch (_paramTime) do {
        case 0: { [_sunriseHour,_sunriseMinute] }; // Sunrise
        case 1: { [12,0] }; // Noon
        case 2: { [_sunsetHour,_sunsetMinute] }; // Sunset
        case 3: { [0,0] }; // Midnight
    };
    _timeArray params ["_realHour", "_realMinute"];
    setDate [_year, _month, _day, _realHour, _realMinute];
};