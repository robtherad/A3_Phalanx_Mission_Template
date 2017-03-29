_faded = _this select 0;
_skipTime = _this select 1;
_randOvercast = _this select 2;
_randFog = _this select 3;

// Change time of day
if (_faded) then {
    [_skipTime] spawn {
        _skipTime = _this select 0;
        _skipTimeInterval = 0.03333;
        _timeSkipped = 0;
        while {_timeSkipped < _skipTime} do {
            _timeSkipped = _timeSkipped + _skipTimeInterval;
            skipTime _skipTimeInterval;
            sleep 0.001;
        };
    };
} else {
    skipTime _skipTime;
};

// Change overcast
if (_faded) then {
    50 setOvercast _randOvercast;
} else {
    1 setOvercast _randOvercast;
};

// Change fog
if (_faded) then {
    50 setFog _randFog;
} else {
    1 setFog _randFog;
};