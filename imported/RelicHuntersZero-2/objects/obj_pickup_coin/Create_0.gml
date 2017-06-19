///Bouncing Coins
magnet_range = 110;
magnet_accel = 720;
magnet_speed_max = 720;
magnet_friction = 30;

magnet_player = noone;

alpha = 1;
alpha_duration = 100000;//room_speed*0.1;
alpha_duration_current = 0;
myTime = 0;
life_time = 12 * 1000000;//(irandom_range(12,15)) * 1000000;//room_speed*(random_range(12,15));
alert_time = 8000000;//room_speed*8;

sprite1 = spr_coin_drop;
sprite2 = spr_coin_ground;
sprite = sprite1;
sprite_subimage = 0;
draw_height = -40;

vertical_speed_start = irandom_range(200,300);
interactive_speed = vertical_speed_start;
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 80;
bounce_min = 50;
bounce_max = 100;
fake_gravity = 720;


speed_per_second = irandom_range(30,100);
//friction_per_second = 0.05 * global.target_fps;

//speed = random_range(2,4);
//friction = 0.05;
 
randomizeDir = false;
image_speed = 0.2;

direction = random(360);

