event_inherited();

elite = true;
energy_max = 100;
energy_max += global.challengeHighTech*(min( round(energy_max*global.challengeHighTechMultiplier), global.challengeHighTechMax) );
hp_max = 200;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 10;
aggro_cost_chase = 2;

fire_range = 1000;
speed_walk = 2.5;
speed_sprint = 3.2;

ai_dash_chance = 5;
ai_dash_cooldown = room_speed*2;

ai_supression = false;

sprite_hit = spr_duck3_hit;
sprite_walk = spr_duck3_walk;
sprite_idle = spr_duck3_idle;
sprite_dash = spr_duck3_dash;
sprite_death = spr_duck3_death;
sprite_death2 = spr_duck3_death2;
sprite_death3 = spr_duck3_death3;
sprite_death_precision = spr_duck_death_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_rocketlauncher_enemy);
    my_gun.owner = id;
}

grenade_count_max = 0;
drop_gun = obj_pickup_rocketlauncher;

coins = global.coins_duck3;

