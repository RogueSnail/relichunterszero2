///Physics

depth= -y;

if (vertical_speed_start) vertical_speed += fake_gravity;
else depth= 999999999999999;

draw_height += vertical_speed;

if draw_height >= 0 && (vertical_speed_start)
{
    draw_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= random_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min) vertical_speed_start = 0;
    else vertical_speed = -vertical_speed_start;
}

///Attraction and Pickup
if (vertical_speed_start < interactive_speed) && instance_exists(class_player)
{
    var player = instance_nearest(x,y,class_player);
    if (instance_exists(player))
    {
        var p = player.myPlayerId;
        var isAmmoFull = false;
        
        if (ammoType == type_light) if (global.ammo_light[p] >= global.ammo_light_max) isAmmoFull = true;
        if (ammoType == type_medium) if (global.ammo_medium[p] >= global.ammo_medium_max) isAmmoFull = true;
        if (ammoType == type_heavy) if (global.ammo_heavy[p] >= global.ammo_heavy_max) isAmmoFull = true;
    
        if (!isAmmoFull)
        {
            isInteractive = true;
            
            speed -= magnet_friction
            if speed < 0 speed = 0;
            
            if point_distance(x,y,player.x,player.y) <= magnet_range
            {
                speed += magnet_accel;
                if (speed > magnet_speed_max) speed = magnet_speed_max;
                direction = point_direction(x,y,player.x,player.y);
            }   
        }
    }
}

//if (!isInteractive) speed = 0;

///Life and Alpha

myTime++;

if (myTime >= alert_time)
{
    alpha_duration_current++;
    if alpha_duration_current >= alpha_duration
    {
        if (alpha == 1) alpha = 0.4;
        else alpha = 1;
        alpha_duration_current = 0;
    }
}

if (myTime >= life_time)
{
    instance_destroy();
}

///Ammo Type

if (ammoType == type_light) sprite_subimage = 1;
else if (ammoType == type_medium) sprite_subimage = 2;
else if (ammoType == type_heavy) sprite_subimage = 0;

