///check_weapon_mod_owned(modID, playerID);
//Returns true if a specific player has the weapon equipped

var ugcItemId = argument0;
var player = argument1;
var toReturn = false;

if (global.weapon1_isMod[player] && global.weapon1_modId[player] == ugcItemId) toReturn = true;
else if (global.weapon2_isMod[player] && global.weapon2_modId[player] == ugcItemId) toReturn = true;

return toReturn;
