event_inherited();

sound = "pistol";
ammo_type = type_heavy;

projectile_obj = obj_projectile_skullEnemy;

projectile_speed = 0.02;
projectile_speed_decay = -0.085;
projectile_damage = 15;
projectile_range = 1200;

accuracy = 50;

fire_burst = irandom_range(6,9);
fire_burst_rate = 100000;//room_speed*0.1;
fire_rate = irandom_range(room_speed*2,room_speed*4);

