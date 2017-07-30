instance = argument0;
instance.x = argument1;
instance.y = argument2;
layer_name = argument3;
layer_add_instance(layer_get_id(argument3), instance);
shoot_direction = argument4;
ammo_type = argument5;

//Casing shit
instance.casing_height = -40;
instance.casing_angle = 0;
instance.angular_speed = irandom_range(instance.angular_min,instance.angular_max);

instance.vertical_speed_start = irandom_range(3,6) * global.target_fps;
instance.vertical_speed = -instance.vertical_speed_start;

instance.speed_per_second = irandom_range(1, 2) * global.target_fps;
instance.direction = 180 + random_range(instance.dirMin,instance.dirMax);

//shot properties
casing.direction = shoot_direction+180+random_range(casing.dirMin,casing.dirMax);
casing.ammo_type = ammo_type;
if (ammo_type == type_light) casing.casing_subimage = 0;
else if (ammo_type == type_medium) casing.casing_subimage = 1;
else if (ammo_type == type_heavy) casing.casing_subimage = 2;

//activate
instance.active = true;
//instance.visible = true;

/*if collision_point(x,y,obj_limit,false,true)
{ 
	show_debug_message("inside_wall");
	y -= 30;
}
*/