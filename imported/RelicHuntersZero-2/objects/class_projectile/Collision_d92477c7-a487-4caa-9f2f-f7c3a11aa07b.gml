if (!goesThroughWalls)
{
    
    other.hp -= damage;
    other.shake_direction = direction;
    other.hitDirection = direction;
    other.shake += 2;
    other.hit_taken = true;
    
    if other.hp < 0 && (piercing)
    {
        piercing--;
    }
    else if (bounce) && (bounceMax > bounceCurrent)
    {
        projectile_bounce();
    }
    else if (!isBouncing)
    {
        ds_list_destroy(damage_list);
        ds_list_add(global.audio_cleaner,audio_emitter);
        if (!instance_exists(hit)) && (global.count_particles < global.max_particles)
        {
            hit = instance_create(x,y,fx_hit);
            hit.type = ammo_type;
        }
        instance_destroy();
    }
}

