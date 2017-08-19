// load json config file
ugcItemFolder = argument0;
//ugcConfigData = argument1;
var configFilename = "config.json";
var spritesheetFilename = "spritesheet.png";
var fullPath = ugcItemFolder + "\\" + configFilename;

//show_debug_message(ugcItemFolder);
//show_debug_message(ugcConfigData);

//set weapon as mod weapon
isModWeapon = true;

if file_exists(fullPath)
{
	var file = file_text_open_read(fullPath);
	var jsonStr = "";
	while (!file_text_eoln(file))
	{
		jsonStr = jsonStr + file_text_readln(file);
	}
	file_text_close(file);
	
	// load data into vars
	configDataMap = json_decode(jsonStr);//json_decode(ugcConfigData);
	show_debug_message(configDataMap);

	// load data
	name = ds_map_find_value(configDataMap, "name");
	weaponClass = ds_map_find_value(configDataMap, "weapon_class");
	sound = ds_map_find_value(configDataMap, "sound");
	projectile_damage = ds_map_find_value(configDataMap, "projectile_damage");
	projectile_range = ds_map_find_value(configDataMap, "projectile_range");
	projectile_piercing = ds_map_find_value(configDataMap, "projectile_piercing");
	projectile_recoil = ds_map_find_value(configDataMap, "projectile_recoil");
	projectile_power = ds_map_find_value(configDataMap, "projectile_power");
	projectile_speed = ds_map_find_value(configDataMap, "projectile_speed");
	projectile_speed_decay = ds_map_find_value(configDataMap, "projectile_speed_decay");
	accuracy = ds_map_find_value(configDataMap, "accuracy");
	accuracy_aiming = ds_map_find_value(configDataMap, "accuracy_aiming");
	ammo = ds_map_find_value(configDataMap, "ammo");
	ammo_type_name = ds_map_find_value(configDataMap, "ammo_type");
	ammo_cost = ds_map_find_value(configDataMap, "ammo_cost");
	reload_time = ds_map_find_value(configDataMap, "reload_time") * s_to_ms;
	fire_rate = ds_map_find_value(configDataMap, "fire_rate") * s_to_ms;
	fire_amount = ds_map_find_value(configDataMap, "fire_amount");
	fire_burst = ds_map_find_value(configDataMap, "fire_burst");
	fire_burst_rate = ds_map_find_value(configDataMap, "fire_burst_rate") * s_to_ms;
	fire_automatic = ds_map_find_value(configDataMap, "fire_automatic");
	shake_amount = ds_map_find_value(configDataMap, "shake_amount");
	crosshair_recoil = ds_map_find_value(configDataMap, "crosshair_recoil");
	joypadRumbleFactor = ds_map_find_value(configDataMap, "joypad_rumble_factor");
	projectile_obj_name = ds_map_find_value(configDataMap, "projectile");
	beamThickness = ds_map_find_value(configDataMap, "beam_thickness");
	beam_color_r = ds_map_find_value(configDataMap, "beam_color_r");
	beam_color_g = ds_map_find_value(configDataMap, "beam_color_g");
	beam_color_b = ds_map_find_value(configDataMap, "beam_color_b");
	origin_x = ds_map_find_value(configDataMap, "origin_x");
	origin_y = ds_map_find_value(configDataMap, "origin_y");
	sprite_w = ds_map_find_value(configDataMap, "sprite_w");
	sprite_h = ds_map_find_value(configDataMap, "sprite_h");	
	
	// booleans 
	dropCasing = ds_map_find_value(configDataMap, "drop_casing") == 1;
	goesThroughWalls = ds_map_find_value(configDataMap, "goes_through_walls") == 1;
	projectileBounce = ds_map_find_value(configDataMap, "projectile_bounce") == 1;
	projectileBouceMax = ds_map_find_value(configDataMap, "projectile_bouce_max") == 1;

	//build vars
	
	// object type
	//default,blast,beam,plasma,skull,flak,flakRelic,sonicBoom,rocket,kamiRocket,flame
	switch (projectile_obj_name) {
		//case "default": projectile_obj = obj_projectile_player; break;
		case "blast": projectile_obj = obj_projectile_blast; break;
		case "beam": projectile_obj = obj_projectile_beam; break;
		case "plasma": projectile_obj = obj_projectile_plasma; break;
		case "skull": projectile_obj = obj_projectile_skull; break;
		case "flak": projectile_obj = obj_projectile_flak; break;
		case "flakRelic": projectile_obj = obj_projectile_flakRelic; break;
		case "sonicBoom": projectile_obj = obj_sonicBoom; break;
		case "rocket": projectile_obj = obj_rocket; break;
		case "kamiRocket": projectile_obj = obj_kamiRocket; break;
		case "flame": projectile_obj = obj_flame; break;
		default: projectile_obj = obj_projectile_player;
	}
	
	//ammo type
	switch (ammo_type_name) {
		case "light": ammo_type = type_light; break;
		case "medium": ammo_type = type_medium; break;
		case "heavy": ammo_type = type_heavy; break;
		default: ammo_type = type_light;
	}
	
	// beam color
	beamColor = make_color_rgb(beam_color_r, beam_color_g, beam_color_b);

	// weapon animation frames
	var surf;
	var surface_width = next_power_of_two(sprite_w * animation_frames);
	var surface_height = next_power_of_two(sprite_h);
	surf = surface_create(surface_width, surface_height);
	surface_set_target(surf);
	// load sprites
	var sprite_filename = ugcItemFolder + "\\"+ spritesheetFilename;
	//show_debug_message(sprite_filename);
	if file_exists(sprite_filename)
	{
		var temp_sprite = sprite_add(sprite_filename, 1, false, true, 0, 0);
		
		//clear surface
		draw_clear_alpha(c_black, 0);
		draw_sprite(temp_sprite, 0, 0, 0);
		custom_sprite = sprite_create_from_surface(surf, 0, 0, sprite_w, sprite_h, false, true, origin_x, origin_y);
		for (i = 1; i < animation_frames; i +=1)
		{
			sprite_add_from_surface(custom_sprite, surf, i*sprite_w, 0, sprite_w, sprite_h, false, true);
		}

		sprite_index = custom_sprite;
		image_index = 0;
		//object_set_sprite(id, custom_sprite);
	}
	else {
		show_debug_message("Loading gun mod error - image not found: " + sprite_filename);
	}

	surface_reset_target();
	surface_free(surf);
} else {
	show_debug_message("itemInfoLoaded false");		
}

gun_set_animation_frame("default");

gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);
