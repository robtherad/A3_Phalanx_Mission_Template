if (isNull spectateUnit) then {
  isSpectating = true;
  [player,player,true,true,true] call f_fnc_CamInit;
} else {
  if (spectateUnit == player) then {
    isSpectating = false;
    [] call f_fnc_ForceExit;
    [player, false] call TFAR_fnc_forceSpectator;
  } else {
    isSpectating = true;
    [player,player,true,true,true] call f_fnc_CamInit;
  };
};
