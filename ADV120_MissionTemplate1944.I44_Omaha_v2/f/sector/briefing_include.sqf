[] spawn {

waitUntil {!isNil "PHX_diary"};

private _settingsBrief ="
<br/>
<font size='18'>SETTINGS</font><br/>
This briefing section allows you to change various personal settings.
<br/><br/>
";

_settingsBrief = _settingsBrief + "
<font size='18'>UI CONTROL</font><br/>
|- <execute expression=""phx_show_timeUI = !phx_show_timeUI; if (phx_show_timeUI) then {hintsilent 'Capture UI toggled on.'} else {hintsilent 'Capture UI toggled off.'};"">
Toggle Capture Timer UI</execute><br/>
";

player createDiaryRecord ["PHX_Diary", ["PHX Settings Menu",_settingsBrief]];

};