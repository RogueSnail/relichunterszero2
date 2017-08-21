///Pick Up

if (instance_exists_fast(activationClient)) 
{
    var p = activationClient.myPlayerId;
    
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;
    
    var forbiddenWeapon = false;
    if (gun == obj_gloves && global.character[p] != char_pinky) || 
    (gun == obj_pistol_jimmy && global.character[p] != char_jimmy) || 
    (gun == obj_flamethrower && global.character[p] != char_punny) || 
    (gun == obj_buckler && global.character[p] != char_biu) ||
    (gun == obj_keytar && global.character[p] != char_raff)
    {
        forbiddenWeapon = true;
    }

    if (!forbiddenWeapon) && (wantToActivate) && (in_range)
    {
        global.hasPickedWeapon = true; //Achievement purposes
    
        activationClient.play_sound_pickup_weapon = true;
    
		// if does not have a 2nd weapon, adds and destroy pickup
        if (activationClient.weapon2 == noone)
        {
            activationClient.weapon2 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);	
            activationClient.weapon2.weaponLevel = weaponLevel;
			activationClient.weapon2.isMod = isMod;
			activationClient.weapon2.ugcItemFolder = ugcItemFolder;
			
			if (activationClient.weapon2.isMod) {
				with (activationClient.weapon2) {
					load_mod_gun_config(ugcItemFolder);
				}
			}
			
            with (activationClient)
            {
				owner_add_owned_instance(weapon2);
                draw_gun(weapon2);
            }
    
            instance_destroy();
            exit;
        }
    
        //Gloves Special Rules
        if (activationClient.myGun == obj_gloves)
        {
            if activationClient.weapon1 == obj_gloves
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_gloves);
                new_pickup.weaponLevel = activationClient.weapon1.weaponLevel;
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                activationClient.weapon1 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon1.weaponLevel = weaponLevel;
                activationClient.weapon1.ammo_current = gun_ammo_current;
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                
                instance_destroy();
                exit;
            }
            if activationClient.weapon2 == obj_gloves
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_gloves);
                new_pickup.weaponLevel = activationClient.weapon2.weaponLevel;
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                activationClient.weapon2 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon2.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
        //Buckler Special Rules
        if (activationClient.myGun == obj_buckler)
        {
            if activationClient.weapon1 == obj_buckler
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_buckler);
                new_pickup.weaponLevel = activationClient.weapon1.weaponLevel;
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                activationClient.weapon1 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon1.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                activationClient.weapon1.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }
            if activationClient.weapon2 == obj_buckler
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_buckler);
                new_pickup.weaponLevel = activationClient.weapon2.weaponLevel;
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                activationClient.weapon2 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon2.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
		// if has 2 weapons, check active weapon and change it
        if activationClient.myGun == activationClient.weapon1
        {
			//create a pickup 
            new_pickup = instance_create_layer(x,y,"Interactive",class_pickup_weapon);
            new_pickup.gun = activationClient.weapon1.object;
            new_pickup.gun_ammo_current = activationClient.weapon1.ammo_current;
            new_pickup.sprite = activationClient.weapon1.sprite_index;
            new_pickup.weaponLevel = activationClient.weapon1.weaponLevel;
            new_pickup.name = activationClient.weapon1.name;
			new_pickup.isMod = activationClient.weapon1.isMod;
			new_pickup.ugcItemFolder = activationClient.weapon1.ugcItemFolder;
            
            with(activationClient.weapon1)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler) 
            {
                activationClient.weapon1 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon1.weaponLevel = weaponLevel;
				activationClient.weapon1.isMod = isMod;
				activationClient.weapon1.ugcItemFolder = ugcItemFolder;
				if (activationClient.weapon1.isMod) {
					with (activationClient.weapon1) {
						load_mod_gun_config(ugcItemFolder);
					}
				}
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                activationClient.weapon1.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_gloves);
                activationClient.weapon1 = obj_gloves;
                activationClient.weapon1.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_buckler);
                activationClient.weapon1 = obj_buckler;
                activationClient.weapon1.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
            }
            
            instance_destroy();
            exit;
        }
        
        if activationClient.myGun == activationClient.weapon2
        {
            new_pickup = instance_create_layer(x,y,"Interactive",class_pickup_weapon);
            new_pickup.gun = activationClient.weapon2.object;
            new_pickup.gun_ammo_current = activationClient.weapon2.ammo_current;
            new_pickup.sprite = activationClient.weapon2.sprite_index;
            new_pickup.weaponLevel = activationClient.weapon2.weaponLevel;
            new_pickup.name = activationClient.weapon2.name;
			new_pickup.isMod = activationClient.weapon2.isMod;
			new_pickup.isMod = activationClient.weapon2.ugcItemFolder;
            
            with(activationClient.weapon2)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler) 
            {
                activationClient.weapon2 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                activationClient.weapon2.weaponLevel = weaponLevel;
				activationClient.weapon2.isMod = isMod;
				activationClient.weapon2.ugcItemFolder = ugcItemFolder;
				if (activationClient.weapon2.isMod) {
					with (activationClient.weapon2) {
						load_mod_gun_config(ugcItemFolder);
					}
				}
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_gloves);
                activationClient.weapon2 = obj_gloves;
                activationClient.weapon2.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_buckler);
                activationClient.weapon2 = obj_buckler;
                activationClient.weapon2.weaponLevel = weaponLevel;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            
            instance_destroy();
            exit;
        }
    }
}
else{ 
        wantToActivate = false; 
        in_range = false; 
        activationClient = noone;
    }


//Checks whether it is on top of a box
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (myObject != noone) on_top_of_object = true; 
}

if (on_top_of_object)
{
    if (!instance_exists_fast(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}

if (in_range) image_index = 1;
else image_index = 0;





