///Reflect

if instance_exists(other)
{
    projectile = instance_create(other.x,other.y,obj_projectile_player);

    projectile.speed = other.speed;
    projectile.direction = -other.direction
    projectile.decay = other.decay;
    projectile.range = other.range;
    projectile.push_power = 4;
    projectile.ammo_type = other.ammo_type;
    projectile.faction = f_player;
    projectile.type = other.type;
    projectile.damage = other.damage;
    
    with (other)
    {
        instance_destroy();
    }
}

