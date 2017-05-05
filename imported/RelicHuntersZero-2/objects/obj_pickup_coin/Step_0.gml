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

sprite_subimage += image_speed;
if (vertical_speed_start)
{
    sprite = sprite1;
    if (sprite_subimage > 5) sprite_subimage = 0;
}
else 
{
    sprite = sprite2;
    if (sprite_subimage > 14) sprite_subimage = 0;
}



///Attraction and Pickup
if (vertical_speed_start < interactive_speed) && instance_exists(class_player)
{
    var player = instance_nearest(x,y,class_player);
    
    speed -= magnet_friction
    if speed < 0 speed = 0;
    
    if point_distance(x,y,player.x,player.y) <= magnet_range
    {
        speed += magnet_accel;
        if (speed > magnet_speed_max) speed = magnet_speed_max;
        direction = point_direction(x,y,player.x,player.y);
    }   
}

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

