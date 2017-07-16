///Bouncing Stuff
sprite = spr_casing;
sprite_subimage = 0;
draw_height = -40;

sprite_angle = 0;
angular_min = -10 * global.target_fps;
angular_max = 10 * global.target_fps;
angular_speed = irandom_range(angular_min,angular_max);

vertical_speed_start = irandom_range(3,6) * global.target_fps;
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 0.5 * global.target_fps;
fake_gravity = 15 * global.target_fps;//0.3;

timeToBounce = false;
firstBounce = false;
bounce_min = 1 * global.target_fps;
bounce_max = 2 * global.target_fps;
playAudio = false;

//speed = random_range(2,4);
speed_per_second = irandom_range(0.5, 2) * global.target_fps;
dirMin = -30;
dirMax = 30;
direction = 180 + random_range(dirMin,dirMax);
//friction = 0.05;
friction_per_second = 0.05 * global.target_fps;
 
randomizeDir = false;

finalAngle[0] = 90;
finalAngle[1] = 90;
finalAngle[2] = 90;
finalAngle[3] = 90;
