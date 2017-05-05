///Reflect

if (defenseMode) && (instance_exists(other))
{
    if (other.owner != id)
    {           
                var newpeed = other.speed/2;
                var newDirection = other.direction + 180 + random_range(reflectAngleMin,reflectAngleMax);
                var newDecay = other.decay;
                var newRange = other.range;
                var newPush = other.push_power;
                var newAmmoType = other.ammo_type;
                var newType = other.type;
                var newDamage = round(other.damage * reflectDamageMultiplier);
                
                newProjectile = instance_create(other.x,other.y,obj_projectile_player);
                
                newProjectile.owner = id;
                newProjectile.speed = newpeed;
                newProjectile.direction = newDirection;
                newProjectile.decay = newDecay;
                newProjectile.range = newRange;
                newProjectile.push_power = newPush;
                newProjectile.ammo_type = newAmmoType;
                newProjectile.faction = f_enemy;
                newProjectile.type = newType;
                newProjectile.damage = newDamage;
                newProjectile.distance_travelled = 0;
                
                with (other) instance_destroy();
                
                animationTrigger = true;
    }
}

