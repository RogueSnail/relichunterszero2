if faction == f_enemy && instance_exists(other)
{
    spreadX = irandom_range(-15,15);
    spreadY = irandom_range(-15,15);
        
    if (!other.dodging) && (ds_list_find_index(damage_list,other.id) < 0) && (other.isVulnerable)
    {
        ds_list_add(damage_list,other.id);
        
        other.aggro += other.aggro_add_hit;
        
        if (other.shield) other.energy -= damage;
        else 
        {
            other.hp -= damage;
            bloodAmount = min(round(damage/5), (global.max_casings-global.count_casings), 5);
            if (bloodAmount) repeat(bloodAmount) blood = instance_create(x,y,fx_blood);
        }
        if (other.hp <= 0) other.no_score = true;
        other.hit_taken = true;
        
        other.pushed = true;
        other.push_direction = direction;
        other.push_speed += push_power;
        
        damage_fx = instance_create(other.x+spreadX,other.y+spreadY,fx_damage);
        damage_fx.damage = damage;
        
        audio_play(audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
        
        ds_list_add(global.audio_cleaner,audio_emitter);
        if (!instance_exists(hit)) && (global.count_particles < global.max_particles)
        {
            hit = instance_create(x,y,fx_hit);
            hit.type = ammo_type;
        }
        instance_destroy();
    }
    
    if (other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
    {
        ds_list_add(damage_list,other.id);
        damageEffect = instance_create(other.x+spreadX,other.y+spreadY,fx_damage);
    }
}

