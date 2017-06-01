/// Pause-Controlled Movement

if (!global.pause)
{
    //Speed Reset After Pause
    if (speed_reset)
    {
        speed = old_speed;
        speed_reset = false;
    }
    
    image_angle = direction;
    distance_travelled += speed;
    speed -= decay;
    if speed < 5 speed = 5;
    
    //Max Range
    
    if distance_travelled > range
    {
        ds_list_destroy(damage_list);
        instance_destroy();
    }
    //Fade if range is almost over
    if (range)
    {
        if (distance_travelled/range) >= 0.9
        {
            myAlpha -= fade;
        }
    }
}
else if (speed_reset == false)
{
    old_speed = speed;
    speed = 0;
    speed_reset = true;
}
/*
depth = -y-99;

/* */
///Audio
audio_emitter_position(audio_emitter, x, y, 0);

/* */
/*  */
