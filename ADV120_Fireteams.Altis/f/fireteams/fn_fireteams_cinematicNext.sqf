// Start cinematic
if (bWinBLUFOR == true) then {
  0 cutText [ format ["%1 won the objective.",bWinBLUFOR],"BLACK FADED", 1];
} else {
  0 cutText [ format ["Round time reached."],"BLACK FADED", 1];
};
// End cinematic
sleep 3;
0 cutFadeOut 1;
