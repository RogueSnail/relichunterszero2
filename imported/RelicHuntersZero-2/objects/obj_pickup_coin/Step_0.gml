///Physics
depth= -y;

if (vertical_speed_start) 
	vertical_speed += fake_gravity * delta_time * ms_to_s;
else 
	depth = layer_get_depth("Interactive_Under");

draw_height += vertical_speed * delta_time * ms_to_s;

if draw_height >= 0 && (vertical_speed_start)
{
    draw_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= irandom_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min) 
	{
		vertical_speed_start = 0;
		speed_per_second = 0;
	}
    else {
		vertical_speed = -vertical_speed_start;
	}
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
if (magnet_player == noone) 
{
	if (vertical_speed_start < interactive_speed) && instance_exists(class_player)
	{
	    var candidate_magnet_player = instance_nearest(x,y,class_player);
	    if point_distance(x,y,candidate_magnet_player.x,candidate_magnet_player.y) <= magnet_range
	    {
			magnet_player = candidate_magnet_player;
			//give initial speed
			speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel * delta_time * ms_to_s));
	    }   
		else 
		{
			///Life and Alpha
			myTime += delta_time;

			if (myTime >= alert_time)
			{
			    alpha_duration_current += delta_time;
			    if alpha_duration_current >= alpha_duration
			    {
			        if (alpha == 1) 
						alpha = 0.4;
			        else alpha = 1;
			        alpha_duration_current = 0;
			    }
			}

			if (myTime >= life_time)
			{
			    instance_destroy();
			}
		}
	}
}
