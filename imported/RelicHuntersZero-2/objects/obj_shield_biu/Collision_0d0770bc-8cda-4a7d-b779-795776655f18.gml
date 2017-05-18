///Reflect

if (isActive)
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
    
    newProjectile = instance_create_layer(other.x,other.y,"Interactive",obj_projectile_player);
    
    newProjectile.speed = newpeed;
    newProjectile.direction = newDirection;
    newProjectile.decay = newDecay;
    newProjectile.range = newRange;
    newProjectile.push_power = newPush;
    newProjectile.ammo_type = newAmmoType;
    newProjectile.faction = newFaction;
    newProjectile.type = newType;
    newProjectile.damage = newDamage;
    
    with (other) instance_destroy();
    
    animationTrigger = true;
}

