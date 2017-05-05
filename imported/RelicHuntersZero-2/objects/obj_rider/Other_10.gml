///Correct myPlayerId initial setup

hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

    //Starting Gun
    if (room == room_start) || (room == room_tutorial)
    {
        //
    }
    
    show_debug_message("This is Rider spawning her guns, and my playerId is "+string(myPlayerId));
    
    if global.weapon2[myPlayerId] != noone
    {
        show_debug_message("weapon2[myPlayerId] returns "+string(global.weapon2[myPlayerId]));
        
        weapon2 = instance_create(x,y,global.weapon2[myPlayerId]);
        weapon2.owner = id;
        weapon2.weaponLevel = global.weapon2Level[myPlayerId];
        draw_gun(weapon2);
        if (room!=room_start) weapon2.ammo_current = global.weapon2_ammo[myPlayerId];
    }
    
    if global.weapon1[myPlayerId] != noone
    {
        show_debug_message("weapon1[myPlayerId] returns "+string(global.weapon1[myPlayerId]));
        
        weapon1 = instance_create(x,y,global.weapon1[myPlayerId]);
        weapon1.owner = id;
        weapon1.weaponLevel = global.weapon1Level[myPlayerId];
        draw_gun(weapon1);
        if (room!=room_start) weapon1.ammo_current = global.weapon1_ammo[myPlayerId];
    }
    else
    {
        weapon1 = instance_create(x,y,obj_pistol);
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
    
    //Crosshair Position
    global.crosshairX[myPlayerId] = x;
    global.crosshairY[myPlayerId] = y;
    
    //Done
    setup_initial = false;
    
    

