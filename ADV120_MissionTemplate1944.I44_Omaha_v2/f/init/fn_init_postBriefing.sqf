//====================================================================================================
// Scripts that need to run only after players load into the game world

if (hasInterface) then {
    // Start GPS script
    call phx_fnc_gps_init;

    // Add raise/lower headset option
    call phx_fnc_core_headsetAction;
    
    // Disable environment effects
    enableEnvironment false;
    
    // Disable AI contact reports
    player setspeaker "NoVoice";
    showSubtitles false;
    enableSentences false;
    enableRadio false;
    player disableConversation true;
};

//====================================================================================================
phx_postBriefingInitFinished = true;
