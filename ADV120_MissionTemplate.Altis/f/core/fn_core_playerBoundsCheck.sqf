// Check if player is out of bounds - Requires a trigger named 'phx_missionAreaTrig' to exist
_playerInBounds = [phx_missionAreaTrig, player] call BIS_fnc_inTrigger;
if (isNil "phx_playerWarnedCount") then {phx_playerWarnedCount = 0};
if (!_playerInBounds && {isNil "phx_isSpectator"}) then {
    phx_playerWarnedCount = phx_playerWarnedCount + 1;
    titleText ["WARNING!\n\nYou are outside of the mission area. Return immediately or YOU WILL BE KILLED!","PLAIN"];
    //Give player 5 iterations to get back into the playable area
    if (phx_playerWarnedCount > 5) then {
        player setDamage 1;
    };
} else {
    //reset player warning count since he's back in bounds
    if (phx_playerWarnedCount > 0) then {
        titleText ["","PLAIN DOWN",0.1];
        phx_playerWarnedCount = 0;
    };
    //player is a spectator, exit this PFH loop
    if (!isNil "phx_isSpectator") then {
        [phx_playerBoundsCheck_PFH] call CBA_fnc_removePerFrameHandler;
    };
};