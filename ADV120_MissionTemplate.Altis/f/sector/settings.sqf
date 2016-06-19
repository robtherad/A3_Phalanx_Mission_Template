/*


To activate add the following line to your mission's init.sqf:

    [] execVM "f\sector\sectorInit";

*/

_sectorType = 1; // 1 - Simple Sector -- 2 - Sector Control

phx_sector_triggerArray = []; // Names of triggers separated by commas

_delay = 5; // Delay between sector checks. Lower numbers cause worse performance. Higher numbers cause longer delays for feedback to players.
