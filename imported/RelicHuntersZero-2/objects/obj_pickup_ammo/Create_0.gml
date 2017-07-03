///Bouncing Coins
magnet_range = 110;
magnet_accel = 720;
magnet_speed_max = 720;
magnet_friction = 30;

magnet_player = noone;

ammoType = type_light;
myAmmo = 4;
isInteractive = true;
interactionTime = room_speed*2; // used for alarm

alpha = 1;
alpha_duration = 100000;//room_speed*0.1;
alpha_duration_current = 0;
myTime = 0;
life_time = (random_range(12,15)) * 1000000;//room_speed*(random_range(12,15));
alert_time = 8000000;//room_speed*8;

sprite = spr_pickup_ammo;
sprite_subimage = 0; // 0=heavy 1=light 2=medium
draw_height = -40;

vertical_speed_start = irandom_range(3,6) * global.target_fps;
interactive_speed = vertical_speed_start;
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 80;//0.5;
fake_gravity = 720;//0.3;

bounce_min = 50;//1;
bounce_max = 100;//2;

speed_per_second = irandom_range(30,100);
//friction_per_second = 0.05 * global.target_fps;

//speed = random_range(2,4);
//friction = 0.05;
 
randomizeDir = false;
image_speed = 0.2;

direction = random(360);

//Relic Buff
if (global.relic_watchful_eye == 2) myAmmo = round(myAmmo * global.watchfulEyePickupBonus);
