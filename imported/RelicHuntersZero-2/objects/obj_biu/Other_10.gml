///Correct myPlayerId initial setup

hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

if global.weapon2[myPlayerId] != noone
    {
        if global.weapon2[myPlayerId] == obj_buckler
        {
            instance_create(x,y,obj_buckler);
            weapon2 = obj_buckler;
            weapon2.owner = id;
            weapon2.weaponLevel = global.weapon2Level[myPlayerId];
            draw_gun(weapon2);
        }
        else
        {
            weapon2 = instance_create(x,y,global.weapon2[myPlayerId]);
            weapon2.owner = id;
            weapon2.weaponLevel = global.weapon2Level[myPlayerId];
            draw_gun(weapon2);
            weapon2.ammo_current = global.weapon2_ammo[myPlayerId];
        }
    }
    
    
    if global.weapon1[myPlayerId] != noone
    {
        if global.weapon1[myPlayerId] == obj_buckler
        {
            instance_create(x,y,obj_buckler);
            weapon1 = obj_buckler;
            weapon1.owner = id;
            weapon1.weaponLevel = global.weapon1Level[myPlayerId];
            draw_gun(weapon1);
        }
        else
        {
            weapon1 = instance_create(x,y,global.weapon1[myPlayerId]);
            weapon1.owner = id;
            weapon1.weaponLevel = global.weapon1Level[myPlayerId];
            draw_gun(weapon1);
            weapon1.ammo_current = global.weapon1_ammo[myPlayerId];
        }
    }
    else /// Starting Loadout
    {        
        instance_create(x,y,obj_buckler);
        weapon1 = obj_buckler;
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

