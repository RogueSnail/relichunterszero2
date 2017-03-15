//load json config file
filename = argument0;

show_message(working_directory + filename);

file = file_text_open_read(working_directory + filename);
jsonStr = "";
while (!file_text_eoln(file))
{
	jsonStr = jsonStr + file_text_readln(file);
}
file_text_close(file);
	
//load data into vars
configDataMap = json_decode(jsonStr);
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
	sprite = sprite_add(working_directory + sprite_filename, 1, true, true, sprite_origin_x, sprite_origin_y );
	sprite_index = sprite;

	show_message("test:" + string(sprite_index));
	object_set_sprite(sprite_index, sprite);
}
else {

	show_message("image not found: "+working_directory + sprite_filename);
}
