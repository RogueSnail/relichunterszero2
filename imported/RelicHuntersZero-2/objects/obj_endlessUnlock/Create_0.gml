///Setup
event_inherited();

image_speed = 0.2;
image_xscale = -1;
depth = -y;

price = 6000;
allowBuy = false;
unlock = false;

range = 120;
in_range = false;

myPrompt = instance_create(x-42,y+30,fx_prompt_e);
myPrompt.owner = id;

name = loc_key("GUNNAR_INFO_ENDLESS_UNLOCK");
myInfo = instance_create(x,y,fx_info_pickup);
myInfo.owner = id;

myBalloon = noone;

