class core {
    file = "f\core";
    class core_addKilledEH{postInit = 1;};
    class core_mpKilled{};
    class core_showTags{};
    class core_addRatingEH{postInit = 1;};
    class core_addScoreEH{postInit = 1;};
    class core_playerBoundsCheck{};
    class core_setDate{postInit = 1;};
    class core_setWeather{postInit = 1;};
};
class radios {
    file = "f\radios";
    class radio_genFreqs{postInit = 1;};
    class radio_waitGear{};
    class radio_getChannels{};
    class radio_waitRadios{};
    class radio_setRadios{};
    class radio_cleanup{};
};
class loadout {
    file = "f\loadout";
    class loadout_set{postInit = 1;};
    class loadout_notes{};
    class loadout_addItem{};
};
class gpsmarkers {
    file = "f\gpsmarkers";
    class gps_init{};
    class gps_createMarks{};
    class gps_updateMarks{};
};
class endConditions {
    file = "f\endconditions";
    class end_clientWait{};
    class end_clientTime{};
    class end_checkTime{};
    class end_checkAlive{};
};
class misc {
    file = "f\misc";
    class _clearBody{};
    class _clearContainer{};
    class _hintThenClear{};
    class serverJIP{postInit = 1;};
    class clientJIP{postInit = 1;};
    class disableCSpect{};
    class disableCJIP{};
    class disableCollisions{};
};
class sector {
    file = "f\sector";
    class createSector{};
    class pointsDisplay{};
    class sectorInit{};
    class titleTextSector{};
    class watchSector{};
};
class revive {
    file = "f\revive";
    class AddLinkedItems{};
    class SetDowned{};
    class WoundedEffect{};
    class HasWounded{};
    class EjectWounded{};
    class OnDrag{};
    class LifeTick {};
    class OnDeath {};
    class OnDamage{};
    class SetBleeding{};
    class OnRevive{};
    class OnSlowBleeding{};
};
