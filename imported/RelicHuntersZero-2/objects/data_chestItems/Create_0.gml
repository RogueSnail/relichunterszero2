///Create the item pools

event_inherited();

//Weapons //////////////////
weapons[1] = ds_list_create();
ds_list_add(weapons[1], 
    obj_pickup_shotgun,
    obj_pickup_submachinegun,
    obj_pickup_pistol_heavy,
    obj_pickup_assault_rifle_crude,
    obj_pickup_pistol_bouncer
);

weapons[2] = ds_list_create();
ds_list_add(weapons[2], 
    obj_pickup_pistol_bouncer,
    obj_pickup_bouncer,
    obj_pickup_machinegun,
    obj_pickup_assault_rifle,
    obj_pickup_shotgun_heavy,
    obj_pickup_pistol_plasma,
    obj_pickup_sniper_rifle,
    obj_pickup_rocketlauncher,
    obj_pickup_pistol_relic,
    obj_pickup_flakCannon,
    obj_pickup_minigun
);

weapons[3] = ds_list_create();
ds_list_add(weapons[3], 
    obj_pickup_smg_plasma,
    obj_pickup_smg_relic,
    obj_pickup_rocketlauncher_relic,
    obj_pickup_rifle_relic,
    obj_pickup_sniper_relic,
    obj_pickup_shotgun_relic,
    obj_pickup_pistol_relic,
    obj_pickup_pistol_plasma,
    obj_pickup_minigun_relic,
    obj_pickup_relicCannon
);

// add as much mod weapons as available
// check if player 1 or 2 have this mod already
for (var modIndex = 0; modIndex < ds_list_size(global.steamUGCItemsList); modIndex++) {
	var modData = global.steamUGCItemsDataMap[? global.steamUGCItemsList[| modIndex]];
	
	//only gun mods exist so far
	if (modData[? "type"] != "gun") continue;
	if (check_weapon_mod_owned(modData[? "id"],1)) continue;
	if (global.playerCount == 2 && check_weapon_mod_owned(modData[? "id"],2)) continue;

	ds_list_add(weapons[1], obj_pickup_mod_gun);
	ds_list_add(weapons[2], obj_pickup_mod_gun);
	ds_list_add(weapons[3], obj_pickup_mod_gun);
}

//Relics //////////////////////
relics[1] = ds_list_create();

if (!global.relic_watchful_eye) ds_list_add(relics[1], obj_relic_watchful_eye);
if (!global.relic_alcoholic_carrot) ds_list_add(relics[1], obj_relic_alcoholic_carrot);
if (!global.relic_infinity_battery) ds_list_add(relics[1], obj_relic_infinity_battery);
if (!global.relic_morning_star) ds_list_add(relics[1], obj_relic_morning_star);
if (!global.relic_mega_quantum_chip) ds_list_add(relics[1], obj_relic_mega_quantum_chip);

relics[2] = ds_list_create();

if (!global.relic_watchful_eye) ds_list_add(relics[2], obj_relic_watchful_eye);
if (!global.relic_alcoholic_carrot) ds_list_add(relics[2], obj_relic_alcoholic_carrot);
if (!global.relic_infinity_battery) ds_list_add(relics[2], obj_relic_infinity_battery);
if (!global.relic_morning_star) ds_list_add(relics[2], obj_relic_morning_star);
if (!global.relic_yottabyte_drive) ds_list_add(relics[2], obj_relic_yottabyte_drive);
if (!global.relic_pineapple_pudding) ds_list_add(relics[2], obj_relic_pineapple_pudding);
if (!global.relic_pineapple_pie) ds_list_add(relics[2], obj_relic_pineapple_pie);
if (!global.relic_midnight_beer) ds_list_add(relics[2], obj_relic_midnight_beer);
if (!global.relic_rabbit_foot) ds_list_add(relics[2], obj_relic_rabbit_foot);

relics[3] = ds_list_create();

if (!global.relic_watchful_eye) ds_list_add(relics[3], obj_relic_watchful_eye);
if (!global.relic_alcoholic_carrot) ds_list_add(relics[3], obj_relic_alcoholic_carrot);
if (!global.relic_infinity_battery) ds_list_add(relics[3], obj_relic_infinity_battery);
if (!global.relic_morning_star) ds_list_add(relics[3], obj_relic_morning_star);
if (!global.relic_yottabyte_drive) ds_list_add(relics[3], obj_relic_yottabyte_drive);
if (!global.relic_pineapple_pudding) ds_list_add(relics[3], obj_relic_pineapple_pudding);
if (!global.relic_pineapple_pie) ds_list_add(relics[3], obj_relic_pineapple_pie);
if (!global.relic_midnight_beer) ds_list_add(relics[3], obj_relic_midnight_beer);
if (!global.relic_rabbit_foot) ds_list_add(relics[3], obj_relic_rabbit_foot);
if (!global.relic_dev_potion) ds_list_add(relics[3], obj_relic_dev_potion);
if (!global.relic_midnight_meal) ds_list_add(relics[3], obj_relic_midnight_meal);
if (!global.relic_yottabyte_processor) ds_list_add(relics[3], obj_relic_yottabyte_processor);
if (!global.relic_crystal_bacon) ds_list_add(relics[3], obj_relic_crystal_bacon);

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, weapons[1]);
    ds_list_add(cleanUp, weapons[2]);
    ds_list_add(cleanUp, weapons[3]);
}

