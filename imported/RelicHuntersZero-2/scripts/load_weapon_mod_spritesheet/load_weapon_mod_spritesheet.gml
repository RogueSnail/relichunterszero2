///load_weapon_mod_spritesheet()

origin_x = configDataMap[? "origin_x"];
origin_y = configDataMap[? "origin_y"];
sprite_w = configDataMap[? "sprite_w"];
sprite_h = configDataMap[? "sprite_h"];	
folder = configDataMap[? "folder"];
animation_frames = 3;

var surf;
var surface_width = next_power_of_two(sprite_w * animation_frames);
var surface_height = next_power_of_two(sprite_h);
surf = surface_create(surface_width, surface_height);
surface_set_target(surf);

// load spritesheet
var spritesheetFilename = "spritesheet.png";
var sprite_filename = folder + "\\" + spritesheetFilename;
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

gun_set_animation_frame("default");
