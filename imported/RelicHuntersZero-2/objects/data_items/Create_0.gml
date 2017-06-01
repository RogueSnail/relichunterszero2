///Create the lists
event_inherited();

//Item Group Design (Spawns One Item Randomly)
    
    item_starterweapon_1 = ds_list_create();
    ds_list_add(item_starterweapon_1, obj_pickup_pistol_assault,obj_pickup_shotgun);
    
    item_mediumweapon_1 = ds_list_create();
    ds_list_add(item_mediumweapon_1, obj_pickup_submachinegun, obj_pickup_pistol_heavy);
    
    item_mediumweapon_2 = ds_list_create();
    ds_list_add(item_mediumweapon_2, obj_pickup_pistol_heavy, obj_pickup_assault_rifle);
    
    item_heavyweapon_1 = ds_list_create();
    ds_list_add(item_heavyweapon_1, obj_pickup_machinegun, obj_pickup_assault_rifle);
    
    item_heavyweapon_2 = ds_list_create();
    ds_list_add(item_heavyweapon_2, obj_pickup_assault_rifle, obj_pickup_sniper_rifle);
    
    item_superweapon_1 = ds_list_create();
    ds_list_add(item_superweapon_1, obj_pickup_shotgun_heavy, obj_pistol_plasma,  obj_pistol_plasma, obj_pickup_machinegun, obj_pickup_assault_rifle, obj_pickup_pistol_heavy );
    
    item_rocketlauncher_1 = ds_list_create();
    ds_list_add(item_rocketlauncher_1, obj_pickup_rocketlauncher);
    
    item_starterammo_1 = ds_list_create();
    ds_list_add(item_starterammo_1, obj_pickup_lightammo,obj_pickup_lightammo,obj_pickup_mediumammo);
    
    item_starterhealth_1 = ds_list_create();
    ds_list_add(item_starterhealth_1, obj_pickup_health, obj_pickup_health, obj_pickup_health, obj_pickup_health, obj_pickup_health, obj_pickup_shield);
    
    item_engamehealth_1 = ds_list_create();
    ds_list_add(item_engamehealth_1, obj_pickup_healthBig, obj_pickup_healthBig, obj_pickup_shield, obj_pickup_shield, obj_pickup_superShield);
    
    item_starteraid_1 = ds_list_create();
    ds_list_add(item_starteraid_1, obj_pickup_lightammo, obj_pickup_lightammo, obj_pickup_lightammo, obj_pickup_health, obj_pickup_health, obj_pickup_shield, obj_pickup_healthBig, obj_pickup_grenade, obj_pickup_superShield);
    
    item_grenade_1 = ds_list_create();
    ds_list_add(item_grenade_1, obj_pickup_grenade);
    
    item_mediumammo_1 = ds_list_create();
    ds_list_add(item_mediumammo_1, obj_pickup_mediumammo, obj_pickup_mediumammo, obj_pickup_heavyammo, obj_pickup_grenade);
    
    item_heavyammo_1 = ds_list_create();
    ds_list_add(item_heavyammo_1, obj_pickup_heavyammo);
    
    item_endgameaid_1 = ds_list_create();
    ds_list_add(item_endgameaid_1, obj_pickup_healthBig, obj_pickup_healthBig, obj_pickup_grenade, obj_pickup_shield, obj_pickup_heavyammo, obj_pickup_mediumammo, obj_pickup_superShield);

///Create the pool depending on room

itemPool = ds_list_create();

switch (room)
{
    case level1_1:
        ds_list_add(itemPool, item_starterammo_1, item_starterammo_1, item_starterhealth_1, item_starteraid_1, item_starteraid_1);
        break;
        
    case level1_2:
        ds_list_add(itemPool, item_starterweapon_1, item_starterammo_1, item_starteraid_1, item_starterammo_1, item_starteraid_1);
        break;
    
    case level1_3:
        ds_list_add(itemPool, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_mediumammo_1, item_starteraid_1, item_grenade_1,item_starterhealth_1,item_starteraid_1);
        break;    

    case level2_1:
        ds_list_add(itemPool, item_starterammo_1, item_starteraid_1, item_mediumammo_1, item_starteraid_1,item_starterhealth_1,item_starteraid_1);
        break;
        
    case level2_2:
        ds_list_add(itemPool, item_starterweapon_1, item_starterammo_1, item_starterammo_1, item_starteraid_1, item_starteraid_1,item_starterhealth_1,item_starteraid_1);
        break;
        
    case level2_3:
        ds_list_add(itemPool, item_mediumweapon_1, item_starterammo_1, item_mediumammo_1, item_grenade_1, item_starteraid_1, item_grenade_1,item_starterhealth_1,item_starteraid_1);
        break;
        
    case level3_1:
        ds_list_add(itemPool, item_starterammo_1, item_mediumammo_1, item_starteraid_1, item_starteraid_1, item_starteraid_1, item_grenade_1,item_starteraid_1);
        break;
        
    case level3_2:
        ds_list_add(itemPool, item_starterweapon_1, item_starteraid_1, item_starterhealth_1, item_grenade_1, item_starterammo_1, item_grenade_1,item_starteraid_1);
        break;
        
    case level3_3:
        ds_list_add(itemPool, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_starteraid_1, item_superweapon_1, item_starteraid_1, item_grenade_1,item_starteraid_1,item_starterhealth_1);
        break;
    
    case level4_1:
        ds_list_add(itemPool, item_heavyweapon_1, item_heavyweapon_2, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_endgameaid_1, item_starteraid_1,item_starterhealth_1,item_starteraid_1);
        break;
        
    case level4_2:
        ds_list_add(itemPool, item_heavyammo_1, item_mediumammo_1, item_starteraid_1, item_endgameaid_1, item_grenade_1, item_starterammo_1, item_mediumammo_1,item_starterhealth_1,item_starteraid_1);
        break;
        
    case level4_3:
        ds_list_add(itemPool, item_rocketlauncher_1, item_heavyammo_1, item_heavyammo_1, item_mediumammo_1, item_endgameaid_1, item_grenade_1, item_mediumammo_1, item_starterammo_1,item_starterhealth_1);
        break;
        
    case room_boss:
        ds_list_add(itemPool, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1, item_heavyammo_1);
        ds_list_add(itemPool, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1, item_mediumammo_1);
        ds_list_add(itemPool, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1, item_starterammo_1);
        ds_list_add(itemPool, item_heavyweapon_1, item_heavyweapon_2, item_mediumweapon_1, item_mediumweapon_1, item_starterweapon_1, item_starterweapon_1, item_starteraid_1, item_starteraid_1, item_starteraid_1);
        ds_list_add(itemPool, item_starterhealth_1, item_starterhealth_1, item_engamehealth_1, item_engamehealth_1);
        break;
}

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, item_starterweapon_1);
    ds_list_add(cleanUp, item_mediumweapon_1);
    ds_list_add(cleanUp, item_mediumweapon_2);
    ds_list_add(cleanUp, item_heavyweapon_1);
    ds_list_add(cleanUp, item_heavyweapon_2);
    ds_list_add(cleanUp, item_superweapon_1);
    ds_list_add(cleanUp, item_rocketlauncher_1);
    ds_list_add(cleanUp, item_starterammo_1);
    ds_list_add(cleanUp, item_starterhealth_1);
    ds_list_add(cleanUp, item_engamehealth_1);
    ds_list_add(cleanUp, item_starteraid_1);
    ds_list_add(cleanUp, item_grenade_1);
    ds_list_add(cleanUp, item_mediumammo_1);
    ds_list_add(cleanUp, item_heavyammo_1);
    ds_list_add(cleanUp, item_endgameaid_1);
    
    ds_list_add(cleanUp, itemPool);
}

