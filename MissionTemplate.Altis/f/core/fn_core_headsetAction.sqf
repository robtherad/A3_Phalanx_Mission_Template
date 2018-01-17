// Adds an action for players to quickly adjust the volume of their TFAR radios.
// TODO: Make 'Raise Headset' restore the previous volume instead of setting it to the default. Also add an option somewhere for players to change what volume setting the headset goes to when it gets lowered. Briefing page with a clickable entry?

phx_radio_loweredHeadset = true; // Set to true so that the first use lower's the headset
phx_radio_lowerHeadsetAction = player addAction ["Lower Headset", {  
    phx_radio_loweredHeadset = !phx_radio_loweredHeadset;
    if !(phx_radio_loweredHeadset) then {
        // Lower volume
        {
            [_x,2] call TFAR_fnc_setSwVolume;
        } forEach (player call TFAR_fnc_radiosListSorted);
        player setUserActionText [phx_radio_lowerHeadsetAction, "Raise Headset"];
    } else {
        // Boost volume back up
        {
            [_x,6] call TFAR_fnc_setSwVolume;
        } forEach (player call TFAR_fnc_radiosListSorted);
        player setUserActionText [phx_radio_lowerHeadsetAction, "Lower Headset"];
    };
}, [], 0, false, true, "", "(count (player call TFAR_fnc_radiosListSorted)) > 0"];
