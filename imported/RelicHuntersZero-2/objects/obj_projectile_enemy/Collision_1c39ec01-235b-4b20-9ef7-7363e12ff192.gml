if (faction == f_enemy) && (instance_exists(other))
{
    spreadX = irandom_range(-15,15);
    spreadY = irandom_range(-15,15);
    
    if (!other.dodging) && (other.isVulnerable)
    {
        if (other.shield)
        {
            if (other.superShield) damage = 0;
            var originalEnergy = other.energy;
            if (distance_travelled > range) damage = round(damage/3);
            if (global.challengeSupressor) other.energy -= damage*2;
            else other.energy -= damage;
            
            audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
            if (other.energy <= 0) 
            {
                audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_destroy);
                if (damage > originalEnergy) other.hp -= round( abs(originalEnergy - damage) * 0.4);
            }
        }
        else
        {
            if (distance_travelled > range) damage = round(damage/3);
            other.hp -= damage;
            audio_play(other.audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
            
            bloodAmount = min(round(damage/5), (global.max_casings-global.count_casings), 5);
            if (bloodAmount) repeat(bloodAmount) blood = instance_create(x,y,fx_blood);
        }
        other.hit_taken = true;
        
        
        damage_fx = instance_create(other.x+spreadX,other.y+spreadY,fx_damage);
        damage_fx.damage = damage;

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

