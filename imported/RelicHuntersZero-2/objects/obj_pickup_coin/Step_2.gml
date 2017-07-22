/// @description time based movement, check events and refs
if (magnet_player != noone) {

	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (magnet_player == (global.eventManager.removedInstances[i])) {
			magnet_player = noone;
			break;
		}
	}
}

if (magnet_player == noone) {
	speed_per_second = max(0, speed_per_second - (magnet_friction * delta_time * ms_to_s));
}
else {
	speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel * delta_time * ms_to_s));
	direction = point_direction(x,y,magnet_player.x,magnet_player.y);
}
speed = speed_per_second * delta_time * ms_to_s;
//friction = friction_per_second * delta_time * ms_to_s;