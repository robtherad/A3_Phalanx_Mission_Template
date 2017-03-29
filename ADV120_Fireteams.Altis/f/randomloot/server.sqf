if (!isServer) exitWith {};

_probability   = 100; // default 100: probability of loot spawning in %
_maxItemSpawns = 100; // default 8: max amount of spawns per building, which is limited by buildingpos number

// Show loot marker on map for debugging.
_showLootType   = true;
_showDebugStats = true;

// Classes of crates.
// Tier1,Tier2,Tier3 identifies rarity of the contents.
// Small,Med,Large identifies number of contents.
_tier1AndAbove = 40;
_tier2AndAbove = 30;
_smallCaseSize = 6;
_medCaseSize = 11;

// Classes of item rarity.
_commonAmmo = 200;
_grenades = 90;
_commonItems = 70;
_uncommonItems = 40;
_weapons = 30;
_rareItem = 15;
_extremelyRareItem = 7;

// Constants list that holds item data.
// This list contains the following data:
// [[_rarity, _name, _type, (_mag if _type == "weapon")]];
// Element 3, _mag, is used to enable spawning weapons with a mag loaded.
itemsList = [

];

/*
[_commonAmmo+80, "30Rnd_556x45_Stanag", "mag"],
[_commonAmmo+40, "CUP_30Rnd_545x39_AK_M", "mag"],
[_commonAmmo, "CUP_30Rnd_762x39_AK47_M", "mag"],
[_grenades, "SmokeShell", "item"],
[_grenades, "HandGrenade", "item"],
[_grenades, "MiniGrenade", "item"],
[_commonItems+20, "FirstAidKit", "item"],
[_commonItems, "B_AssaultPack_blk", "backpack"],
[_commonItems, "B_Carryall_mcamo", "backpack"],
[_commonItems, "B_FieldPack_blk", "backpack"],
[_commonItems, "CUP_B_CivPack_WDL", "backpack"],
[_commonItems, "CUP_B_RUS_Backpack", "backpack"],
[_commonItems, "CUP_V_B_RRV_DA2", "vest"],
[_commonItems, "CUP_V_RUS_6B3_3", "vest"],
[_commonItems-20, "Chemlight_green", "item"],
[_commonItems-20, "Chemlight_blue", "item"],
[_commonItems-20, "Chemlight_red", "item"],
[_commonItems-20, "Chemlight_yellow", "item"],
[_commonItems, "acc_flashlight", "item"],
[_uncommonItems, "MediKit", "item"],
[_uncommonItems, "Rangefinder", "item"],
[_uncommonItems, "bipod_01_F_blk", "item"],
[_weapons, "CUP_arifle_AK74", "weapon", "CUP_30Rnd_545x39_AK_M"],
[_weapons, "CUP_arifle_AK107", "weapon", "CUP_30Rnd_545x39_AK_M"],
[_weapons, "CUP_arifle_AKM", "weapon", "CUP_30Rnd_762x39_AK47_M"],
[_weapons, "CUP_arifle_G36C", "weapon", "30Rnd_556x45_Stanag"],
[_weapons, "CUP_arifle_M4A1_black", "weapon", "30Rnd_556x45_Stanag"],
[_weapons, "CUP_arifle_M16A4_Base", "weapon", "30Rnd_556x45_Stanag"],
[_rareItem, "CUP_optic_PSO_1", "item"],
[_rareItem, "CUP_optic_PSO_3", "item"],
[_rareItem, "CUP_optic_ACOG", "item"],
[_rareItem, "CUP_optic_RCO", "item"],
[_rareItem, "CUP_muzzle_snds_M16", "item"],
[_rareItem+10, "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "mag"],
[_rareItem+10, "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "mag"],
[_rareItem, "CUP_NVG_HMNVS", "item"],
[_rareItem+5, "CUP_1Rnd_HE_M203", "mag"],
[_rareItem+10, "CUP_10Rnd_762x54_SVD_M", "mag"],
[_extremelyRareItem+2, "CUP_srifle_SVD", "weapon", "CUP_10Rnd_762x54_SVD_M"],
[_extremelyRareItem+2, "CUP_lmg_M249_para", "weapon", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249"],
[_extremelyRareItem+2, "CUP_lmg_Pecheneg", "weapon", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],
[_extremelyRareItem-3, "CUP_glaunch_M32", "weapon", "CUP_1Rnd_HE_M203"],
[_extremelyRareItem-3, "CUP_glaunch_M79", "weapon", "CUP_1Rnd_HE_M203"]
*/

/* CUP ONLY ITEMS */
/*******************************************************************************
itemsList = [
    [_commonAmmo+80, "30Rnd_556x45_Stanag", "mag"],
    [_commonAmmo+40, "CUP_30Rnd_545x39_AK_M", "mag"],
    [_commonAmmo, "CUP_30Rnd_762x39_AK47_M", "mag"],
    [_grenades, "SmokeShell", "item"],
    [_grenades, "HandGrenade", "item"],
    [_grenades, "MiniGrenade", "item"],
    [_commonItems+20, "FirstAidKit", "item"],
    [_commonItems, "B_AssaultPack_blk", "backpack"],
    [_commonItems, "B_Carryall_mcamo", "backpack"],
    [_commonItems, "B_FieldPack_blk", "backpack"],
    [_commonItems, "CUP_B_CivPack_WDL", "backpack"],
    [_commonItems, "CUP_B_RUS_Backpack", "backpack"],
    [_commonItems, "CUP_V_B_RRV_DA2", "vest"],
    [_commonItems, "CUP_V_RUS_6B3_3", "vest"],
    [_commonItems, "Chemlight_green", "item"],
    [_commonItems, "Chemlight_blue", "item"],
    [_commonItems, "Chemlight_red", "item"],
    [_commonItems, "Chemlight_yellow", "item"],
    [_commonItems, "acc_flashlight", "item"],
    [_commonItems, "CUP_acc_Flashlight", "item"],
    [_uncommonItems, "MediKit", "item"],
    [_uncommonItems, "Rangefinder", "item"],
    [_uncommonItems, "bipod_01_F_blk", "item"],
    [_weapons, "CUP_arifle_AK74", "weapon", "CUP_30Rnd_545x39_AK_M"],
    [_weapons, "CUP_arifle_AK107", "weapon", "CUP_30Rnd_545x39_AK_M"],
    [_weapons, "CUP_arifle_AKM", "weapon", "CUP_30Rnd_762x39_AK47_M"],
    [_weapons, "CUP_arifle_G36C", "weapon", "30Rnd_556x45_Stanag"],
    [_weapons, "CUP_arifle_M4A1_black", "weapon", "30Rnd_556x45_Stanag"],
    [_weapons, "CUP_arifle_M16A4_Base", "weapon", "30Rnd_556x45_Stanag"],
    [_rareItem, "CUP_optic_PSO_1", "item"],
    [_rareItem, "CUP_optic_PSO_3", "item"],
    [_rareItem, "CUP_optic_ACOG", "item"],
    [_rareItem, "CUP_optic_RCO", "item"],
    [_rareItem, "CUP_muzzle_snds_M16", "item"],
    [_rareItem, "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "mag"],
    [_rareItem, "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "mag"],
    [_rareItem, "CUP_NVG_HMNVS", "item"],
    [_rareItem, "CUP_1Rnd_HE_M203", "mag"],
    [_rareItem, "CUP_10Rnd_762x54_SVD_M", "mag"],
    [_extremelyRareItem, "CUP_srifle_SVD", "weapon", "CUP_10Rnd_762x54_SVD_M"],
    [_extremelyRareItem, "CUP_lmg_M249_para", "weapon", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249"],
    [_extremelyRareItem, "CUP_lmg_Pecheneg", "weapon", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],
    [_extremelyRareItem, "CUP_glaunch_M32", "weapon", "CUP_1Rnd_HE_M203"],
    [_extremelyRareItem, "CUP_glaunch_M79", "weapon", "CUP_1Rnd_HE_M203"]
];
*******************************************************************************/

/* RHS ONLY ITEMS */
/*******************************************************************************
itemsList = [
    [280, "30Rnd_556x45_Stanag", "mag"],
    [240, "CUP_30Rnd_545x39_AK_M", "mag"],
    [200, "CUP_30Rnd_762x39_AK47_M", "mag"],
    [90, "SmokeShell", "item"],
    [90, "HandGrenade", "item"],
    [90, "MiniGrenade", "item"],
    [90, "FirstAidKit", "item"],
    [70, "Binocular", "item"],
    [70, "B_AssaultPack_blk", "backpack"],
    [70, "B_Carryall_mcamo", "backpack"],
    [70, "B_FieldPack_blk", "backpack"],
    [70, "CUP_B_CivPack_WDL", "backpack"],
    [70, "CUP_B_RUS_Backpack", "backpack"],
    [70, "CUP_V_B_RRV_DA2", "vest"],
    [70, "CUP_V_RUS_6B3_3", "vest"],
    [70, "Chemlight_green", "item"],
    [70, "Chemlight_blue", "item"],
    [70, "Chemlight_red", "item"],
    [70, "Chemlight_yellow", "item"],
    [70, "acc_flashlight", "item"],
    [70, "CUP_acc_Flashlight", "item"],
    [60, "MediKit", "item"],
    [45, "Rangefinder", "item"],
    [40, "CUP_optic_PSO_1", "item"],
    [40, "CUP_optic_PSO_3", "item"],
    [40, "CUP_optic_ACOG", "item"],
    [40, "CUP_optic_RCO", "item"],
    [40, "CUP_muzzle_snds_M16", "item"],
    [40, "bipod_01_F_blk", "item"],
    [20, "CUP_arifle_AK74", "weapon", "CUP_30Rnd_545x39_AK_M"],
    [20, "CUP_arifle_AK107", "weapon", "CUP_30Rnd_545x39_AK_M"],
    [20, "CUP_arifle_AKM", "weapon", "CUP_30Rnd_762x39_AK47_M"],
    [20, "CUP_arifle_G36C", "weapon", "30Rnd_556x45_Stanag"],
    [20, "CUP_arifle_M4A1_black", "weapon", "30Rnd_556x45_Stanag"],
    [20, "CUP_arifle_M16A4_Base", "weapon", "30Rnd_556x45_Stanag"],
    [19, "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "mag"],
    [19, "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "mag"],
    [19, "CUP_NVG_HMNVS", "item"],
    [19, "CUP_1Rnd_HE_M203", "mag"],
    [19, "CUP_10Rnd_762x54_SVD_M", "mag"],
    [7, "CUP_srifle_SVD", "weapon", "CUP_10Rnd_762x54_SVD_M"],
    [7, "CUP_lmg_M249_para", "weapon", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249"],
    [7, "CUP_lmg_Pecheneg", "weapon", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],
    [4, "CUP_glaunch_M32", "weapon", "CUP_1Rnd_HE_M203"],
    [4, "CUP_glaunch_M79", "weapon", "CUP_1Rnd_HE_M203"]
];

itemsHighlyCommon = [
    ["Binocular", "item"],
    ["FirstAidKit", "item"],
    ["B_AssaultPack_blk", "backpack"],
    ["B_Carryall_mcamo", "backpack"],
    ["B_FieldPack_blk", "backpack"],
    ["MNP_B_ROK_KB", "backpack"],
    ["MNP_B_RU1_FP", "backpack"],
    ["Chemlight_green", "item"],
    ["Chemlight_blue", "item"],
    ["Chemlight_red", "item"],
    ["Chemlight_yellow", "item"],
    ["MNP_Vest_USMC_Xtreme_A", "vest"],
    ["MNP_Vest_UKR_A", "vest"],
    ["acc_flashlight", "item"],
    ["rhs_acc_2dpZenit", "item"]
];

itemsCommon = [
    ["rhs_mag_30Rnd_556x45_Mk318_Stanag", "mag"],
    ["rhs_30Rnd_762x39mm", "mag"]
];

itemsUncommon = [
    ["Rangefinder", "item"],
    ["ToolKit", "item"],
    ["MediKit", "item"],
    ["ItemGPS", "item"],
    ["rhs_acc_pso1m2", "item"],
    ["rhsusf_acc_rotex5_grey", "item"],
    ["rhsusf_acc_ACOG_USMC", "item"],
    ["rhsusf_acc_harris_bipod", "item"],
    ["SmokeShell", "item"],
    ["HandGrenade", "item"],
    ["MiniGrenade", "item"]
];

itemsHighlyUncommon = [
    ["rhs_weap_ak103", "weapon"],
    ["rhs_weap_akm", "weapon"],
    ["rhs_weap_akms", "weapon"],
    ["rhs_weap_m4_carryhandle", "weapon"],
    ["rhs_weap_m4a1_carryhandle", "weapon"],
    ["rhs_weap_m16a4_carryhandle", "weapon"]
];

itemsRare = [
    ["NVGoggles", "item"],
    ["rhs_10Rnd_762x54mmR_7N1", "mag"],
    ["rhsusf_100Rnd_556x45_M200_soft_pouch", "mag"],
    ["rhs_100Rnd_762x54mmR", "mag"]
];

itemsExtremelyRare = [
    ["rhs_weap_M136_hedp", "weapon"],
    ["rhs_weap_svd", "weapon"],
    ["rhs_weap_m249_pip_L", "weapon"],
    ["rhs_weap_pkp", "weapon"]
];
*******************************************************************************/

// Exclude buildings from loot spawn. Use 'TYPEOF' to find building name
exclusionList=[];
// ["Land_Pier_F","Land_Pier_small_F","Land_NavigLight","Land_LampHarbour_F"];

debugItems = {
  _debugItemCount = [];
  {
    _debugItemCount pushBack 0;
  } foreach itemsList;

  { // foreach in _itemSpawnList
    _spawn = _X;
    _items = _spawn select 3;
    {
      _item = _X;
      _count = 0;
      while {((itemsList select _count) select 1) != (_item select 1)} do {
        _count = _count + 1;
      };
      _debugItemCount set [_count,(_debugItemCount select _count)+1];
    } foreach _items;
  } foreach _itemSpawnList;

  _count = 0;
  _numItems = count itemsList;
  while {_count < _numItems} do {
    _id=format ["%1",[0,40*_count,0]];
    _debug=createMarker [_id,[0,40*_count,0]];
    _debug setMarkerShape "ICON";
    _debug setMarkerType "hd_dot";
    _debug setMarkerColor "ColorRed";
    _txt=format ["%1, %2%4, %3",(itemsList select _count) select 1,(((itemsList select _count) select 0) / tRarity)*100,_debugItemCount select _count,"%"];
    _debug setMarkerText _txt;
    _count = _count + 1;
  };

  _id=format ["%1",[0,-40,0]];
  _debug=createMarker [_id,[0,-40,0]];
  _debug setMarkerShape "ICON";
  _debug setMarkerType "hd_dot";
  _debug setMarkerColor "ColorRed";
  _txt=format ["Houses %1",_numHouses];
  _debug setMarkerText _txt;

};

totalRarity = {
  private ["_totalRarity", "_item"];
  _totalRarity = 0;

  { // foreach in itemsList
    _item = _X;
    _totalRarity = _totalRarity + (_item select 0);
  } foreach itemsList;

  _totalRarity
};

tRarity = [] call totalRarity;

// END CONSTANTS
//******************************************************************************

findHouses = {
  private ["_mkr","_pos","_mkrY","_mkrX","_distance","_houseList"];
  _mkr = (_this select 0);
  _mkr setmarkerAlpha 0;
  _pos = markerpos _mkr;
  _mkrY= getmarkerSize _mkr select 0;
  _mkrX= getmarkerSize _mkr select 1;

  _distance = _mkrX;
  if (_mkrY > _mkrX) then {
  	_distance=_mkrY;
  };

  _houseList = _pos nearObjects ["House",_distance];
  _houseList
};

checkShouldSpawn = {
  private ["_house", "_numHouses", "_shouldSpawn"];
  _house = _this select 0;
  _numHouses = _this select 1;
  _shouldSpawn = true;

  // Don't spawn for some buildings if too many buildings in the AO.
  if (300 < random _numHouses) then {_shouldSpawn = false};

  // Don't spawn if building is excluded from spawns.
  if (typeOf _house in exclusionList) then {_shouldSpawn = false};

  _shouldSpawn
};

checkSpawnMultiplier = {
  private ["_numHouses", "_spawnMultiplier", "_cap"];
  _numHouses = _this select 0;

  _cap = 250;
  if (_numHouses > _cap) then {
    _spawnMultiplier = 1.0;
  } else {
    _spawnMultiplier = _cap / _numHouses;
  };
  _spawnMultiplier
};

checkNumItemSpawns = {
  private ["_buildingSize", "_house", "_numItemSpawns"];
  _house = _this select 0;

  // Figure out max num of items that can be placed in this building.
  _buildingSize = sizeOf (typeOf _house);
  _numItemSpawns = floor ((count (_house buildingPos -1)) * _spawnMultiplier);

  // Item spawns can be capped by _maxItemSpawns.
  if (_numItemSpawns > _maxItemSpawns) then {_numItemSpawns = _maxItemSpawns};

  _numItemSpawns
};

selectRandomItem = {
  private ["_rarity"];
  _randomRarity = random tRarity;
  _currentRarity = 0;
  _item = { // foreach in itemsList
    _item = _X;
    _rarity = _item select 0;
    if ((_randomRarity > _currentRarity) && (_randomRarity < (_currentRarity + _rarity))) exitWith {_item};
    _currentRarity = _currentRarity + _rarity;
  } foreach itemsList;
  _item
};

spawnItem = {
  private ["_rarity", "_name", "_type", "_mag"];
  _holder = _this select 0;
  _item = _this select 1;
  _rarity = _item select 0;
  _name = _item select 1;
  _type = _item select 2;
  _mag = "";
  if (_type == "weapon") then {_mag = _item select 3;};
  switch (_type) do {
		case "weapon": {
			_weapon= _this select 0;
			_holder addWeaponCargoGlobal [_name, 1];
		};
		case "mag": {
			_magazines= _this select 0;
			_holder addMagazineCargoGlobal [_name, 1];
		};
		case "item": {
			_item= _this select 0;
			_holder addItemCargoGlobal [_name, 1];
		};
		case "vest": {
			_vest= _this select 0;
			_holder addItemCargoGlobal [_name, 1];
		};
		case "backpack": {
			_backpack= _this select 0;
			_holder addBackpackCargoGlobal [_name, 1];
		};
	};
};

checkLowestRarity = {
  // Params: [_lowestRarity, _rarity]
  private ["_lowestRarity", "_rarity", "_newLowest"];
  _lowestRarity = _this select 0;
  _rarity = _this select 1;
  _newLowest = _lowestRarity;
  if (_rarity < _lowestRarity) then {
    _newLowest = _rarity;
  };
  _newLowest
};

defineCrate = {
  private ["_lowestRarity", "_sumOfItems"];
  _lowestRarity = _this select 0;
  _sumOfItems = _this select 1;
  _case = "Box_NATO_Ammo_F"; // default case
  if (_lowestRarity >= _tier1AndAbove) then {
    // Fork based on number of contents.
    if (_sumOfItems < _smallCaseSize) then {_case = "Box_NATO_Ammo_F"};
    if ((_smallCaseSize <= _sumOfItems) && (_sumOfItems < _medCaseSize)) then {_case = "Box_NATO_Wps_F"};
    if (_medCaseSize <= _sumOfItems) then {_case = "Box_NATO_WpsSpecial_F"};
  } else {
    if (_lowestRarity >= _tier2AndAbove) then {
      // Fork based on number of contents.
      if (_sumOfItems < _smallCaseSize) then {_case = "Box_IND_Ammo_F"};
      if ((_smallCaseSize <= _sumOfItems) && (_sumOfItems < _medCaseSize)) then {_case = "Box_IND_Wps_F"};
      if (_medCaseSize <= _sumOfItems) then {_case = "Box_IND_WpsSpecial_F"};
    } else {
      // Fork based on number of contents.
      if (_sumOfItems < _smallCaseSize) then {_case = "Box_East_Ammo_F"};
      if ((_smallCaseSize <= _sumOfItems) && (_sumOfItems < _medCaseSize)) then {_case = "Box_East_Wps_F"};
      if (_medCaseSize <= _sumOfItems) then {_case = "Box_East_WpsSpecial_F"};
    };
  };
  _case
};

caseMarker = {
  private ["_case"];
  _case = _this select 0;
  switch (_case) do {
    case "Box_NATO_Ammo_F": {_marker = "A1";};
    case "Box_NATO_Wps_F": {_marker = "A2";};
    case "Box_NATO_WpsSpecial_F": {_marker = "A3";};
    case "Box_IND_Ammo_F": {_marker = "B1";};
    case "Box_IND_Wps_F": {_marker = "B2";};
    case "Box_IND_WpsSpecial_F": {_marker = "B3";};
    case "Box_East_Ammo_F": {_marker = "C1";};
    case "Box_East_Wps_F": {_marker = "C2";};
    case "Box_East_WpsSpecial_F": {_marker = "C3";};
  };
  _marker
};

showMarker = {
  private ["_crate", "_crateType", "_pos", "_marker", "_id", "_debug", "_txt"];
  _crate = _this select 0;
  _crateType = _this select 1;
  _pos = _this select 2;
  _marker = [_crateType] call caseMarker;

  _id=format ["%1",_pos];
  _debug=createMarker [_id,GETPOS _crate];
  _debug setMarkerShape "ICON";
  _debug setMarkerType "hd_dot";
  _debug setMarkerColor "ColorRed";
  _txt=format ["%1",_marker];
  _debug setMarkerText _txt;
};

// Determine all items to be spawned and store that info in this list.
// This list contains the following data:
// [[_house, _buildingPos, _crateType, [_item0, ..., _itemN]]];
_itemSpawnList = [];

_marker = _this select 0;
_houseList = [_marker] call findHouses;
_numHouses = count _houseList;

_spawnMultiplier = [_numHouses] call checkSpawnMultiplier;

{ // foreach in _houseList

  // Construct a _currentHouseList, which contains:
  // [_house, _buildingPos, _crateType, [_item0, ..., _itemN]];
  // This list will be fully populated at the end of an iteration of the loop.
  _currentHouseList = [];

  _house=_X;
  _shouldSpawn = [_house, _numHouses] call checkShouldSpawn;

  if (_shouldSpawn) then {
    _randomBuildingPos = floor random (count (_house buildingPos -1));

    // Exit if selected pos is invalid.
    _buildingPos = _house buildingPos _randomBuildingPos;
    if (str _buildingPos == "[0,0,0]") exitwith {};

    // Construct a _crateItemList, which contains:
    // [_item0, ..., _itemN];
    _crateItemList = [];

    _numItemSpawns = [_house] call checkNumItemSpawns;
    _lowestRarity = 10000; // Set to a rediculously high number.
    _sumOfItems = 0;
  	for "_n" from 1 to _numItemSpawns do {
      // Don't spawn sometimes based on probability of spawning.
      // Disable for now...
      //if (_probability > random 100) then {
        _sumOfItems = _sumOfItems + 1;

        // New cool way of spawning using crates!
        _item = [] call selectRandomItem;
        _lowestRarity = [_lowestRarity, _item select 0] call checkLowestRarity;
        _crateItemList pushBack _item;
  		//};
  	};
    _crateType = [_lowestRarity, _sumOfItems] call defineCrate;

    _currentHouseList pushBack _house;
    _currentHouseList pushBack _randomBuildingPos;
    _currentHouseList pushBack _crateType;
    _currentHouseList pushBack _crateItemList;

    _itemSpawnList pushBack _currentHouseList;
  };

} foreach _houseList;

if (_showDebugStats) then {
  [] call debugItems;
};

{ // foreach in _itemSpawnList
  _spawn = _X;
  _house = _spawn select 0;
  _buildingPos = _spawn select 1;
  _crateType = _spawn select 2;
  _items = _spawn select 3;

  // Load parameters
  _pos=	_house buildingPos _buildingPos;
  _pos0=	(_pos select 0);
  _pos1=	(_pos select 1);
  _pos2=	(_pos select 2);
  //_size=  sizeOf _house;

  // Determine Z placement for item
  _BARREL = createVehicle ["Land_BarrelEmpty_F",[_pos0,_pos1,_pos2+0.1], [], 0, "can_Collide"];
  sleep 0.5;
  _crate = createVehicle [_crateType,[_pos0,_pos1,(getposATL _BARREL select 2) + 0.05], [], 0, "can_Collide"];
  deletevehicle _BARREL;
  if (_showLootType) then {
    [_crate, _crateType, _pos] call showMarker;
  };

  // Clear any default contents
  clearMagazineCargoGlobal _crate;
  clearWeaponCargoGlobal _crate;
  clearItemCargoGlobal _crate;
  _crate setAmmoCargo 0; // This is supposed to disable the "Rearm" option. Im not sure if it does yet. Haven't verified.

  {
    _item = _X;
    [_crate, _item] call spawnItem;
  } foreach _items;

} foreach _itemSpawnList;
