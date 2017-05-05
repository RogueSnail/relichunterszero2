///Reflect

if (defenseMode)
{
    if (other.owner != id)
    {
        var newpeed = other.speed;
        var newDirection = other.direction + 180 + random_range(reflectAngleMin,reflectAngleMax);
        var newDecay = other.decay;
        var newRange = other.range;
        var newPush = other.push_power;
        var newAmmoType = other.ammo_type;
        var newFaction = f_player;
        var newType = other.type;
        var newDamage = round(other.damage * reflectDamageMultiplier);
        
        newProjectile = instance_create(other.x,other.y,obj_projectile_player);
        
        newProjectile.speed = newpeed;
        newProjectile.direction = newDirection;
        newProjectile.decay = newDecay;
        newProjectile.range = newRange;
        newProjectile.push_power = newPush;
        newProjectile.ammo_type = newAmmoType;
        newProjectile.faction = newFaction;
        newProjectile.type = newType;
        newProjectile.damage = newDamage;
        newProjectile.owner = id;
        
        with (other) instance_destroy();
    }
}

