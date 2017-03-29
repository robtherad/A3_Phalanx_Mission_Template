private ["_bGiveWeapons", "_aClassSide", "_currentClass", "_i", "_magCount", "_tempBackpackItems", "_backpack"];

//Set the 'finished' flag to false
gearAssigned = false;

//Get the give weapons param value
_bGiveWeapons = _this select 0;

//Figure out what class/side the player is going to be for the next round
_aClassSide = nextAttackerSide;
if (_bGiveWeapons) then
{
	_aClassSide = attackerSide;
};
_currentClass = currentDClass;
if (_aClassSide == sidePlayer) then
{
	_currentClass = currentAClass;
};

//Strip the player
removeAllWeapons player;
removeUniform player;
removeBackPack player;
removeVest player;
removeHeadGear player;
removeAllAssignedItems player;
removeGoggles  player;
isMedic = false;

sleep .1;

// Call init code (ex: isMedic = true;) - No idea why this is important
[] call (_currentClass select 2);

//Determine whether or not to give the player weapons
if (_bGiveWeapons) then
{
	//Yep, call the loadout/*.sqf file
	execVM (_currentClass select 1);
	[] call fnc_addRadio;
	hint "Loadout completed";
}
else
{
	//Nope, give them the basic outfit so they're not naked at spawn
	currentUniform = "U_B_CombatUniform_mcam";
	player forceAddUniform "U_B_CombatUniform_mcam";
	player addVest "V_PlateCarrier2_rgr";
	player addHeadgear "H_HelmetB";
	player addWeapon "ItemMap";
	player addWeapon "ItemCompass";
	player addWeapon "ItemWatch";
	player addWeapon "ItemGPS";
};

//Determine whether or not to issue nightVision
/*if ((!(_bGiveWeapons)) && (nightVision >= 0)) then
{
	player linkItem attackerNVG;
}
else
{
	if ((nightVision > 0) && (_aClassSide == sidePlayer)) then
	{
		player linkItem attackerNVG;
	}
	else
	{
		if (nightVision > 1) then
		{
			player linkItem defenderNVG;
		};
	};
};*/

//Set the 'finished' flag to true
gearAssigned = true;
