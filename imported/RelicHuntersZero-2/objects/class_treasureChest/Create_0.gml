///Setup
event_inherited();
spawnRelic = noone;
spawnWeapon = noone;
spawnCoins = 0;
spawnSprite = noone;
spawnChallenge = "";

audio_play_sound(sfx_relic_on,99,false);
unlock = false;

fxObject = fx_chestRegular;

canActivate = false;
activateTime = room_speed*0.6;
activateTimeCurrent = 0;

image_speed = 0.2;
image_xscale = 2
image_yscale = 2;

depth = -y-16;

range = 130;
in_range = false;

myPrompt = instance_create(x+10,y-25,fx_prompt_e);
myPrompt.owner = id;

name = loc_key("INFO_TREASURECHEST");
myWeaponInfo = instance_create(x,y,fx_info_pickup);
myWeaponInfo.owner = id;

reflection_object_setup(25,-1,image_index);

