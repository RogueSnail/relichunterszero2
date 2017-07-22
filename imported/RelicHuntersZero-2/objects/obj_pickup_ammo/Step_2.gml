/// @description time based movement, life and alpha
///Life and Alpha
myTime += delta_time;

if (myTime >= alert_time)
{
	alpha_duration_current += delta_time;
	if alpha_duration_current >= alpha_duration
	{
		if (alpha == 1) 
			alpha = 0.4;
		else alpha = 1;
		alpha_duration_current = 0;
	}
}

if (myTime >= life_time)
{
	instance_destroy();
}

if (!instance_exists_fast(magnet_player)) {
	speed_per_second = max(0, speed_per_second - (magnet_friction * delta_time * ms_to_s));
}
else {
	if (point_distance(x,y,magnet_player.x,magnet_player.y) > magnet_range) magnet_player = noone;
	else{
		speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel * delta_time * ms_to_s));
		direction = point_direction(x,y,magnet_player.x,magnet_player.y);
	}
}
speed = speed_per_second * delta_time * ms_to_s;
//friction = friction_per_second * delta_time * ms_to_s;


