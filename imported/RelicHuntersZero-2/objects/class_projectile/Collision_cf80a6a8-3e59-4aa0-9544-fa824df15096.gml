///Bounce or Die
if (!goesThroughWalls)
{
    if (bounce && bounceMax > bounceCurrent)
    {
        projectile_bounce();
    }
    else if (!isBouncing)
    {
        
        ds_list_destroy(damage_list);
        ds_list_add(global.audio_cleaner,audio_emitter);
        if (!instance_exists(hit)) && (global.count_particles < global.max_particles)
        {
            hit = instance_create_layer(x,y,"Interactive",fx_hit);
            hit.type = ammo_type;
        }
        instance_destroy();
    }
}

