private ["_nextLoc","_locSize","_locPos","_itemSpawnMarker"];
_nextLoc = _this select 0;
_locSize = _nextLoc select 1;
_locPos  = _nextLoc select 2;
_itemSpawnMarker = "randItemsMarker";

// Move the randomloot marker
//_itemSpawnPos = getMarkerPos _itemSpawnMarker;
_itemSpawnMarker setMarkerPos _locPos;
_itemSpawnMarker setMarkerSize [sizeOfSpawnAO,sizeOfSpawnAO];//_locSize;

//Call item randomloot
[_itemSpawnMarker] execVM "f\randomloot\server.sqf";
