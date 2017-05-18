///Correct myPlayerId initial setup
show_debug_message("Hey Im raff and my player id is "+string(myPlayerId));
hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

if global.weapon2[myPlayerId] != noone
    {
        weapon2 = instance_create_layer(x,y,"Interactive",global.weapon2[myPlayerId]);
        weapon2.owner = id;
        weapon2.weaponLevel = global.weapon2Level[myPlayerId];
        draw_gun(weapon2);
        if (room!=room_start) weapon2.ammo_current = global.weapon2_ammo[myPlayerId];
    }
    
    if global.weapon1[myPlayerId] != noone
    {
        weapon1 = instance_create_layer(x,y,"Interactive",global.weapon1[myPlayerId]);
        weapon1.owner = id;
        weapon1.weaponLevel = global.weapon1Level[myPlayerId];
        draw_gun(weapon1);
        if (room!=room_start) weapon1.ammo_current = global.weapon1_ammo[myPlayerId];
    }
    else //Starting Gun
    {
        weapon1 = instance_create_layer(x,y,"Interactive",obj_keytar);
        weapon1.owner = id;
        draw_gun(weapon1);
    }
       
    //Draw Correct Gun
    if (global.currentlyEquippedWeapon[myPlayerId] == 1) draw_gun(weapon1);
    if (global.currentlyEquippedWeapon[myPlayerId] == 2) draw_gun(weapon2);
    global.currentlyEquippedWeapon[myPlayerId] = 0;
    
    //Crosshair Position
    global.crosshairX[myPlayerId] = x;
    global.crosshairY[myPlayerId] = y;

//Done
setup_initial = true;

