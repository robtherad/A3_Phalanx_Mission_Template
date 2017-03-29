defenderNVG = "NVGoggles_OPFOR";
attackerNVG = "NVGoggles_BLUFOR";

aClasses =
[
	// OLD DESCRIPTION
	// 0:Description
	// 1:uniform
	// 2:vest
	// 3:backpack
	// 4:helmet
	// 5:eyewear
	// 6:weapons,
	// 7:magazines
	// 8:items
	// 9:weapon attachments
	// 10:Handgun Attachments
	// 11:init code
	// 12:condition

	// NEW DESCRIPTION
	// 0:Description
	// 1:sqf to exec
	// 2:init code

	[
		"Platoon Lead / Squad Lead"
		,"loadout\Blue_PLSL.sqf"
		,{}
	]

	,[
		"Team Lead"
		,"loadout\Blue_TL.sqf"
		,{}
	]

	,[
		"Combat Life Support"
		,"loadout\Blue_CLS.sqf"
		,{isMedic = true;}
	]

	,[
		"Automatic Rifleman"
		,"loadout\Blue_AR.sqf"
		,{}
	]

	,[
		"Assistant Automatic Rifleman"
		,"loadout\Blue_AAR.sqf"
		,{}
	]

	,[
		"Combat Engineer"
		,"loadout\Blue_CE.sqf"
		,{}
	]

	,[
		"Machine Gunner"
		,"loadout\Blue_MG.sqf"
		,{}
	]

	,[
		"Assistant Machine Gunner"
		,"loadout\Blue_AG.sqf"
		,{}
	]

	,[
		"Rifleman"
		,"loadout\Blue_R.sqf"
		,{}
	]

	//,[
	//	"UAV Operator"
	//	,"loadout\blue_uavop.sqf"
	//	,{}
	//]
];

dClasses =
[
	// OLD DESCRIPTION
	// 0:Description
	// 1:uniform
	// 2:vest
	// 3:backpack
	// 4:helmet
	// 5:eyewear
	// 6:weapons,
	// 7:magazines
	// 8:items
	// 9:weapon attachments
	// 10:Handgun Attachments
	// 11:init code
	// 12:condition

	// NEW DESCRIPTION
	// 0:Description
	// 1:sqf to exec
	// 2:init code

	[
		"Platoon Lead / Squad Lead"
		,"loadout\Red_PLSL.sqf"
		,{}
	]

	,[
		"Team Lead"
		,"loadout\Red_TL.sqf"
		,{}
	]

	,[
		"Combat Life Support"
		,"loadout\Red_CLS.sqf"
		,{isMedic = true;}
	]

	,[
		"Automatic Rifleman (RPK)"
		,"loadout\Red_AR.sqf"
		,{}
	]

	,[
		"Assistant Automatic Rifleman"
		,"loadout\Red_AAR.sqf"
		,{}
	]

	//,[
	//	"Combat Engineer"
	//	,"loadout\red_ce.sqf"
	//	,{}
	//]

	,[
		"Machine Gunner"
		,"loadout\Red_MG.sqf"
		,{}
	]

	,[
		"Assistant Machine Gunner"
		,"loadout\Red_AG.sqf"
		,{}
	]

	,[
		"Rifleman"
		,"loadout\Red_R.sqf"
		,{}
	]

	//,[
	//	"UAV Operator"
	//	,"loadout\red_uavop.sqf"
	//	,{}
	//]

	,[
		"RPG"
		,"loadout\Red_rpg.sqf"
		,{}
	]
];
