/// @description time based movement
if (!active) return;

speed = speed_per_second * delta_time * ms_to_s;
friction = friction_per_second * delta_time * ms_to_s;