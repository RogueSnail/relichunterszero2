event_inherited();

range = 130;
in_range = false;
overshield = 50;
active = false;

myPrompt = instance_create_layer(x+10,y-25,"Interactive",fx_prompt_e);
myPrompt.owner = id;
image_speed = 0;

name = loc_key("INFO_SHIELDPLUS");
myInfo = instance_create_layer(x,y,"Interactive",fx_info_pickup);
myInfo.owner = id;

depth=-y-2;

reflection_object_setup(25,-1,image_index);

on_top_of_object = false;

