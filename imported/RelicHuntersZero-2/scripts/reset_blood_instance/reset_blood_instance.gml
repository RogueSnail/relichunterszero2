x = argument0;
y = argument1;
layer_add_instance(layer_get_id(argument2), id);

angular_min = -10 * global.target_fps;
angular_max = 10 * global.target_fps;
angular_speed = irandom_range(angular_min,angular_max);

vertical_speed_start = irandom_range(3,6) * global.target_fps;
vertical_speed = -vertical_speed_start;

timeToBounce = false;
firstBounce = false;
speed_per_second = irandom_range(0.5, 2) * global.target_fps;
dirMin = -30;
dirMax = 30;
direction = 180 + random_range(dirMin,dirMax);

randomizeDir = true;