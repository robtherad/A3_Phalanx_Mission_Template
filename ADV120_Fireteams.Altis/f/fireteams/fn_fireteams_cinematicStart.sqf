// Start cinematic
_nextLoc = _this select 0;
_locName = _nextLoc select 0;
0 cutText [ format ["Fireteams - %1\nBy Fritz",_locName],"BLACK FADED", 1];

// End cinematic
sleep 3;
0 cutFadeOut 1;
