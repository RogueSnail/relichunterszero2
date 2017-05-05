///Spawn mini-rockets before exploding
if (explode)
{
    var spawnAngle = 0;
    repeat(4)
    {
        child = instance_create(x,y,obj_rocket_homing);
        child.immortalTimer = room_speed*0.5;
        child.image_xscale = 0.5;
        child.image_yscale = 0.5;
        
        child.faction = faction;
        child.damage = 120;
        
        child.curveRatio = 6;
        child.curveRatioDecay = 0.016;
        
        child.direction = spawnAngle;
        spawnAngle += 90;
    }
}

