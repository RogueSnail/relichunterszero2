///Correct myPlayerId initial setup
show_debug_message("Hey Im pinkyy and my player id is "+string(myPlayerId));
hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

    //Weapon Setup
    if global.weapon2[myPlayerId] != noone
    {
        show_debug_message("weapon2[myPlayerId] returns "+string(global.weapon2[myPlayerId]));
        
        if global.weapon2[myPlayerId] == obj_gloves
        {
            instance_create_layer(x,y,"Interactive",obj_gloves);
            weapon2 = obj_gloves;
            owner_add_owned_instance(weapon2);
            weapon2.weaponLevel = global.weapon2Level[myPlayerId];
            draw_gun(weapon2);
        }
        else
        {
            weapon2 = instance_create_layer(x,y,"Interactive",global.weapon2[myPlayerId]);
            owner_add_owned_instance(weapon2);
            weapon2.weaponLevel = global.weapon2Level[myPlayerId];
            draw_gun(weapon2);
            weapon2.ammo_current = global.weapon2_ammo[myPlayerId];
        }
    }
    
    
    if global.weapon1[myPlayerId] != noone
    {
        show_debug_message("weapon2[myPlayerId] returns "+string(global.weapon2[myPlayerId]));
        
        if global.weapon1[myPlayerId] == obj_gloves
        {
            instance_create_layer(x,y,"Interactive",obj_gloves);
            weapon1 = obj_gloves;
            owner_add_owned_instance(weapon1);
            weapon1.weaponLevel = global.weapon1Level[myPlayerId];
            draw_gun(weapon1);
        }
        else 
        {
            weapon1 = instance_create_layer(x,y,"Interactive",global.weapon1[myPlayerId]);
            owner_add_owned_instance(weapon1);
            weapon1.weaponLevel = global.weapon1Level[myPlayerId];
            draw_gun(weapon1);
            weapon1.ammo_current = global.weapon1_ammo[myPlayerId];
        }
    }
    else //Starting with Gloves
    {
        instance_create_layer(x,y,"Interactive",obj_gloves);
        weapon1 = obj_gloves;
        owner_add_owned_instance(weapon1);
        draw_gun(weapon1);
    }
       
    //Draw Correct Gun
    if (global.currentlyEquippedWeapon[myPlayerId] == 1) draw_gun(weapon1);
    else if (global.currentlyEquippedWeapon[myPlayerId] == 2) draw_gun(weapon2);
    global.currentlyEquippedWeapon[myPlayerId] = 0;
    
    //Crosshair Position
    global.crosshairX[myPlayerId] = x;
    global.crosshairY[myPlayerId] = y;
    
    //Done
    setup_initial = false;

