///Setup

event_inherited();

image_speed = 0;

price = 800;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x-44,y-21,"Interactive",fx_prompt_e);
myPrompt.owner = id;

name = loc_key("TERMINAL_RESET_DESC");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
myInfo.owner = id;

depth = -y-32;

