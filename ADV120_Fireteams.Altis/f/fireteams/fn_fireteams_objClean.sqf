private ["_oldObjMarkerName","_oldObj"];
_oldObjMarkerName = format ["objHold%1", objNumber];
_oldObj = createMarker [_oldObjMarkerName, getMarkerPos "phx_sector_1"];
_oldObj setMarkerShape "ELLIPSE";
_oldObj setMarkerSize [sizeOfSpawnAO, sizeOfSpawnAO];
_oldObj setMarkerBrush "SolidBorder";
_oldObj setMarkerColor (getMarkerColor "phx_sector_1");

/*
// Clean up vehicles that somehow weren't cleaned at end of round
[] call fnc_cleanUpVehicles;

// Clean up dead bodies
{
  if (!isNull _x) then
  {
    if (_x isKindOf "MAN") then
    {
      if (!isPlayer _x) then
      {
        deleteVehicle _x;
      }
      else
      {
        [_x] spawn fnc_DeleteOldBody;
      };
    };
  };
} forEach allDead;

// Clean up other objects near previous objective and spawns
_toDelete = nearestObjects [markerPos "mrkObj1", _deleteTypes, deleteRadius];
_toDelete = _toDelete + ((markerPos "mrkObj1") nearObjects ["Default", deleteRadius]); // fix for bug with detecting satchels
_toDelete = _toDelete + nearestObjects [getPos westMenuFlag, _deleteTypes, 100];
_toDelete = _toDelete + nearestObjects [getPos eastMenuFlag, _deleteTypes, 100];
for "_i" from 0 to ((count _toDelete) - 1) do
{
  deleteVehicle (_toDelete select _i);
};
*/
