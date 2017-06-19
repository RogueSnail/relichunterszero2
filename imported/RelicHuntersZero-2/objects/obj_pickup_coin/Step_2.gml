/// @description time based movement
if (magnet_player == noone) {
	speed_per_second = max(0, speed_per_second - (magnet_friction * delta_time * ms_to_s));
}
else {
	speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel * delta_time * ms_to_s));
	direction = point_direction(x,y,magnet_player.x,magnet_player.y);
}
speed = speed_per_second * delta_time * ms_to_s;
//friction = friction_per_second * delta_time * ms_to_s;