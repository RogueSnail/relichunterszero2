///Main Variables
event_inherited();

active = false;
full_relic = false;
equipped = false;
myTable = noone;

relicName = "";
relicDescription = "";

range = 95;
in_range = false;

myPrompt = instance_create(x,y-21,fx_prompt_e);
myPrompt.owner = id;

toggle = false;

image_speed = 0;
image_index = irandom(image_number-1);
depth=-y-30;

