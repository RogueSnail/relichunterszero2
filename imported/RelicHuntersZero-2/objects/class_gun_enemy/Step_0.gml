var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Animation and Rotation

stepHasTarget = false;
if (owner != noone)
{
    if (owner.ai_target != noone)
    {
		stepHasTarget = true;
        image_angle = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
        if owner.look_direction == 0 image_angle = image_angle+180;
    }
    
    if owner.look_direction == 0 image_xscale = -1;
    if owner.look_direction == 1 image_xscale = 1; 
    
    depth = (owner.depth)-1;
}

//Recoil
recoil_current += recoil_speed;

if (recoil_current > 0) {
	recoil_speed -= recoil_return;
}
else
{
    recoil_current = 0;
    recoil_speed = 0;
}

if (recoil_current > recoil_max) recoil_current = recoil_max



drawX = x +lengthdir_x( (-1*image_xscale*recoil_current), image_angle );
drawY = y +lengthdir_y( (-1*image_xscale*recoil_current), image_angle );

///Firing Control

if (stepHasTarget)
{
    shoot_direction = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
    if (owner.firing) && (can_fire)
    {
        shot_type = 0;
        cmd_fire_enemy();
    }
    
    //Rate of Fire
    if (!can_fire) && (fire_burst_current >= fire_burst)
    {
        if (!is_sniper) 
			fire_rate_current += delta_time;
        else if (owner.firing) 
			fire_rate_current += delta_time;
        
        if (global.challengeBloodlust) 
			fire_rate_current += delta_time * global.challengeBloodlustRate;
        
        if fire_rate_current >= fire_rate
        {
            fire_rate_current = 0;
            fire_burst_current = 0;
            can_fire = true;
        }
    }
    
    //Burst Fire
    if (fire_burst_current < fire_burst) && (!can_fire) && (owner.firing)
    {
        fire_burst_rate_current += delta_time;
        if fire_burst_rate_current >= fire_burst_rate
        {
            fire_burst_rate_current = 0;
            cmd_fire_enemy();
        }   
    }
}



///Death
//if (!instance_exists(owner)) instance_destroy();

}
}
