event_inherited();

weaponLevel = 0;

range = 130;
in_range = false;
if sprite_exists(sprite_index) sprite = sprite_index;
gun = noone;
gun_ammo_current = 99999;
active = false;

myPrompt = instance_create(x+10,y-25,fx_prompt_e);
myPrompt.owner = id;

name = "I AM ERROR";
myWeaponInfo = instance_create(x,y,fx_info_pickup);
myWeaponInfo.owner = id;

depth=-y-5;
image_speed = 0;

reflection_object_setup(25,-1,image_index);

on_top_of_object = false;
image_speed = 0;

wantToActivate = false;
activationClient = noone;

sprite = sprite_index;

arrowAnimation = 0; 
arrowAnimationSpeed = 0.2;

