event_inherited();
price = global.price_endless_mod_gun;
spawnObject = obj_pickup_mod_gun;
name = "";
isMod = true;

//choose a random mod
var modIndex = irandom(ds_list_size(global.steamUGCItemsListFolder)-1);
ugcItemFolder = global.steamUGCItemsListFolder[| modIndex];
