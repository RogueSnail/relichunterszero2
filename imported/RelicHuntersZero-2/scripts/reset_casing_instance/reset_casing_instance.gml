instance = argument0;
instance.x = argument1;
instance.y = argument2;
layer_add_instance(layer_get_id(argument3), instance);


//Casing shit
instance.casing_height = -40;
instance.casing_angle = 0;
instance.angular_speed = irandom_range(instance.angular_min,instance.angular_max);

instance.vertical_speed_start = irandom_range(3,6) * global.target_fps;
instance.vertical_speed = -instance.vertical_speed_start;

instance.speed_per_second = irandom_range(1, 2) * global.target_fps;
instance.direction = 180 + random_range(instance.dirMin,instance.dirMax);
