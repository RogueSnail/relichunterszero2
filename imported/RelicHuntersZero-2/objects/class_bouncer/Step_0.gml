///"Physics"

if (vertical_speed_start)
{
    depth= -y;
    
    draw_height += vertical_speed;
    sprite_angle += angular_speed;

    vertical_speed += fake_gravity;
}

if ( (draw_height >= 0) && (vertical_speed_start) ) timeToBounce = true;

if (timeToBounce)
{
    vertical_speed_start -= random_range(bounce_min,bounce_max);
    
    firstBounce = true;
    timeToBounce = false;
    playAudio = true;
    draw_height = 0;
    vertical_speed = 0;
     
    if (vertical_speed_start <= vertical_speed_start_min)
    {
        vertical_speed_start = 0;
        //angular_speed = 0;
        depth= 999999999999999;
    }
    else 
    {
        angular_speed = random_range(angular_min,angular_max);
        vertical_speed = -vertical_speed_start;
    }
}

