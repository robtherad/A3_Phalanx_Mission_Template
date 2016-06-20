// Pass an item and it will only add it if it doesn't already exist

params ["_item"];

if !(_item in assignedItems player) then {
    player linkItem _item;
};
true
