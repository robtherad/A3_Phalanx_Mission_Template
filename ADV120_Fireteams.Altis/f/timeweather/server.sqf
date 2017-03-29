_faded = _this select 0; // Whether to gradually or instantly change

// Time of day
_skipTime = (random 24);

// Overcast
_randOvercast = 0.0;

_currentTime = floor daytime;
_newTime = _currentTime + _skipTime;
if ((_newTime > 5.0) && (_newTime < 17.0)) then {
    // Daytime allows for any overcast setting from 0.8 to 0.0
    _randOvercast = (random 80) / 100.0;
} else {
    // Don't overcast in nighttime
    _randOvercast = 0.0;
};

// Fog
_randFog = 0.0;

_thereWillBeFog = random 100;
if (_thereWillBeFog > 80) then {
    // Only 20 percent chance of fog
    _randFog = ((random 80) + 10) / 100.0;
} else {
    _randFog = 0.0;
};

// Execute on all machines
[[[_faded, _skipTime, _randOvercast, _randFog],"f\timeweather\client.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;
