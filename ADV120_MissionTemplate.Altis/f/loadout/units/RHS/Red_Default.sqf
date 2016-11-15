/*
    Sets the default clothing items for a side. If you want to have a certain class of unit have a unique clothing item, redefine these variables in that class's loadout script above the call to 'phx_fnc_loadout_handleClothing'.

    If the values are not redefined, the values in this file will be used.
*/

private _uniform = ["phx_loadout_opfor_uniform",0] call BIS_fnc_getParamValue;
_uniform = switch (_uniform) do {
    case 0: { // Russian TTsKO Forest
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    case 1: { // VDV Flora
        phx_loadout_uniform = "rhs_uniform_vdv_flora";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
    default {
        phx_loadout_uniform = "rhsgref_uniform_ttsko_forest";
        phx_loadout_vest = "rhsgref_6b23_ttsko_forest_rifleman";
        phx_loadout_backpack = "rhs_assault_umbts";
        phx_loadout_headgear = "rhsgref_6b27m_ttsko_forest";
    };
};
