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
sprite_filename = ds_map_find_value(configDataMap, "sprite");
sprite_origin_x = ds_map_find_value(configDataMap, "sprite_origin_x");
sprite_origin_y = ds_map_find_value(configDataMap, "sprite_origin_y");
maxSpeed = ds_map_find_value(configDataMap, "max_speed");
maxHP = ds_map_find_value(configDataMap, "max_hp");
ds_map_destroy(configDataMap);

//create sprite
if file_exists(working_directory + sprite_filename)
{
	sprite = sprite_add(working_directory + sprite_filename, 1, false, true, sprite_origin_x, sprite_origin_y );
	sprite_index = sprite;

	show_debug_message("test:" + string(sprite_index));
	object_set_sprite(sprite_index, sprite);
}
else {
	show_debug_message("image not found: "+working_directory + sprite_filename);
}
