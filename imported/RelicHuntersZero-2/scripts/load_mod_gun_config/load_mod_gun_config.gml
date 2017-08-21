ugcItemId = argument0;

//set as mod
isMod = true;

configDataMap = global.steamUGCItemsDataMap[? ugcItemId];

// load data
name = configDataMap[? "name"];
weaponClass = configDataMap[? "weapon_class"];
sound = configDataMap[? "sound"];
projectile_damage = configDataMap[? "projectile_damage"];
projectile_range = configDataMap[? "projectile_range"];
projectile_piercing = configDataMap[? "projectile_piercing"];
projectile_recoil = configDataMap[? "projectile_recoil"];
projectile_power = configDataMap[? "projectile_power"];
projectile_speed = configDataMap[? "projectile_speed"];
projectile_speed_decay = configDataMap[? "projectile_speed_decay"];
accuracy = configDataMap[? "accuracy"];
accuracy_aiming = configDataMap[? "accuracy_aiming"];
ammo = configDataMap[? "ammo"];
ammo_type_name = configDataMap[? "ammo_type"];
ammo_cost = configDataMap[? "ammo_cost"];
reload_time = configDataMap[? "reload_time"] * s_to_ms;
fire_rate = configDataMap[? "fire_rate"] * s_to_ms;
fire_amount = configDataMap[? "fire_amount"];
fire_burst = configDataMap[? "fire_burst"];
fire_burst_rate = configDataMap[? "fire_burst_rate"] * s_to_ms;
fire_automatic = configDataMap[? "fire_automatic"];
shake_amount = configDataMap[? "shake_amount"];
crosshair_recoil = configDataMap[? "crosshair_recoil"];
joypadRumbleFactor = configDataMap[? "joypad_rumble_factor"];
projectile_obj_name = configDataMap[? "projectile"];
beamThickness = configDataMap[? "beam_thickness"];
beam_color_r = configDataMap[? "beam_color_r"];
beam_color_g = configDataMap[? "beam_color_g"];
beam_color_b = configDataMap[? "beam_color_b"];
origin_x = configDataMap[? "origin_x"];
origin_y = configDataMap[? "origin_y"];
sprite_w = configDataMap[? "sprite_w"];
sprite_h = configDataMap[? "sprite_h"];	
price = configDataMap[? "price"];
	
// booleans 
dropCasing = configDataMap[? "drop_casing"] == 1;
goesThroughWalls = configDataMap[? "goes_through_walls"] == 1;
projectileBounce = configDataMap[? "projectile_bounce"] == 1;
projectileBouceMax = configDataMap[? "projectile_bouce_max"] == 1;

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

load_weapon_mod_spritesheet();

gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);
