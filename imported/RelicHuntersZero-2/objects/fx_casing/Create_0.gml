active = false;

//Casing shit
casing = spr_casing;

casing_height = -40;
ammo_type = type_light;

casing_angle = 0;
casing_subimage = 0;
angular_min = -10 * global.target_fps;
angular_max = 10 * global.target_fps;
angular_speed = irandom_range(angular_min,angular_max);

vertical_speed_start = irandom_range(3,6) * global.target_fps;
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 0.5 * global.target_fps;
fake_gravity = 18 * global.target_fps;//0.3;

bounce_min = 1 * global.target_fps;
bounce_max = 2 * global.target_fps;

//speed = random_range(2,4);
speed_per_second = irandom_range(0.5, 1) * global.target_fps;
dirMin = -30;
dirMax = 30;
direction = 180 + random_range(dirMin,dirMax);
//friction = 0.05;
friction_per_second = 0.05 * global.target_fps;

show_debug_message("fx_casing create instance");
