///Correct myPlayerId initial setup

hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

if global.weapon2[myPlayerId] != noone
    {
        if global.weapon2[myPlayerId] == obj_buckler
        {
            instance_create_layer(x,y,"Interactive",obj_buckler);
            weapon2 = obj_buckler;
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
        if global.weapon1[myPlayerId] == obj_buckler
        {
            instance_create_layer(x,y,"Interactive",obj_buckler);
            weapon1 = obj_buckler;
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
    else /// Starting Loadout
    {        
        instance_create_layer(x,y,"Interactive",obj_buckler);
        weapon1 = obj_buckler;
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
setup_initial = true;

