/// @description time based movement, check events and refs


if (!instance_exists_fast(magnet_player)) {
	magnet_player = noone;
	if (vertical_speed_start < interactive_speed) 
	{
		speed_per_second = max(0, speed_per_second - (magnet_friction));
	}		
}
else {
	if (point_distance(x,y,magnet_player.x,magnet_player.y) > magnet_range) 
	{
		magnet_player = noone;
	}
	else
	{
		speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel));
		direction = point_direction(x,y,magnet_player.x,magnet_player.y);
	}
}

speed_per_second = max(0, speed_per_second - (friction_per_second * delta_time * ms_to_s_60));
speed = speed_per_second * delta_time * ms_to_s_60;
