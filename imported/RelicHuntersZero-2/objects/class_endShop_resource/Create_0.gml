///Setup
event_inherited();

unlock = false;

priceCurrent = 0;
priceTier = global.endPriceTier_lightAmmo;
priceArray = global.endPrice_lightAmmo;

canActivate = true;
infoString = "";

range = 100;
in_range = false;

myPrompt = instance_create_layer(x-30,y-21,"Interactive",fx_prompt_e);
myPrompt.owner = id;

name = "I AM ERROR";
myInfo = instance_create_layer(x,y,"Interactive",fx_info_pickup);
myInfo.owner = id;

image_speed = 0;
depth = -y-25;

