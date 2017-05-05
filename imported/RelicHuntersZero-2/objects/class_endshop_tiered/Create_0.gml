///Setup
event_inherited();

spawnObject = noone;
unlock = false;

price = 0;

range = 100;
in_range = false;

myPrompt = instance_create(x-30,y-21,fx_prompt_e);
myPrompt.owner = id;

name = "I AM ERROR";
myInfo = instance_create(x,y,fx_info_pickup);
myInfo.owner = id;

image_speed = 0;
depth = -y-25;

