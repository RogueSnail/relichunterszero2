// load json config file
filename = argument[0];

//x position
if (argument_count > 1) {
	posX = argument[1];
}
else {
	posX = random_range(0,room_width);
}

//y position
if (argument_count > 2) {
	posY = argument[2];
}
else {
	posY = random_range(0,room_width);
}

emptyPlayer = instance_create_layer(posX,posY,"Instances", obj_player);
emptyPlayer.configFilename = filename;

with (emptyPlayer)
{
    load_character_config();
	persistent = true;
	show_debug_message(name);
}
