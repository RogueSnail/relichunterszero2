event_inherited();
price = global.price_shotgun;
unlock = false;
active = true;

range = 80;
in_range = false;

myPrompt = instance_create_layer(x-30,y-21,"Interactive",fx_prompt_e);
myPrompt.owner = id;

name = "I AM ERROR";
myWeaponInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
myWeaponInfo.owner = id;


gun_ammo_current = 999;

image_speed = 0;

depth = -y-25;

weaponName = "I AM ERROR";

shopType = "weapon";

