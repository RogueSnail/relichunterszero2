// load json config file

show_debug_message(working_directory + configFilename);

file = file_text_open_read(working_directory + configFilename);
jsonStr = "";
while (!file_text_eoln(file))
{
	jsonStr = jsonStr + file_text_readln(file);
}
file_text_close(file);
	
// load data into vars
configDataMap = json_decode(jsonStr);

// TODO: validate if is a valid config (eg: has all required properties?)

// load data
type = ds_map_find_value(configDataMap, "type");
name = ds_map_find_value(configDataMap, "name");
spritesheet_path = ds_map_find_value(configDataMap, "spritesheet_path");
spritesheet_prefix = ds_map_find_value(configDataMap, "spritesheet_prefix");

sprite_w = ds_map_find_value(configDataMap, "sprite_w");
sprite_h = ds_map_find_value(configDataMap, "sprite_h");
sprite_origin_x = ds_map_find_value(configDataMap, "sprite_origin_x");
sprite_origin_y = ds_map_find_value(configDataMap, "sprite_origin_y");

sprite_ui_w = ds_map_find_value(configDataMap, "sprite_ui_w");
sprite_ui_h = ds_map_find_value(configDataMap, "sprite_ui_h");
sprite_ui_origin_x = ds_map_find_value(configDataMap, "sprite_ui_origin_x");
sprite_ui_origin_y = ds_map_find_value(configDataMap, "sprite_ui_origin_y");

maxSpeed = ds_map_find_value(configDataMap, "max_speed");
maxHP = ds_map_find_value(configDataMap, "max_hp");
ds_map_destroy(configDataMap);

//create common sprites


sprite_filename = working_directory + spritesheet_path + spritesheet_prefix + "_walk-sheet.png";
show_debug_message(sprite_filename);
if file_exists(sprite_filename)
{

/*
	temp_sprite = sprite_add(sprite_filename, 1, false, true, 53, 91 );
	sprite_index = temp_sprite;
	object_set_sprite(sprite_index, temp_sprite);
*/	
///*
	temp_sprite = sprite_add(sprite_filename, 1, false, true, 0, 0 );
	//surface loading test
	var surf;
	surf = surface_create(1024,128);
	surface_set_target(surf);
		//draw_clear_alpha(c_white, 1);
		draw_sprite(temp_sprite, image_index, 0, 0);
		spr_custom = sprite_create_from_surface(surf, 0, 0, sprite_w, sprite_h, false, true, sprite_origin_x, sprite_origin_y);
		for (i = 1; i < 6; i +=1)
		{
		   sprite_add_from_surface(spr_custom, surf, i*sprite_w, 0, sprite_w, sprite_h, false, true);
		}

	surface_reset_target();
	surface_free(surf);
	
	sprite_index = spr_custom;
	object_set_sprite(sprite_index, spr_custom);
//*/
}
else {

	//show_debug_message("image not found: "+working_directory + sprite_filename);
}





