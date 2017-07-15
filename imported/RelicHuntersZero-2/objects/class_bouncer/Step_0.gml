///"Physics"
if (!active) return;

if (vertical_speed_start)
{
    depth = -y;
    
    draw_height += vertical_speed * delta_time * ms_to_s;
    sprite_angle += angular_speed * delta_time * ms_to_s;

    vertical_speed += fake_gravity * delta_time * ms_to_s;
}

if ( (draw_height >= 0) && (vertical_speed_start) ) {
	timeToBounce = true;
}

if (timeToBounce)
{
    vertical_speed_start -= irandom_range(bounce_min,bounce_max);
    
    firstBounce = true;
    timeToBounce = false;
    playAudio = true;
    draw_height = 0;
    vertical_speed = 0;
     
    if (vertical_speed_start <= vertical_speed_start_min)
    {
        vertical_speed_start = 0;
        //angular_speed = 0;
        depth=layer_get_depth("Interactive_Under");
    }
    else 
    {
        angular_speed = irandom_range(angular_min,angular_max);
        vertical_speed = -vertical_speed_start;
    }
}

