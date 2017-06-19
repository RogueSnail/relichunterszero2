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
    
    //Max Range is 1.5 (Damage reduced at maximum range = 1)

    if (distance_travelled > (1.5*range))
    {
        instance_destroy();
    }
    //Fade if range is almost over
    if (range)
    {
        if (distance_travelled/range) > 1
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

if (playLoop)
{
    playLoop = false;
    audio_play(audio_emitter,true,1,playLoopSound);
}

/* */
///Bounce Control

if (isBouncing)
{
    if (bounceTimeCurrent < bounceTime) bounceTimeCurrent += delta_time;
    else
    {
        isBouncing = false;
        bounceTimeCurrent = 0;
    }
}

/* */
/*  */
